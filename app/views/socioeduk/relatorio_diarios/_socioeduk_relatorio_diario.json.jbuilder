json.extract! socioeduk_relatorio_diario, :id, :usuario_id, :unidade_socioeducativa_id, :int_mas, :int_fem, :ip_mas, :ip_fem, :sl_mas, :sl_fem, :capacidade_nominal, :capacidade_real, :socioeducador_homem, :socioeducador_mulher, :capacidade_por_adolescente, :evasao, :fuga, :descumprimento, :situacao_crise, :resumo, :created_at, :updated_at
json.url socioeduk_relatorio_diario_url(socioeduk_relatorio_diario, format: :json)