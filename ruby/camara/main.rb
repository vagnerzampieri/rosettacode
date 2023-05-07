require "rubygems"
require "bundler/setup"
require "pry"
require "csv"

Bundler.require(:default)

def client
  @client ||=
    Faraday.new(
      url: "https://dadosabertos.camara.leg.br/api/v2/",
      headers: {
        Accept: "application/json",
        "Content-type": "application/json"
      },
      request: {
        params_encoder: Faraday::FlatParamsEncoder
      }
    )
end

def proposicoes_payload(ano)
  {
    ano: ano,
    itens: 100,
    pagina: 1,
    keywords: [
      "bicicleta",
      "transporte ativo",
      "ciclovia",
      "mobilidade ativa",
      "mobilidade sustentável",
      "transporte por bicicleta"
    ]
  }
end

def parsed(response)
  JSON.parse(response.body)["dados"]
end

def get_data(ano)
  proposicoes_response = client.get("proposicoes", proposicoes_payload(ano))

  # checar pra ver quantidade de páginas
  # percorrer todas as páginas
  # ir salvando em um CSV
  # inserir o link de acesso para o texto na integra da ementa

  proposicoes = parsed(proposicoes_response)

  proposicoes.map do |prop|
    proposicao_response = client.get("proposicoes/#{prop["id"]}")
    proposicao = parsed(proposicao_response)

    puts proposicao

    autores_response = client.get("proposicoes/#{prop["id"]}/autores")
    autores = parsed(autores_response)
    autor = autores.map { |autor| autor["nome"] }.join(" - ")

    @data << {
      id: proposicao["id"],
      ano: proposicao["ano"],
      status: proposicao["statusProposicao"]["descricaoSituacao"],
      ementa: proposicao["ementa"],
      autor: autor,
      url: proposicao["urlInteiroTeor"]
    }
  end
end

def generate_csv(file_name)
  CSV.open("proposicoes-#{file_name}-#{Date.today}.csv", "w") do |csv|
    csv << %w[id ano status ementa autor url]

    @data.map do |datum|
      csv << [
        datum[:id],
        datum[:ano],
        datum[:status],
        datum[:ementa],
        datum[:autor],
        datum[:url]
      ]
    end
  end
end

@data = []

(1964..2009).map { |ano| get_data(ano) }
generate_csv("1964-2009")

(2010..2023).map { |ano| get_data(ano) }
generate_csv("2010-2023")
