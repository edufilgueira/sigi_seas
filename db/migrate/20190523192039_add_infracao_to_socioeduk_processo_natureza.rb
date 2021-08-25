class AddInfracaoToSocioedukProcessoNatureza < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_processo_naturezas, :socioeduk_artigo_infracao, foreign_key: true, index: {:name => "artigo_infracao_processo_natureza"}
    add_reference :socioeduk_processo_naturezas, :socioeduk_artigo_paragrafo, foreign_key: true, index: {:name => "artigo_paragrafo_processo_natureza"}
    add_reference :socioeduk_processo_naturezas, :socioeduk_artigo_inciso, foreign_key: true, index: {:name => "artigo_inciso_processo_natureza"}
    add_reference :socioeduk_processo_naturezas, :socioeduk_artigo_alinea, foreign_key: true, index: {:name => "artigo_alinea_processo_natureza"}
  end
end
