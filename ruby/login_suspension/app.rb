# frozen_string_literal: true

require 'sinatra'
require 'mongoid'

require 'bcrypt'
require 'device_detector'
require 'dry-transaction'
require 'dry-validation'
require 'geocoder'

require 'debug'
require 'ruby-prof'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :sign_in_activities

  field :email, type: String
  field :password, type: String
  field :login_attempts, type: Integer, default: 0
  field :locked_at, type: Time

  # encript password as default
  def password=(password)
    self[:password] = BCrypt::Password.create(password).to_s
  end

  def password_matches?(password)
    BCrypt::Password.new(self.password) == password
  end
end

class SignInActivity
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :email, type: String
  field :user_agent, type: String
  field :ip, type: String
  field :browser, type: String
  field :browser_version, type: String
  field :os_name, type: String
  field :os_version, type: String
  field :device_name, type: String
  field :device_type, type: String
  field :crountry, type: String
  field :city, type: String
  field :asn_isp, type: String
  field :criteria_score, type: Integer
  field :criteria_score_normalized, type: Float
  field :criteria, type: Hash
end

class LoginContract < Dry::Validation::Contract
  params do
    required(:email).filled
    required(:password).filled
  end

  rule(:email) do
    # check if email is valid
    key.failure('is invalid') unless /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.match?(value)
  end

  rule(:password) do
    # check if password is at least 8 characters long and
    key.failure('is too short') if value.length < 8
  end
end

class SignInActivityContract < Dry::Validation::Contract
  params do
    required(:email).filled
    required(:user_agent).filled
    required(:ip).filled
    required(:browser).filled
    required(:browser_version).filled
    required(:os_name).filled
    required(:os_version).filled
    required(:device_name).filled
    required(:device_type).filled
    required(:country).filled
    required(:city).filled
    required(:asn_isp).filled
    optional(:criteria_score)
    optional(:criteria_score_normalized)
    optional(:criteria)
  end
end

# fazer o simples e depois tentar usar transactions
class SignInActivityAnalysis
  ConfigCriteria = Struct.new(:ip_browser, :ip_os_name, :ip_device, :ip_asn_isp, :country, :os_name)

  def initialize(user:, sign_in_activity:)
    @user = user
    @sign_in_activity = sign_in_activity
  end

  def call
    # condição que checa as últimas 5 atividades de login
    old_activities = user.sign_in_activities.order(created_at: :desc).not.where(_id: sign_in_activity.id).limit(4)
    os_name_changed = old_activities.any? { |activity| activity.os_name != sign_in_activity.os_name }

    {
      score:,
      score_normalized:,
      criteria:
    }
  end

  private

  attr_reader :user, :sign_in_activity

  def score
  end

  def score_normalized
  end

  def criteria
  end

  def config
    # ip + browser = 5 (se for mobile == 0)
    # ip + os = 5 (se for mobile == 0)
    # ip + device = 5 (se for mobile == 0)
    # ip + asn_isp = 10 (se for mobile == 0)
    # country = 1
    ConfigCriteria.new(5, 5, 5, 10, 1, 1)
  end
end

get '/' do
  'Hello World'
end

post '/sign_in' do
  result = LoginContract.new.call(params)

  if result.success?
    user = User.find_by(email: params[:email])

    if user&.password_matches?(params[:password])
      user_agent = request.user_agent
      ip = request.ip
      device = DeviceDetector.new(user_agent)
      geocoder = Geocoder.search(ip).first

      session[:user_id] = user.id
      session[:device_name] = device.device_name
      session[:device_type] = device.device_type

      sign_in_activity = SignInActivity.create(
        user:,
        user_agent:,
        ip:,
        email: user.email,
        browser: device.name,
        browser_version: device.full_version,
        os_name: device.os_name,
        os_version: device.os_full_version,
        device_name: device.device_name,
        device_type: device.device_type,
        city: geocoder.city,
        country: geocoder.country,
        asn_isp: geocoder.data['org']
      )

      analysis = SignInActivityAnalysis.new.call(user:, sign_in_activity:)

      # fazer a análise e aí decidir se bloqueia ou não
      user.update(login_attempts: 0, locked_at: nil)
      'Success'
    else
      user&.update(login_attempts: user.login_attempts + 1)

      if user&.login_attempts.to_i >= 3
        user.update(locked_at: Time.now)
        'Account locked'
      else
        'Invalid email or password'
      end
    end
  else
    result.errors.to_h.to_s
  end
end
