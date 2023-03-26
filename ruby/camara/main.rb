require "rubygems"
require "bundler/setup"
require "pry"

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

# ..2009, 2010..

def proposicoes_payload
  {
    ano: 2010,
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

proposicoes_response = client.get("proposicoes", proposicoes_payload)

# checar pra ver quantidade de páginas
# percorrer todas as páginas
# ir salvando em um CSV

proposicoes = parsed(proposicoes_response)

data = []

proposicoes.map do |prop|
  proposicao_response = client.get("proposicoes/#{prop["id"]}")
  proposicao = parsed(proposicao_response)

  autores_response = client.get("proposicoes/#{prop["id"]}/autores")
  autores = parsed(autores_response)
  autor = autores.map { |autor| autor["nome"] }.join(" - ")

  data << {
    id: proposicao["id"],
    ano: proposicao["ano"],
    status: proposicao["statusProposicao"]["descricaoSituacao"],
    ementa: proposicao["ementa"],
    autor: autor
  }
end

puts data

# CSV.open("proposicoes.csv", "w") do |csv|
#   csv << %w[id ano status ementa autor]

#   data.map do |datum|
#     csv << [
#       datum[:id],
#       datum[:ano],
#       datum[:status],
#       datum[:ementa],
#       datum[:autor]
#     ]
#   end
# end
