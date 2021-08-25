json.extract! solicitacao_patrimonio, :id, :numero_solicitacao, :solicitante, :justificativa, :observacao, :created_at, :updated_at
json.url solicitacao_patrimonio_url(solicitacao_patrimonio, format: :json)
