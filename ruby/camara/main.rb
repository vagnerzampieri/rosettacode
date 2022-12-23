require 'rubygems'
require 'bundler/setup'
require 'pry'

Bundler.require(:default)

def client
  @client ||= Faraday.new(
    url: 'https://dadosabertos.camara.leg.br/api/v2/',
    headers: {
      Accept: 'application/json',
      'Content-type': 'application/json'
    },
    request: {
      params_encoder: Faraday::FlatParamsEncoder
    }
  )
end

def params
  {
    ano: 2022,
    itens: 10,
    pagina: 1,
    keywords: [
      'bicicleta',
      'transporte ativo',
      'ciclovia',
      'mobilidade ativa',
      'mobilidade sustentável',
      'transporte por bicicleta'
    ]
  }
end

response = client.get('proposicoes', params)
# binding.pry

# checar pra ver quantidade de páginas
# percorrer todas as páginas
# ir salvando em um CSV

JSON.parse(response.body)['dados'].map do |data|
  data
end
