# Atualiza os dados de proposições de mobilidade ativa, buscando os anos que
# faltam (de 2024 até o ano atual) na API de Dados Abertos da Câmara.
#
# Mantém o mesmo filtro de palavras-chave do main.rb e o formato de 5 colunas
# dos CSVs canônicos (id,ano,status,ementa,autor). Diferente do main.rb, aqui a
# paginação está implementada: percorre todas as páginas seguindo o link "next".
#
# Uso: ruby atualizar.rb
require "faraday"
require "json"
require "csv"

START_YEAR = 2024
END_YEAR = Time.now.year

KEYWORDS = [
  "bicicleta",
  "transporte ativo",
  "ciclovia",
  "mobilidade ativa",
  "mobilidade sustentável",
  "transporte por bicicleta"
].freeze

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

def parsed(response)
  JSON.parse(response.body)
end

# Percorre todas as páginas de proposições de um ano seguindo o link rel:next.
def proposicoes_do_ano(ano)
  proposicoes = []
  response = client.get(
    "proposicoes",
    ano: ano, itens: 100, pagina: 1, keywords: KEYWORDS
  )

  loop do
    body = parsed(response)
    proposicoes.concat(body["dados"])

    proxima = body["links"].find { |link| link["rel"] == "next" }
    break unless proxima

    # O href já vem com toda a query string; passamos absoluto e sem params.
    response = client.get(proxima["href"])
  end

  proposicoes
end

# Para cada proposição, busca o detalhe (status) e a lista de autores.
def detalhar(prop)
  proposicao = parsed(client.get("proposicoes/#{prop["id"]}"))["dados"]
  autores = parsed(client.get("proposicoes/#{prop["id"]}/autores"))["dados"]

  {
    id: proposicao["id"],
    ano: proposicao["ano"],
    status: proposicao["statusProposicao"]["descricaoSituacao"],
    ementa: proposicao["ementa"],
    autor: autores.map { |autor| autor["nome"] }.join(" - ")
  }
end

dados = []

(START_YEAR..END_YEAR).each do |ano|
  props = proposicoes_do_ano(ano)
  puts "#{ano}: #{props.size} proposições"
  props.each { |prop| dados << detalhar(prop) }
end

arquivo = "proposicoes-#{START_YEAR}-#{END_YEAR}.csv"
CSV.open(arquivo, "w") do |csv|
  csv << %w[id ano status ementa autor]
  dados.each do |d|
    csv << [d[:id], d[:ano], d[:status], d[:ementa], d[:autor]]
  end
end

puts "Gerado #{arquivo} com #{dados.size} proposições (#{START_YEAR}–#{END_YEAR})."
