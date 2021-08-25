json.extract! gestao_demandas_solicitacao, :id, :titulo, :descricao, :usuario_id, :created_at, :updated_at
json.url gestao_demandas_solicitacao_url(gestao_demandas_solicitacao, format: :json)
