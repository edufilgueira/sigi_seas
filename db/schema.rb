# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210709141324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "andamentos", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "destinatario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "carga_type"
    t.bigint "carga_id"
    t.index ["carga_type", "carga_id"], name: "index_andamentos_on_carga_type_and_carga_id"
    t.index ["destinatario_id"], name: "index_andamentos_on_destinatario_id"
    t.index ["usuario_id"], name: "index_andamentos_on_usuario_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "nome"
    t.integer "subarea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "sigla", limit: 10
    t.bigint "unidade_socioeducativa_id"
    t.index ["unidade_socioeducativa_id"], name: "index_areas_on_unidade_socioeducativa_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "bairros", force: :cascade do |t|
    t.bigint "cidade_id"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_bairros_on_cidade_id"
  end

  create_table "biblioteca_autores", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "biblioteca_editoras", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "biblioteca_emprestimos", force: :cascade do |t|
    t.bigint "pessoa_id"
    t.integer "status"
    t.date "data"
    t.text "nota"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "data_retorno"
    t.bigint "biblioteca_livro_id"
    t.index ["biblioteca_livro_id"], name: "index_biblioteca_emprestimos_on_biblioteca_livro_id"
    t.index ["pessoa_id"], name: "index_biblioteca_emprestimos_on_pessoa_id"
    t.index ["usuario_id"], name: "index_biblioteca_emprestimos_on_usuario_id"
  end

  create_table "biblioteca_livros", force: :cascade do |t|
    t.string "titulo"
    t.text "sinopse"
    t.bigint "biblioteca_autor_id"
    t.bigint "biblioteca_local_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "biblioteca_local_publicacao_id"
    t.bigint "biblioteca_editora_id"
    t.date "data_publicacao"
    t.integer "paginacao"
    t.string "assunto1"
    t.string "assunto2"
    t.string "css_cdu"
    t.string "isbn"
    t.string "cutter"
    t.index ["biblioteca_autor_id"], name: "index_biblioteca_livros_on_biblioteca_autor_id"
    t.index ["biblioteca_editora_id"], name: "index_biblioteca_livros_on_biblioteca_editora_id"
    t.index ["biblioteca_local_id"], name: "index_biblioteca_livros_on_biblioteca_local_id"
    t.index ["biblioteca_local_publicacao_id"], name: "index_biblioteca_livros_on_biblioteca_local_publicacao_id"
  end

  create_table "biblioteca_locais", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "biblioteca_local_publicacoes", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "capacidades_diarias", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_id"
    t.integer "capacidade"
    t.date "data_referencia"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_socioeducativa_id"], name: "index_capacidades_diarias_on_unidade_socioeducativa_id"
    t.index ["usuario_id"], name: "index_capacidades_diarias_on_usuario_id"
  end

  create_table "capacidades_originais", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_id"
    t.integer "capacidade"
    t.date "data_referencia"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_socioeducativa_id"], name: "index_capacidades_originais_on_unidade_socioeducativa_id"
    t.index ["usuario_id"], name: "index_capacidades_originais_on_usuario_id"
  end

  create_table "categoria_patrimonios", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.boolean "capital"
    t.bigint "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "regiao_pai"
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "classe_materiais", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "grupo_material_id"
    t.integer "codigo"
    t.index ["grupo_material_id"], name: "index_classe_materiais_on_grupo_material_id"
  end

  create_table "classe_patrimonios", force: :cascade do |t|
    t.bigint "grupo_patrimonio_id"
    t.string "codigo"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grupo_patrimonio_id"], name: "index_classe_patrimonios_on_grupo_patrimonio_id"
  end

  create_table "coleta_indicadores", force: :cascade do |t|
    t.bigint "indicador_id"
    t.string "abrangencia_coleta"
    t.integer "area_id"
    t.integer "pessoa_id"
    t.string "indice"
    t.integer "semestre"
    t.integer "quadrimestre"
    t.integer "trimestre"
    t.integer "mes"
    t.integer "quinzena"
    t.integer "semana"
    t.integer "ano"
    t.string "periodo_coleta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dia"
    t.index ["indicador_id"], name: "index_coleta_indicadores_on_indicador_id"
  end

  create_table "depositos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eixos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "acronym"
    t.bigint "regiao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regiao_id"], name: "index_estados_on_regiao_id"
  end

  create_table "funcao_pessoas", force: :cascade do |t|
    t.bigint "funcao_id"
    t.bigint "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.index ["funcao_id"], name: "index_funcao_pessoas_on_funcao_id"
    t.index ["pessoa_id"], name: "index_funcao_pessoas_on_pessoa_id"
  end

  create_table "funcoes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gestao_demandas_solicitacoes", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_gestao_demandas_solicitacoes_on_usuario_id"
  end

  create_table "gestores_areas", force: :cascade do |t|
    t.bigint "area_id"
    t.bigint "pessoa_id"
    t.date "data_inicio"
    t.date "data_termino"
    t.boolean "ativo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["area_id"], name: "index_gestores_areas_on_area_id"
    t.index ["pessoa_id"], name: "index_gestores_areas_on_pessoa_id"
  end

  create_table "gestores_eixos", force: :cascade do |t|
    t.bigint "eixo_id"
    t.bigint "pessoa_id"
    t.date "data_inicio"
    t.date "data_termino"
    t.boolean "ativo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["eixo_id"], name: "index_gestores_eixos_on_eixo_id"
    t.index ["pessoa_id"], name: "index_gestores_eixos_on_pessoa_id"
  end

  create_table "gestores_unidades", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_id"
    t.bigint "pessoa_id"
    t.date "data_inicio"
    t.date "data_termino"
    t.boolean "ativo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["pessoa_id"], name: "index_gestores_unidades_on_pessoa_id"
    t.index ["unidade_socioeducativa_id"], name: "index_gestores_unidades_on_unidade_socioeducativa_id"
  end

  create_table "grupo_materiais", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "codigo"
  end

  create_table "grupo_patrimonios", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categoria_patrimonio_id"
    t.index ["categoria_patrimonio_id"], name: "index_grupo_patrimonios_on_categoria_patrimonio_id"
  end

  create_table "indicador_assuntos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicador_unidade_medidas", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicadores", force: :cascade do |t|
    t.bigint "indicador_unidade_medida_id"
    t.bigint "area_id"
    t.string "melhor_sentido"
    t.text "objetivo"
    t.string "abrangencia"
    t.string "periodicidade_coleta"
    t.text "como_coletar"
    t.string "periodicidade_avaliacao"
    t.text "como_calcular"
    t.string "assunto"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "indicador_assunto_id"
    t.index ["area_id"], name: "index_indicadores_on_area_id"
    t.index ["indicador_unidade_medida_id"], name: "index_indicadores_on_indicador_unidade_medida_id"
  end

  create_table "item_patrimonios", force: :cascade do |t|
    t.bigint "classe_patrimonio_id"
    t.bigint "tipo_patrimonio_id"
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.datetime "deleted_at"
    t.index ["classe_patrimonio_id"], name: "index_item_patrimonios_on_classe_patrimonio_id"
    t.index ["deleted_at"], name: "index_item_patrimonios_on_deleted_at"
    t.index ["tipo_patrimonio_id"], name: "index_item_patrimonios_on_tipo_patrimonio_id"
  end

  create_table "itens_solicitacao_patrimonios", force: :cascade do |t|
    t.bigint "solicitacao_patrimonio_id"
    t.bigint "item_patrimonio_id"
    t.integer "quantidade_solicitada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantidade_entregue"
    t.index ["item_patrimonio_id"], name: "index_itens_solicitacao_patrimonios_on_item_patrimonio_id"
    t.index ["solicitacao_patrimonio_id"], name: "index_itens_solicitacao_patrimonios_on_solicitacao_patrimoni_id"
  end

  create_table "local_armazenamentos", force: :cascade do |t|
    t.string "descricao_local"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_socioeducativa_id"], name: "index_local_armazenamentos_on_unidade_socioeducativa_id"
  end

  create_table "mapa_de_bordos", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.integer "tipo_vistoria"
    t.date "data_vistoria"
    t.bigint "responsavel_id"
    t.bigint "motorista_id"
    t.float "km_inicial"
    t.datetime "hora_inicial"
    t.float "km_final"
    t.datetime "hora_final"
    t.text "percurso"
    t.text "parecer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["motorista_id"], name: "index_mapa_de_bordos_on_motorista_id"
    t.index ["responsavel_id"], name: "index_mapa_de_bordos_on_responsavel_id"
    t.index ["veiculo_id"], name: "index_mapa_de_bordos_on_veiculo_id"
  end

  create_table "marca_veiculos", force: :cascade do |t|
    t.string "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materiais", force: :cascade do |t|
    t.string "nome"
    t.bigint "unidades_medida_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "descricao"
    t.bigint "classe_material_id"
    t.bigint "local_armazenamento_id"
    t.decimal "quantidade"
    t.index ["classe_material_id"], name: "index_materiais_on_classe_material_id"
    t.index ["local_armazenamento_id"], name: "index_materiais_on_local_armazenamento_id"
    t.index ["unidades_medida_id"], name: "index_materiais_on_unidades_medida_id"
  end

  create_table "material_movimentacoes", force: :cascade do |t|
    t.bigint "material_id"
    t.bigint "unidade_socioeducativa_id"
    t.integer "quantidade_movimentada"
    t.string "tipo_movimentacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_material_movimentacoes_on_material_id"
    t.index ["unidade_socioeducativa_id"], name: "index_material_movimentacoes_on_unidade_socioeducativa_id"
  end

  create_table "modelos_marcas", force: :cascade do |t|
    t.string "modelo"
    t.bigint "marca_veiculo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_veiculo_id"], name: "index_modelos_marcas_on_marca_veiculo_id"
  end

  create_table "motoristas", force: :cascade do |t|
    t.string "numero"
    t.string "registro"
    t.date "validade"
    t.string "categoria"
    t.text "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pessoa_id"
    t.string "status"
    t.index ["pessoa_id"], name: "index_motoristas_on_pessoa_id"
  end

  create_table "patrimonios", force: :cascade do |t|
    t.string "tombo_anterior"
    t.string "origem_anterior"
    t.string "tombo_atual"
    t.string "origem_atual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "status_patrimonio_id"
    t.bigint "deposito_id"
    t.string "ciclo_vida_util"
    t.decimal "valor"
    t.string "nota_fiscal"
    t.bigint "item_patrimonio_id"
    t.datetime "deleted_at"
    t.integer "subarea_id"
    t.bigint "unidade_socioeducativa_id"
    t.bigint "area_id"
    t.index ["area_id"], name: "index_patrimonios_on_area_id"
    t.index ["deleted_at"], name: "index_patrimonios_on_deleted_at"
    t.index ["deposito_id"], name: "index_patrimonios_on_deposito_id"
    t.index ["item_patrimonio_id"], name: "index_patrimonios_on_item_patrimonio_id"
    t.index ["status_patrimonio_id"], name: "index_patrimonios_on_status_patrimonio_id"
    t.index ["unidade_socioeducativa_id"], name: "index_patrimonios_on_unidade_socioeducativa_id"
  end

  create_table "permissoes", force: :cascade do |t|
    t.string "perfil"
    t.text "recursos", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "usuario_id"
    t.string "nome_pai"
    t.string "nome_mae"
    t.string "estado_civil"
    t.string "conjuge"
    t.string "profissao"
    t.date "data_nascimento"
    t.string "naturalidade"
    t.string "uf"
    t.string "tipo_sanguineo"
    t.string "sexo"
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "celular"
    t.string "pis"
    t.string "ctps"
    t.string "serie"
    t.string "rg"
    t.string "emissor"
    t.string "emissao"
    t.string "certificado_militar"
    t.string "emissor_militar"
    t.string "banco"
    t.string "agencia"
    t.string "conta_corrente"
    t.string "titulo_eleitoral"
    t.string "zona"
    t.string "secao"
    t.date "data_contratacao"
    t.string "email_pessoal"
    t.string "cidade_eleitoral"
    t.string "estado_eleitoral"
    t.boolean "ponto_obrigatorio"
    t.bigint "tipo_pessoa_id"
    t.bigint "cidade_id"
    t.integer "juiz_id"
    t.bigint "socioeduk_comarca_id"
    t.index ["cidade_id"], name: "index_pessoas_on_cidade_id"
    t.index ["socioeduk_comarca_id"], name: "index_pessoas_on_socioeduk_comarca_id"
    t.index ["tipo_pessoa_id"], name: "index_pessoas_on_tipo_pessoa_id"
    t.index ["usuario_id"], name: "index_pessoas_on_usuario_id"
  end

  create_table "posto_combustiveis", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "rua"
    t.string "numero"
    t.string "bairro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recursoshumanos_aditivos", force: :cascade do |t|
    t.bigint "recursoshumanos_contrato_id"
    t.bigint "recursoshumanos_justificativa_aditivo_id"
    t.string "numero_processo"
    t.string "descricao"
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anexo_file_name"
    t.string "anexo_content_type"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.index ["recursoshumanos_contrato_id"], name: "index_recursoshumanos_aditivos_on_recursoshumanos_contrato_id"
    t.index ["recursoshumanos_justificativa_aditivo_id"], name: "justificativa_aditivo"
  end

  create_table "recursoshumanos_cargo_aditivos", force: :cascade do |t|
    t.bigint "recursoshumanos_cargo_id"
    t.bigint "recursoshumanos_aditivo_id"
    t.integer "qtd_anterior"
    t.string "operacao"
    t.integer "qtd_adicionado"
    t.integer "qtd_atual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recursoshumanos_aditivo_id"], name: "rh_aditivo"
    t.index ["recursoshumanos_cargo_id"], name: "rh_cargo_aditivo"
  end

  create_table "recursoshumanos_cargos", force: :cascade do |t|
    t.string "nome"
    t.integer "quantidade"
    t.bigint "contrato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "simbolo"
    t.index ["contrato_id"], name: "index_recursoshumanos_cargos_on_contrato_id"
  end

  create_table "recursoshumanos_contratos", force: :cascade do |t|
    t.bigint "recursoshumanos_tipo_legal_id"
    t.bigint "recursoshumanos_tipo_vinculo_id"
    t.string "inicio"
    t.integer "numero"
    t.integer "ano"
    t.string "doe_ce"
    t.date "data_doe_ce"
    t.integer "pagina_doe_ce"
    t.date "inicio_vigencia"
    t.date "final_vigencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recursoshumanos_tipo_legal_id"], name: "rec_hum_tip_legal"
    t.index ["recursoshumanos_tipo_vinculo_id"], name: "rec_hum_vinc_legal"
  end

  create_table "recursoshumanos_justificativa_aditivos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recursoshumanos_tipo_legais", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recursoshumanos_tipo_vinculo_id"
    t.index ["recursoshumanos_tipo_vinculo_id"], name: "rec_tipo_legal_tipo_vinculo"
  end

  create_table "recursoshumanos_tipo_vinculos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recursoshumanos_vinculos", force: :cascade do |t|
    t.date "data_inicio"
    t.date "data_fim"
    t.bigint "recursoshumanos_cargo_id"
    t.bigint "pessoas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unidade_socioeducativa_area_id"
    t.index ["pessoas_id"], name: "index_recursoshumanos_vinculos_on_pessoas_id"
    t.index ["recursoshumanos_cargo_id"], name: "index_recursoshumanos_vinculos_on_recursoshumanos_cargo_id"
    t.index ["unidade_socioeducativa_area_id"], name: "unidade_socioeducativa_area_Vinculo"
  end

  create_table "regioes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicos", force: :cascade do |t|
    t.bigint "eixo_id"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["eixo_id"], name: "index_servicos_on_eixo_id"
  end

  create_table "servicos_realizados", force: :cascade do |t|
    t.bigint "eixo_id"
    t.bigint "gestor_eixo_id"
    t.bigint "unidade_socioeducativa_id"
    t.bigint "gestor_unidade_id"
    t.bigint "area_id"
    t.bigint "gestor_area_id"
    t.bigint "qtd_socioeducandos_atendidos"
    t.bigint "servico_id"
    t.integer "quantidade_realizados"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "meta"
    t.decimal "desempenho_meta", precision: 8, scale: 2
    t.integer "ano"
    t.integer "mes"
    t.index ["area_id"], name: "index_servicos_realizados_on_area_id"
    t.index ["eixo_id"], name: "index_servicos_realizados_on_eixo_id"
    t.index ["gestor_area_id"], name: "index_servicos_realizados_on_gestor_area_id"
    t.index ["gestor_eixo_id"], name: "index_servicos_realizados_on_gestor_eixo_id"
    t.index ["gestor_unidade_id"], name: "index_servicos_realizados_on_gestor_unidade_id"
    t.index ["qtd_socioeducandos_atendidos"], name: "index_servicos_realizados_on_qtd_socioeducandos_atendidos"
    t.index ["servico_id"], name: "index_servicos_realizados_on_servico_id"
    t.index ["unidade_socioeducativa_id"], name: "index_servicos_realizados_on_unidade_socioeducativa_id"
  end

  create_table "socioeducandos_atendidos", force: :cascade do |t|
    t.integer "ano"
    t.integer "mes", limit: 2
    t.bigint "unidade_socioeducativa_id"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["unidade_socioeducativa_id"], name: "index_socioeducandos_atendidos_on_unidade_socioeducativa_id"
  end

  create_table "socioeduk_admissao_anexos", force: :cascade do |t|
    t.bigint "jovem_id"
    t.string "kit_file_name"
    t.string "kit_content_type"
    t.integer "kit_file_size"
    t.datetime "kit_updated_at"
    t.string "documentos_file_name"
    t.string "documentos_content_type"
    t.integer "documentos_file_size"
    t.datetime "documentos_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_admissao_anexos_on_jovem_id"
  end

  create_table "socioeduk_admissoes", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "rebebido_em"
    t.integer "tipo_desligamento_id"
    t.datetime "desligado_em"
    t.string "numero_processo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_admissoes_on_jovem_id"
    t.index ["unidade_socioeducativa_id"], name: "index_socioeduk_admissoes_on_unidade_socioeducativa_id"
  end

  create_table "socioeduk_alojamento_jovens", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "unidade_socioeducativa_id"
    t.bigint "socioeduk_bloco_id"
    t.bigint "socioeduk_quarto_id"
    t.string "tamanho_roupa"
    t.string "tamanho_cacaldo"
    t.string "numero_kit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "justifica"
    t.boolean "utilizar_exedente_vaga"
    t.index ["socioeduk_bloco_id"], name: "index_socioeduk_alojamento_jovens_on_socioeduk_bloco_id"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_alojamento_jovens_on_socioeduk_jovem_id"
    t.index ["socioeduk_quarto_id"], name: "index_socioeduk_alojamento_jovens_on_socioeduk_quarto_id"
    t.index ["unidade_socioeducativa_id"], name: "index_socioeduk_alojamento_jovens_on_unidade_socioeducativa_id"
  end

  create_table "socioeduk_artigo_alineas", force: :cascade do |t|
    t.bigint "socioeduk_artigo_inciso_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_artigo_inciso_id"], name: "artigo_inciso_alinea"
  end

  create_table "socioeduk_artigo_incisos", force: :cascade do |t|
    t.bigint "socioeduk_artigo_paragrafo_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_artigo_paragrafo_id"], name: "artigo_paragrafo_inciso"
  end

  create_table "socioeduk_artigo_infracoes", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ponderacao", default: 1
    t.integer "pai_id"
    t.string "nome"
  end

  create_table "socioeduk_artigo_paragrafos", force: :cascade do |t|
    t.bigint "socioeduk_artigo_infracao_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_artigo_infracao_id"], name: "artigo_infracao_paragrafo"
  end

  create_table "socioeduk_atendimento_iniciais", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "entrada_em"
    t.boolean "reincidente"
    t.boolean "cumpre_medida"
    t.string "qual_medida"
    t.string "cidade_infracao"
    t.string "bairro_infracao"
    t.boolean "busca_apreensao"
    t.integer "cidade_origem_processo"
    t.integer "cidade_execucao_processo"
    t.string "numero_oficio_bo"
    t.string "comarca_origem"
    t.string "procedencia"
    t.string "numero_processo"
    t.boolean "guia_corpo_delito"
    t.boolean "alcoolizado"
    t.boolean "drogado"
    t.boolean "ematomas"
    t.string "agressor"
    t.text "observacoes"
    t.string "nome_condutor"
    t.string "funcao_condutor"
    t.string "rg_condutor"
    t.boolean "encaminhado"
    t.datetime "encaminhado_em"
    t.bigint "tipo_desligamento_id"
    t.datetime "desligado_em"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "forma_entrada_id"
    t.bigint "subforma_entrada_id"
    t.index ["forma_entrada_id"], name: "index_socioeduk_atendimento_iniciais_on_forma_entrada_id"
    t.index ["jovem_id"], name: "index_socioeduk_atendimento_iniciais_on_jovem_id"
    t.index ["subforma_entrada_id"], name: "index_socioeduk_atendimento_iniciais_on_subforma_entrada_id"
    t.index ["tipo_desligamento_id"], name: "index_socioeduk_atendimento_iniciais_on_tipo_desligamento_id"
    t.index ["unidade_socioeducativa_id"], name: "atend_inicial_unid_socio"
  end

  create_table "socioeduk_atendimento_inicial_documentos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "atendimento_inicial_id"
    t.bigint "documento_forma_entrada_id"
    t.string "documento_file_name"
    t.string "documento_content_type"
    t.integer "documento_file_size"
    t.datetime "documento_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["atendimento_inicial_id"], name: "index_socioeduk_atendimento_ini_doc_on_atend_ini_id"
    t.index ["documento_forma_entrada_id"], name: "index_socioeduk_atend_ini_docu_on_doc_form_ent_id"
  end

  create_table "socioeduk_audiencias", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.bigint "socioeduk_comarca_id"
    t.string "numero_processo"
    t.datetime "datahora"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_comarca_id"], name: "index_socioeduk_audiencias_on_socioeduk_comarca_id"
    t.index ["socioeduk_processo_id"], name: "index_socioeduk_audiencias_on_socioeduk_processo_id"
  end

  create_table "socioeduk_blocos", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_socioeducativa_id"], name: "index_socioeduk_blocos_on_unidade_socioeducativa_id"
  end

  create_table "socioeduk_cids", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_circunstancias", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_comarcas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_composicao_familiares", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_condicao_fisicas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_configuracao_email_areas", force: :cascade do |t|
    t.bigint "socioeduk_configuracao_email_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_socioeduk_configuracao_email_areas_on_area_id"
    t.index ["socioeduk_configuracao_email_id"], name: "configuracao_email_areas"
  end

  create_table "socioeduk_configuracao_email_funcoes", force: :cascade do |t|
    t.bigint "socioeduk_configuracao_email_id"
    t.bigint "funcao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcao_id"], name: "index_socioeduk_configuracao_email_funcoes_on_funcao_id"
    t.index ["socioeduk_configuracao_email_id"], name: "configuracao_email_funcoes"
  end

  create_table "socioeduk_configuracao_email_pessoas", force: :cascade do |t|
    t.bigint "socioeduk_configuracao_email_id"
    t.string "identificacao"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_configuracao_email_id"], name: "onfiguracao_email_pessoas"
  end

  create_table "socioeduk_configuracao_emails", force: :cascade do |t|
    t.bigint "socioeduk_tipo_acao_configuracao_email_id"
    t.bigint "socioeduk_tipo_filtro_configuracao_email_id"
    t.string "descricao"
    t.string "valor_descricao"
    t.string "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.index ["socioeduk_tipo_acao_configuracao_email_id"], name: "tipo_acao_configuracao_email"
    t.index ["socioeduk_tipo_filtro_configuracao_email_id"], name: "socioeduk_tipo_filtro_configuracao_email"
  end

  create_table "socioeduk_contatos", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "tipo_contato_id"
    t.integer "ddd"
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_contatos_on_jovem_id"
    t.index ["tipo_contato_id"], name: "index_socioeduk_contatos_on_tipo_contato_id"
  end

  create_table "socioeduk_convivio_familiares", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_cor_olhos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_decisao_judiciais", force: :cascade do |t|
    t.string "descricao"
    t.bigint "atendimento_inicial_id"
    t.string "documento_file_name"
    t.string "documento_content_type"
    t.integer "documento_file_size"
    t.datetime "documento_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["atendimento_inicial_id"], name: "index_socioeduk_decisao_judiciais_on_atendimento_inicial_id"
  end

  create_table "socioeduk_deficiencias", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "deficiencias_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deficiencias_id"], name: "index_socioeduk_deficiencias_on_deficiencias_id"
    t.index ["jovem_id"], name: "index_socioeduk_deficiencias_on_jovem_id"
  end

  create_table "socioeduk_disciplina_escolaridades", force: :cascade do |t|
    t.bigint "socioeduk_escolaridade_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_escolaridade_id"], name: "disciplina_escolaridades"
  end

  create_table "socioeduk_doc_recepcoes", force: :cascade do |t|
    t.string "doc_recepcao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_documento_forma_entradas", force: :cascade do |t|
    t.string "descricao"
    t.boolean "obrigatorio"
    t.bigint "forma_entrada_id"
    t.bigint "subforma_entrada_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["forma_entrada_id"], name: "index_socioeduk_documento_forma_entradas_on_forma_entrada_id"
    t.index ["subforma_entrada_id"], name: "index_socioeduk_documento_forma_entradas_on_subforma_entrada_id"
  end

  create_table "socioeduk_documentos", force: :cascade do |t|
    t.bigint "jovem_id"
    t.string "cpf"
    t.string "rg_numero"
    t.date "rg_data_emissao"
    t.string "rg_orgao_emissor"
    t.string "rg_uf_emissao"
    t.string "certidao_nascimento"
    t.string "certidao_numero"
    t.string "certidao_pagina"
    t.string "certidao_livro"
    t.date "certidao_data_emissao"
    t.string "certidao_uf_emissao"
    t.string "cpts_numero"
    t.string "ctps_serie"
    t.string "ctps_data_emissao"
    t.string "ctps_uf_emissao"
    t.string "titulo_numero"
    t.string "titulo_serie"
    t.string "titulo_secao"
    t.string "pis_numero"
    t.string "reservista_numero"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jovem_id"], name: "index_socioeduk_documentos_on_jovem_id"
  end

  create_table "socioeduk_encaminhamento_conclusao_medida_socioeducativas", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_endereco_jovens", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "cidade_id"
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "bairro_id"
    t.bigint "socioeduk_tipo_enderecos_id"
    t.index ["bairro_id"], name: "index_socioeduk_endereco_jovens_on_bairro_id"
    t.index ["cidade_id"], name: "index_socioeduk_endereco_jovens_on_cidade_id"
    t.index ["deleted_at"], name: "index_socioeduk_endereco_jovens_on_deleted_at"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_endereco_jovens_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_enderecos_id"], name: "index_socioeduk_endereco_jovens_on_socioeduk_tipo_enderecos_id"
  end

  create_table "socioeduk_enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "complemento"
    t.string "cidade"
    t.string "estado"
    t.string "ponto_referencia"
    t.integer "tipo_contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "jovem_id"
    t.index ["jovem_id"], name: "index_socioeduk_enderecos_on_jovem_id"
  end

  create_table "socioeduk_entorpecentes", force: :cascade do |t|
    t.string "descricao"
    t.bigint "unidades_medida_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidades_medida_id"], name: "index_socioeduk_entorpecentes_on_unidades_medida_id"
  end

  create_table "socioeduk_escolaridades", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_evasoes", force: :cascade do |t|
    t.bigint "jovem_id"
    t.datetime "data_evasao"
    t.boolean "evadido"
    t.datetime "retornou_em"
    t.integer "tipo_evasao"
    t.text "observacoes"
    t.string "motivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_evasoes_on_jovem_id"
  end

  create_table "socioeduk_forma_entradas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_gestao_vagas", force: :cascade do |t|
    t.integer "de_unidade_socioeducativa_id"
    t.integer "para_unidade_socioeducativa_id"
    t.bigint "usuario_id"
    t.string "status"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "socioeduk_jovem_recepcao_id"
    t.date "data_movimentacao"
    t.text "motivo_transferencia"
    t.boolean "finalizado"
    t.boolean "reversao"
    t.integer "usuario_id_reversao"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_socioeduk_gestao_vagas_on_deleted_at"
    t.index ["usuario_id"], name: "index_socioeduk_gestao_vagas_on_usuario_id"
  end

  create_table "socioeduk_infracao_preliminares", force: :cascade do |t|
    t.bigint "atendimento_inicial_id"
    t.bigint "tipo_infracao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["atendimento_inicial_id"], name: "index_socioeduk_infracao_preliminares_on_atendimento_inicial_id"
    t.index ["tipo_infracao_id"], name: "index_socioeduk_infracao_preliminares_on_tipo_infracao_id"
  end

  create_table "socioeduk_infracoes", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "tipo_infracao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_infracoes_on_jovem_id"
    t.index ["tipo_infracao_id"], name: "index_socioeduk_infracoes_on_tipo_infracao_id"
  end

  create_table "socioeduk_jovem_apreensoes", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.boolean "antecedente_criminal"
    t.integer "qtd_processo_anterior"
    t.datetime "data_hora_entrada_delegacia"
    t.integer "dia_delegacia"
    t.bigint "socioeduk_tipo_medida_socioeducativa_id"
    t.bigint "socioeduk_tipo_decisao_judicial_id"
    t.integer "qtd_dia_internacao_medida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_apreensoes_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_decisao_judicial_id"], name: "tipo_decisao_judicial_jovem_apreensoes"
    t.index ["socioeduk_tipo_medida_socioeducativa_id"], name: "tipo_medida_socioeducativa_jovem_apreensoes"
  end

  create_table "socioeduk_jovem_caracteristicas", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_sinal_id"
    t.string "local_sinal"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "jovem"
    t.index ["socioeduk_tipo_sinal_id"], name: "tipo_sinal"
  end

  create_table "socioeduk_jovem_contatos", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_contato_id"
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "socioeduk_tipo_parentescos_id"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_contatos_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_contato_id"], name: "index_socioeduk_jovem_contatos_on_socioeduk_tipo_contato_id"
    t.index ["socioeduk_tipo_parentescos_id"], name: "index_socioeduk_jovem_contatos_on_socioeduk_tipo_parentescos_id"
  end

  create_table "socioeduk_jovem_controle_pertences", force: :cascade do |t|
    t.bigint "socioeduk_jovem_recepcao_id"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_recepcao_id"], name: "jovem_controle_pertence_recepcao"
  end

  create_table "socioeduk_jovem_documentos", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_documento_id"
    t.string "numero"
    t.date "data_emissao"
    t.integer "origem_documento"
    t.integer "destino_documento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_documentos_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_documento_id"], name: "index_socioeduk_jovem_documentos_on_socioeduk_tipo_documento_id"
  end

  create_table "socioeduk_jovem_item_pertences", force: :cascade do |t|
    t.bigint "socioeduk_jovem_controle_pertence_id"
    t.string "nome"
    t.string "recebente"
    t.string "entregador"
    t.integer "usuario_new"
    t.integer "usuario_update"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "data_entrega"
    t.index ["socioeduk_jovem_controle_pertence_id"], name: "socioeduk_jovem_item_pertences_item"
  end

  create_table "socioeduk_jovem_ocorrencias", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_ocorrencia_id"
    t.datetime "data_hora"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_ocorrencias_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_ocorrencia_id"], name: "tipo_ocorrencia_jovem_ocorrencias"
  end

  create_table "socioeduk_jovem_recepcoes", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.boolean "antecedentes"
    t.string "bo"
    t.boolean "responsavel"
    t.string "nome_responsavel"
    t.string "telefone"
    t.string "presenca_familiar_junto"
    t.string "condutor_nome"
    t.string "condutor_documento"
    t.string "condutor_cargo"
    t.datetime "datahora_apresentacao"
    t.boolean "oficio"
    t.boolean "documentos_pessoais"
    t.boolean "decisao"
    t.boolean "corpo_delito"
    t.boolean "certidao_antecedente_criminal"
    t.boolean "kit_vestuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.datetime "deleted_at"
    t.text "agredido"
    t.boolean "agredido_bool"
    t.bigint "socioeduk_tipo_medida_socioeducativa_id"
    t.string "recepcao_origem"
    t.boolean "guia_cnj"
    t.boolean "representacao_ministerial"
    t.integer "dias_para_efetuar_cadastro"
    t.bigint "usuario_id"
    t.integer "usuario_update_id"
    t.bigint "socioeduk_doc_recepcoes_id"
    t.text "motivo_reversao"
    t.integer "usuario_id_reversao"
    t.date "data_saida"
    t.text "observacao_saida"
    t.index ["socioeduk_doc_recepcoes_id"], name: "index_socioeduk_jovem_recepcoes_on_socioeduk_doc_recepcoes_id"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_recepcoes_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_medida_socioeducativa_id"], name: "index_socioeduk_jov_recep_on_socioeduk_tipo_medida_socioedu_id"
    t.index ["usuario_id"], name: "index_socioeduk_jovem_recepcoes_on_usuario_id"
  end

  create_table "socioeduk_jovem_saidas", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.datetime "data_hora"
    t.string "destino"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_saidas_on_socioeduk_jovem_id"
  end

  create_table "socioeduk_jovem_suicidios", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "unidade_socioeducativa_id"
    t.integer "idade"
    t.string "filiacao"
    t.date "data_entrada_unidade"
    t.string "municipio"
    t.datetime "data_evento"
    t.string "dia_semana"
    t.string "metodo"
    t.boolean "foi_planejado"
    t.text "descricao_planejamento"
    t.boolean "ouve_aviso"
    t.text "descricao_aviso"
    t.boolean "deixou_mensagem"
    t.text "descricao_mensagem"
    t.boolean "estava_acompanhado"
    t.text "descricao_acompanhamento"
    t.string "onde_ocorreu"
    t.string "tempo_socorro_suicidio"
    t.string "quem_socorreu"
    t.text "procedimento_socorro"
    t.boolean "depressao"
    t.boolean "apatia"
    t.boolean "insonia"
    t.boolean "drogas"
    t.boolean "impulsividade"
    t.boolean "relacionamento"
    t.boolean "isolamento"
    t.boolean "outros"
    t.text "descrever_outros"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_suicidios_on_socioeduk_jovem_id"
    t.index ["unidade_socioeducativa_id"], name: "index_socioeduk_jovem_suicidios_on_unidade_socioeducativa_id"
  end

  create_table "socioeduk_jovem_transferencias", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_transferencias_on_socioeduk_jovem_id"
    t.index ["unidade_socioeducativa_id"], name: "unidade_socioeducativa_jovem_transferencias"
  end

  create_table "socioeduk_jovens", force: :cascade do |t|
    t.string "nome"
    t.string "apelido"
    t.boolean "falecido"
    t.date "data_nascimento"
    t.string "sexo"
    t.bigint "opcao_sexual_id"
    t.string "nome_mae"
    t.string "nome_pai"
    t.decimal "peso"
    t.decimal "altura"
    t.boolean "dependente_quimico"
    t.string "nacionalidade"
    t.string "naturalidade"
    t.string "etnia"
    t.string "estado_civil_id"
    t.boolean "orfao"
    t.string "responsavel"
    t.string "mora_com"
    t.integer "numero_filhos"
    t.string "responsavel_filhos"
    t.string "tempo_gestacao"
    t.boolean "amamentando"
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "socioeduk_situacao_adolescente_id"
    t.integer "uf_naturalidade_id"
    t.integer "cidade_naturalidade_id"
    t.integer "idade_estimada"
    t.string "outras_info_fisica"
    t.boolean "reside_fora_pais"
    t.string "cpf"
    t.string "rg"
    t.string "orgao_expedidor"
    t.boolean "providenciando_documentos"
    t.bigint "socioeduk_tipo_cabelo_id"
    t.bigint "socioeduk_cor_olhos_id"
    t.bigint "socioeduk_raca_cor_id"
    t.binary "e1"
    t.binary "e2"
    t.binary "e3"
    t.binary "e4"
    t.binary "e5"
    t.binary "d1"
    t.binary "d2"
    t.binary "d3"
    t.binary "d4"
    t.binary "d5"
    t.date "data_providencia_documento"
    t.boolean "has_digital"
    t.bigint "usuario_id"
    t.integer "usuario_update_id"
    t.boolean "flag_hononimo"
    t.index ["opcao_sexual_id"], name: "index_socioeduk_jovens_on_opcao_sexual_id"
    t.index ["socioeduk_cor_olhos_id"], name: "index_socioeduk_jovens_on_socioeduk_cor_olhos_id"
    t.index ["socioeduk_raca_cor_id"], name: "index_socioeduk_jovens_on_socioeduk_raca_cor_id"
    t.index ["socioeduk_situacao_adolescente_id"], name: "index_socioeduk_jovens_on_socioeduk_situacao_adolescente_id"
    t.index ["socioeduk_tipo_cabelo_id"], name: "index_socioeduk_jovens_on_socioeduk_tipo_cabelo_id"
    t.index ["usuario_id"], name: "index_socioeduk_jovens_on_usuario_id"
  end

  create_table "socioeduk_local_atendimentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_local_tratamentos", force: :cascade do |t|
    t.string "descricao"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_marca_corporais", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "marca_corporal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_marca_corporais_on_jovem_id"
    t.index ["marca_corporal_id"], name: "index_socioeduk_marca_corporais_on_marca_corporal_id"
  end

  create_table "socioeduk_medida_socioeducativa_historicos", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.bigint "socioeduk_tipo_medida_socioeducativa_id"
    t.bigint "socioeduk_situacao_cumprimento_id"
    t.bigint "socioeduk_circunstancia_id"
    t.date "inicio"
    t.date "fim_previsto"
    t.integer "periodo_dias"
    t.bigint "socioeduk_tipo_conclusao_medida_socioeducativas_id"
    t.bigint "socioeduk_encaminhamento_conclusao_medida_socioeducativas_id"
    t.date "data_conclusao"
    t.text "observacao_conclusao"
    t.bigint "socioeduk_numero_processo_id"
    t.date "data_sentenca_conclusao"
    t.date "data_sentenca"
    t.date "data_decisao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "socioeduk_medida_socioeducativa_id"
    t.bigint "socioeduk_medida_socioeducativa_motivo_conclusao_id"
    t.index ["socioeduk_circunstancia_id"], name: "circunstancia_medida_socioeducativa_historico"
    t.index ["socioeduk_encaminhamento_conclusao_medida_socioeducativas_id"], name: "encaminhamento_conclusao_medida_socioeducativa_historico"
    t.index ["socioeduk_medida_socioeducativa_id"], name: "medida_socioeducativa_medida_socioeducativa_historico"
    t.index ["socioeduk_medida_socioeducativa_motivo_conclusao_id"], name: "medida_socioeducativa_motivo_conclusoes_historico"
    t.index ["socioeduk_numero_processo_id"], name: "numero_processo_medida_socioeducativa_historico"
    t.index ["socioeduk_processo_id"], name: "processo_medida_socioeducativa_historico"
    t.index ["socioeduk_situacao_cumprimento_id"], name: "situacao_cumprimento_medida_socioeducativa_historico"
    t.index ["socioeduk_tipo_conclusao_medida_socioeducativas_id"], name: "tipo_conclusao_medida_medida_socioeducativa_historico"
    t.index ["socioeduk_tipo_medida_socioeducativa_id"], name: "tipo_medida_socioeducativa_medida_socioeducativa_historico"
  end

  create_table "socioeduk_medida_socioeducativa_motivo_conclusoes", force: :cascade do |t|
    t.bigint "socioeduk_tipo_medida_socioeducativa_id"
    t.bigint "socioeduk_tipo_conclusao_medida_socioeducativa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_tipo_conclusao_medida_socioeducativa_id"], name: "tipo_conclusao_medida_motivo_conclusão"
    t.index ["socioeduk_tipo_medida_socioeducativa_id"], name: "tipo_medida_motivo_conclusão"
  end

  create_table "socioeduk_medida_socioeducativas", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.bigint "socioeduk_tipo_medida_socioeducativa_id"
    t.bigint "socioeduk_situacao_cumprimento_id"
    t.bigint "socioeduk_circunstancia_id"
    t.date "inicio"
    t.date "fim_previsto"
    t.integer "periodo_dias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "socioeduk_tipo_conclusao_medida_socioeducativas_id"
    t.bigint "socioeduk_encaminhamento_conclusao_medida_socioeducativas_id"
    t.date "data_conclusao"
    t.text "observacao_conclusao"
    t.datetime "deleted_at"
    t.bigint "socioeduk_numero_processo_id"
    t.date "data_sentenca_conclusao"
    t.date "data_sentenca"
    t.date "data_decisao"
    t.bigint "socioeduk_medida_socioeducativa_motivo_conclusao_id"
    t.index ["deleted_at"], name: "index_socioeduk_medida_socioeducativas_on_deleted_at"
    t.index ["socioeduk_circunstancia_id"], name: "circunstancia_medida"
    t.index ["socioeduk_encaminhamento_conclusao_medida_socioeducativas_id"], name: "encaminhamento_conc_med_socio"
    t.index ["socioeduk_medida_socioeducativa_motivo_conclusao_id"], name: "medida_socioeducativa_motivo_conclusao"
    t.index ["socioeduk_numero_processo_id"], name: "numero_processo"
    t.index ["socioeduk_processo_id"], name: "processo_medida"
    t.index ["socioeduk_situacao_cumprimento_id"], name: "situacao_cumprimento_infracoes_medida"
    t.index ["socioeduk_tipo_conclusao_medida_socioeducativas_id"], name: "tipo_conc_med_socio"
    t.index ["socioeduk_tipo_medida_socioeducativa_id"], name: "tipo_medida_socioeducativa_medida"
  end

  create_table "socioeduk_metodo_contraceptivos", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_municipios", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_numero_processos", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "principal"
    t.boolean "status"
    t.bigint "socioeduk_comarca_id"
    t.bigint "cidade_id"
    t.boolean "pontuacao_descumprimento_medida"
    t.boolean "pontuacao_organizacao_criminosa"
    t.index ["cidade_id"], name: "index_socioeduk_numero_processos_on_cidade_id"
    t.index ["deleted_at"], name: "index_socioeduk_numero_processos_on_deleted_at"
    t.index ["socioeduk_comarca_id"], name: "index_socioeduk_numero_processos_on_socioeduk_comarca_id"
    t.index ["socioeduk_processo_id"], name: "index_socioeduk_numero_processos_on_socioeduk_processo_id"
  end

  create_table "socioeduk_ocorrencias", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.bigint "socioeduk_tipo_ocorrencia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_tipo_ocorrencia_id"], name: "index_socioeduk_ocorrencias_on_socioeduk_tipo_ocorrencia_id"
  end

  create_table "socioeduk_opcao_sexuais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_outro_nomes", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_socioeduk_outro_nomes_on_deleted_at"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_outro_nomes_on_socioeduk_jovem_id"
  end

  create_table "socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas", force: :cascade do |t|
    t.bigint "socioeduk_pedagogico_jovem_escolaridade_medida_id"
    t.bigint "socioeduk_escolaridade_id"
    t.bigint "socioeduk_situacao_disciplina_id"
    t.date "data_situacao"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_escolaridade_id"], name: "escolaridade_escolaridade_medida"
    t.index ["socioeduk_pedagogico_jovem_escolaridade_medida_id"], name: "pedagogico_jovem_escolaridade_medida"
    t.index ["socioeduk_situacao_disciplina_id"], name: "situacao_disciplina_escolaridade_medida"
  end

  create_table "socioeduk_pedagogico_jovem_disciplina_escolaridades", force: :cascade do |t|
    t.bigint "pedagogico_jovem_id"
    t.bigint "socioeduk_disciplina_escolaridade_id"
    t.bigint "socioeduk_situacao_disciplina_id"
    t.date "data_conclusao"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedagogico_jovem_id"], name: "pedagogico_jovem_disciplina_escolaridade"
    t.index ["socioeduk_disciplina_escolaridade_id"], name: "disciplina_escolaridade_disciplina_escolaridade"
    t.index ["socioeduk_situacao_disciplina_id"], name: "situacao_disciplina_disciplina_escolaridade"
  end

  create_table "socioeduk_pedagogico_jovem_escolaridade_medidas", force: :cascade do |t|
    t.bigint "pedagogico_jovem_id"
    t.bigint "socioeduk_escolaridade_id"
    t.bigint "socioeduk_tipo_local_curso_id"
    t.string "escola"
    t.integer "ano"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedagogico_jovem_id"], name: "pedagogico_jovem_escolaridade_medidas"
    t.index ["socioeduk_escolaridade_id"], name: "escolaridade_escolaridade_medidas"
    t.index ["socioeduk_tipo_local_curso_id"], name: "tipo_local_curso_escolaridade_medidas"
  end

  create_table "socioeduk_pedagogico_jovem_oficinas", force: :cascade do |t|
    t.bigint "socioeduk_pedagogico_jovem_id"
    t.bigint "socioeduk_tipo_oficina_id"
    t.string "nome"
    t.date "data_inicia"
    t.date "data_fim"
    t.string "carga_horaria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_pedagogico_jovem_id"], name: "pedagogico_jovem_oficina"
    t.index ["socioeduk_tipo_oficina_id"], name: "tipo_oficina_oficina"
  end

  create_table "socioeduk_pedagogico_jovem_profissionalizantes", force: :cascade do |t|
    t.bigint "socioeduk_pedagogico_jovem_id"
    t.bigint "socioeduk_tipo_local_curso_id"
    t.string "nome_programa"
    t.bigint "socioeduk_tipo_curso_id"
    t.string "nome_curso"
    t.date "data_inicio"
    t.date "data_fim"
    t.string "carga_horaria"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_pedagogico_jovem_id"], name: "pedagogico_jovem_profissionalizante"
    t.index ["socioeduk_tipo_curso_id"], name: "tipo_curso_profissionalizante"
    t.index ["socioeduk_tipo_local_curso_id"], name: "tipo_local_curso_profissionalizante"
  end

  create_table "socioeduk_pedagogico_jovens", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_alfabetizado_id"
    t.bigint "socioeduk_situacao_escolar_id"
    t.bigint "socioeduk_escolaridade_id"
    t.string "ultima_escola_frequentada"
    t.integer "ultimo_ano_escolar"
    t.string "cgm"
    t.integer "socioeduk_situacao_ocupacional_anterior"
    t.integer "socioeduk_situacao_ocupacional_atual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_escolaridade_id"], name: "index_socioeduk_pedagogico_jovens_on_socioeduk_escolaridade_id"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_pedagogico_jovens_on_socioeduk_jovem_id"
    t.index ["socioeduk_situacao_escolar_id"], name: "situacao_escolar_pedagogico_jovens"
    t.index ["socioeduk_tipo_alfabetizado_id"], name: "tipo_alfabetizado_pedagogico_jovens"
  end

  create_table "socioeduk_plano_individual_atendimentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_processo_advogados", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.string "nome"
    t.string "numero"
    t.integer "uf_oab"
    t.boolean "defensor_publico"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_processo_id"], name: "index_socioeduk_processo_advogados_on_socioeduk_processo_id"
    t.index ["unidade_socioeducativa_id"], name: "index_socioeduk_processo_advogados_on_unidade_socioeducativa_id"
  end

  create_table "socioeduk_processo_anexos", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anexo_file_name"
    t.string "anexo_content_type"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.index ["socioeduk_processo_id"], name: "index_socioeduk_processo_anexos_on_socioeduk_processo_id"
  end

  create_table "socioeduk_processo_envolvidos", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.bigint "socioeduk_jovem_id"
    t.string "prontuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_processo_envolvidos_on_socioeduk_jovem_id"
    t.index ["socioeduk_processo_id"], name: "index_socioeduk_processo_envolvidos_on_socioeduk_processo_id"
  end

  create_table "socioeduk_processo_naturezas", force: :cascade do |t|
    t.bigint "processo_id"
    t.string "tipo_natureza"
    t.string "artigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "socioeduk_artigo_infracao_id"
    t.bigint "socioeduk_artigo_paragrafo_id"
    t.bigint "socioeduk_artigo_inciso_id"
    t.bigint "socioeduk_artigo_alinea_id"
    t.boolean "pontuacao_continuado"
    t.string "incisos"
    t.string "alineas"
    t.boolean "estupro_vulneravel"
    t.boolean "pontuacao_reinteracao"
    t.integer "pontuacao_quantidade_reinteracao"
    t.bigint "socioeduk_numero_processo_id"
    t.index ["processo_id"], name: "index_socioeduk_processo_naturezas_on_processo_id"
    t.index ["socioeduk_artigo_alinea_id"], name: "artigo_alinea_processo_natureza"
    t.index ["socioeduk_artigo_inciso_id"], name: "artigo_inciso_processo_natureza"
    t.index ["socioeduk_artigo_infracao_id"], name: "artigo_infracao_processo_natureza"
    t.index ["socioeduk_artigo_paragrafo_id"], name: "artigo_paragrafo_processo_natureza"
    t.index ["socioeduk_numero_processo_id"], name: "numero_processo_natureza"
  end

  create_table "socioeduk_processo_observacoes", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_processo_id"], name: "index_socioeduk_processo_observacoes_on_socioeduk_processo_id"
  end

  create_table "socioeduk_processo_recepcao_jovem_infracoes", force: :cascade do |t|
    t.bigint "socioeduk_processo_recepcao_jovem_id"
    t.boolean "reincidente"
    t.boolean "cumpre_medida"
    t.boolean "mandato_apreencao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_processo_recepcao_jovem_id"], name: "processo_recepcao_jovem_infracoes"
  end

  create_table "socioeduk_processo_recepcao_jovens", force: :cascade do |t|
    t.bigint "socioeduk_processo_id"
    t.bigint "socioeduk_jovem_recepcao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_recepcao_id"], name: "processo_jovem_recepcao"
    t.index ["socioeduk_processo_id"], name: "processo_recepcao_jovem"
  end

  create_table "socioeduk_processos", force: :cascade do |t|
    t.string "numero_processo"
    t.bigint "socioeduk_tipo_processo_id"
    t.date "data_representacao"
    t.date "data_decisao"
    t.string "numero_oficio"
    t.date "data_oficio"
    t.bigint "socioeduk_situacao_processo_id"
    t.datetime "data_hora_infracao"
    t.datetime "data_hora_apreensao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "socioeduk_jovem_recepcao_id"
    t.boolean "pontuacao_certidao_positiva"
    t.boolean "pontuacao_apreendido"
    t.integer "cidade_cumprimento_medida"
    t.boolean "pontuacao_descumprimento_medida"
    t.integer "cidade_comarca"
    t.boolean "pontuacao_organizacao_criminosa"
    t.datetime "deleted_at"
    t.integer "pontuacao_quantidade_reinteracao"
    t.bigint "socioeduk_status_processo_id"
    t.integer "pontuacao_quantidade_certidao_positiva"
    t.boolean "aguardando_vaga"
    t.decimal "pontuacao_bkp"
    t.datetime "data_espera"
    t.index ["deleted_at"], name: "index_socioeduk_processos_on_deleted_at"
    t.index ["socioeduk_jovem_recepcao_id"], name: "index_socioeduk_processos_on_socioeduk_jovem_recepcao_id"
    t.index ["socioeduk_situacao_processo_id"], name: "index_socioeduk_processos_on_socioeduk_situacao_processo_id"
    t.index ["socioeduk_status_processo_id"], name: "index_socioeduk_processos_on_socioeduk_status_processo_id"
    t.index ["socioeduk_tipo_processo_id"], name: "index_socioeduk_processos_on_socioeduk_tipo_processo_id"
  end

  create_table "socioeduk_programa_sociais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_quartos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "socioeduk_bloco_id"
    t.index ["socioeduk_bloco_id"], name: "index_socioeduk_quartos_on_socioeduk_bloco_id"
  end

  create_table "socioeduk_raca_cores", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_relatorio_diarios", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "unidade_socioeducativa_id"
    t.integer "int_mas"
    t.integer "int_fem"
    t.integer "ip_mas"
    t.integer "ip_fem"
    t.integer "sl_mas"
    t.integer "sl_fem"
    t.integer "capacidade_nominal"
    t.integer "capacidade_real"
    t.integer "socioeducador_homem"
    t.integer "socioeducador_mulher"
    t.integer "capacidade_por_adolescente"
    t.integer "evasao"
    t.integer "fuga"
    t.integer "descumprimento"
    t.date "data"
    t.text "resumo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "capacidade_por_adolescente_percentual"
    t.string "capacidade_socioeducador_por_adolescente_percentual"
    t.string "preenchido_por"
    t.integer "situacao_crise_simples"
    t.integer "situacao_crise_critica"
    t.integer "situacao_crise_complexa"
    t.integer "san_mas"
    t.integer "san_fem"
    t.index ["unidade_socioeducativa_id"], name: "index_socioeduk_relatorio_diarios_on_unidade_socioeducativa_id"
    t.index ["usuario_id"], name: "index_socioeduk_relatorio_diarios_on_usuario_id"
  end

  create_table "socioeduk_renda_familiares", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_saude_jovem_atendimentos", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_tipo_atendimento_id"
    t.date "data_atendimento"
    t.integer "local_atendimento"
    t.string "outro_local_atendimento"
    t.bigint "socioeduk_cid_id"
    t.string "diagnostico"
    t.string "nome_profissional"
    t.string "descricao_atendimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "jovem_saude"
    t.index ["socioeduk_cid_id"], name: "index_socioeduk_saude_jovem_atendimentos_on_socioeduk_cid_id"
    t.index ["socioeduk_tipo_atendimento_id"], name: "tipo_atendimento"
  end

  create_table "socioeduk_saude_jovem_doencas_historicas", force: :cascade do |t|
    t.bigint "socioeduk_saude_jovem_id"
    t.bigint "socioeduk_cid_id"
    t.string "diagnostico"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_cid_id"], name: "cid"
    t.index ["socioeduk_saude_jovem_id"], name: "saude_jovem"
  end

  create_table "socioeduk_saude_jovem_exames", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_tipo_exame_id"
    t.date "data_exame"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "index_socioeduk_saude_jovem_exames_on_saude_jovem_id"
    t.index ["socioeduk_tipo_exame_id"], name: "index_socioeduk_saude_jovem_exames_on_socioeduk_tipo_exame_id"
  end

  create_table "socioeduk_saude_jovem_ocorrencias", force: :cascade do |t|
    t.bigint "socioeduk_jovem_recepcao_id"
    t.bigint "socioeduk_tipo_atendimento_id"
    t.date "data"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_recepcao_id"], name: "saude_jovem_ocorrencia_jovem_recepcao"
    t.index ["socioeduk_tipo_atendimento_id"], name: "saude_jovem_ocorrencia_tipo_atendimento"
  end

  create_table "socioeduk_saude_jovem_saude_clinicas", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.boolean "odontologico_clinico"
    t.bigint "socioeduk_cid_id"
    t.string "diagnostico"
    t.bigint "socioeduk_local_tratamento_id"
    t.string "outro_local_tratamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "saude_jovem_clineca"
    t.index ["socioeduk_cid_id"], name: "cid_clinica"
    t.index ["socioeduk_local_tratamento_id"], name: "local_tratamento_clinica"
  end

  create_table "socioeduk_saude_jovem_vacinas", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_tipo_vacina_id"
    t.date "data_vacinacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "index_socioeduk_saude_jovem_vacinas_on_saude_jovem_id"
    t.index ["socioeduk_tipo_vacina_id"], name: "index_socioeduk_saude_jovem_vacinas_on_socioeduk_tipo_vacina_id"
  end

  create_table "socioeduk_saude_jovens", force: :cascade do |t|
    t.string "cartao_sus"
    t.float "altura_estimada"
    t.float "peso_estimado"
    t.bigint "socioeduk_condicao_fisica_id"
    t.boolean "gravida"
    t.date "data_ultima_menstruacao"
    t.date "data_provavel_parto"
    t.integer "qtd_gestacoes"
    t.integer "qtd_parto_normal"
    t.integer "qtd_cesariana"
    t.integer "qtd_aborto"
    t.integer "qtd_filhos_vivos"
    t.integer "filhos_deficiente_fisico"
    t.boolean "metodo_contraceptivo"
    t.boolean "usou_drogas"
    t.boolean "historico_tratamento_psiquiatrico"
    t.integer "local_tratamento_psiquiatrico_id"
    t.string "outro_local_psiquiatrico"
    t.date "tempo_psiquiatrico"
    t.boolean "hipotese_diagnostica_transtorno_mental"
    t.integer "local_tratamento_transtorno_mental_id"
    t.string "outro_local_transtorno_mental"
    t.date "tempo_transtorno_mental"
    t.boolean "medicamento_controlado"
    t.boolean "tentativa_suicidio"
    t.boolean "tentativa_suicidio_familiar"
    t.boolean "doenca_mental_familiar"
    t.integer "cid_mental_id"
    t.string "diagnostico_mental"
    t.boolean "medicamento_doenca_cronica"
    t.boolean "uso_protese"
    t.boolean "uso_ortese"
    t.boolean "fez_cirurgia"
    t.boolean "tem_fratura"
    t.boolean "tem_alergia_alimentar"
    t.string "descricao_alergia"
    t.boolean "tem_alergia_medicamentosa"
    t.string "descricao_alergia_medicamentosa"
    t.string "outras_vacinas_recebidas"
    t.string "outros_exames"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "qtd_tentativas_suicidio"
    t.date "datas_tentativas_tentativas_suicidio"
    t.boolean "historico_doenca_tratamento"
    t.boolean "integrante_familia_usa_drogas"
    t.bigint "socioeduk_jovem_recepcao_id"
    t.index ["socioeduk_condicao_fisica_id"], name: "index_socioeduk_saude_jovens_on_socioeduk_condicao_fisica_id"
    t.index ["socioeduk_jovem_recepcao_id"], name: "index_socioeduk_saude_jovens_on_socioeduk_jovem_recepcao_id"
  end

  create_table "socioeduk_saude_jovens_metodos_contraceptivos", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_metodo_contraceptivo_id"
    t.string "outros_metodos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "saude_jovem_contra"
    t.index ["socioeduk_metodo_contraceptivo_id"], name: "metodo_contraceptivo"
  end

  create_table "socioeduk_saude_jovens_parentes_viciados", force: :cascade do |t|
    t.bigint "socioeduk_saude_jovens_id"
    t.bigint "socioeduk_tipo_parentesco_id"
    t.bigint "socioeduk_entorpecente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_entorpecente_id"], name: "entorpecente_viciado"
    t.index ["socioeduk_saude_jovens_id"], name: "saude_jovens_viciado"
    t.index ["socioeduk_tipo_parentesco_id"], name: "tipo_parentesco_viciado"
  end

  create_table "socioeduk_saude_jovens_substancias_utilizadas", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_entorpecente_id"
    t.integer "iniciou_com_idade"
    t.integer "parou_com_idade"
    t.integer "frequencia"
    t.bigint "socioeduk_tipo_auto_consideracao_id"
    t.boolean "realizou_tratamento"
    t.bigint "socioeduk_tipo_tratamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "saude_jovens_sub"
    t.index ["socioeduk_entorpecente_id"], name: "entorpecente"
    t.index ["socioeduk_tipo_auto_consideracao_id"], name: "auto_consideracao"
    t.index ["socioeduk_tipo_tratamento_id"], name: "tipo_tratamento"
  end

  create_table "socioeduk_saude_jovens_tipo_medicamento_controlados", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_tipo_medicamneto_controlado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "saude_jovens_tipmedic"
    t.index ["socioeduk_tipo_medicamneto_controlado_id"], name: "tipo_medicamneto_controlado"
  end

  create_table "socioeduk_saude_jovens_tipo_parentesco_doenca_mentais", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_tipo_parentesco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "saude_jovens"
    t.index ["socioeduk_tipo_parentesco_id"], name: "tipo_parentesco"
  end

  create_table "socioeduk_saude_jovens_tipo_parentesco_suicidios", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_tipo_parentesco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "saude_jovens_suic"
    t.index ["socioeduk_tipo_parentesco_id"], name: "tipo_parentesco_suic"
  end

  create_table "socioeduk_saude_jovens_tipo_parentescos", force: :cascade do |t|
    t.bigint "saude_jovem_id"
    t.bigint "socioeduk_tipo_parentesco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saude_jovem_id"], name: "saude_jovem_tipo_parentescos"
    t.index ["socioeduk_tipo_parentesco_id"], name: "saude_jovem_tipo_parentesco"
  end

  create_table "socioeduk_situacao_adolescentes", force: :cascade do |t|
    t.string "descricao"
    t.boolean "remocao_fila"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_situacao_cumprimentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_situacao_disciplinas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_situacao_escolares", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_situacao_ocupacionais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_situacao_processos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_solicitacao_vaga_infracoes", force: :cascade do |t|
    t.bigint "solicitacao_vaga_id"
    t.string "tipo_natureza"
    t.bigint "artigo_infracao_id"
    t.boolean "pontuacao_continuado"
    t.boolean "estupro_vulneravel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "pontuacao_reinteracao"
    t.integer "pontuacao_quantidade_reinteracao"
    t.bigint "cidade_id"
    t.bigint "bairro_id"
    t.string "outra_infracao"
    t.boolean "flagrante"
    t.date "data_apreensao"
    t.date "data_ato_infracional"
    t.index ["artigo_infracao_id"], name: "solicitacao_vaga_infracao_artigo_infracao"
    t.index ["bairro_id"], name: "index_socioeduk_solicitacao_vaga_infracoes_on_bairro_id"
    t.index ["cidade_id"], name: "index_socioeduk_solicitacao_vaga_infracoes_on_cidade_id"
    t.index ["solicitacao_vaga_id"], name: "solicitacao_vaga_infracao_solicitacao_vaga"
  end

  create_table "socioeduk_solicitacao_vagas", force: :cascade do |t|
    t.string "nome"
    t.string "nome_mae"
    t.string "sexo"
    t.date "data_nascimento"
    t.boolean "dependente_quimico"
    t.string "rg"
    t.string "orgao_expedidor"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "data_infracao"
    t.boolean "pontuacao_certidao_positiva"
    t.boolean "pontuacao_apreendido"
    t.boolean "pontuacao_descumprimento_medida"
    t.boolean "pontuacao_organizacao_criminosa"
    t.bigint "usuario_id"
    t.bigint "socioeduk_tipo_medida_socioeducativa_id"
    t.string "status"
    t.integer "respondido_por"
    t.datetime "data_resposta"
    t.text "motivo_negacao"
    t.string "doc_guia_cnj_file_name"
    t.string "doc_guia_cnj_content_type"
    t.integer "doc_guia_cnj_file_size"
    t.datetime "doc_guia_cnj_updated_at"
    t.string "doc_pessoais_file_name"
    t.string "doc_pessoais_content_type"
    t.integer "doc_pessoais_file_size"
    t.datetime "doc_pessoais_updated_at"
    t.string "doc_pedido_internacao_provisoria_file_name"
    t.string "doc_pedido_internacao_provisoria_content_type"
    t.integer "doc_pedido_internacao_provisoria_file_size"
    t.datetime "doc_pedido_internacao_provisoria_updated_at"
    t.string "doc_certidao_antecedentes_file_name"
    t.string "doc_certidao_antecedentes_content_type"
    t.integer "doc_certidao_antecedentes_file_size"
    t.datetime "doc_certidao_antecedentes_updated_at"
    t.string "doc_decisao_interlocutoria_file_name"
    t.string "doc_decisao_interlocutoria_content_type"
    t.integer "doc_decisao_interlocutoria_file_size"
    t.datetime "doc_decisao_interlocutoria_updated_at"
    t.string "doc_estudos_tecnicos_file_name"
    t.string "doc_estudos_tecnicos_content_type"
    t.integer "doc_estudos_tecnicos_file_size"
    t.datetime "doc_estudos_tecnicos_updated_at"
    t.string "doc_oficio_crv_file_name"
    t.string "doc_oficio_crv_content_type"
    t.integer "doc_oficio_crv_file_size"
    t.datetime "doc_oficio_crv_updated_at"
    t.string "doc_historico_escolar_file_name"
    t.string "doc_historico_escolar_content_type"
    t.integer "doc_historico_escolar_file_size"
    t.datetime "doc_historico_escolar_updated_at"
    t.string "doc_historico_saude_file_name"
    t.string "doc_historico_saude_content_type"
    t.integer "doc_historico_saude_file_size"
    t.datetime "doc_historico_saude_updated_at"
    t.string "doc_comprovante_envio_malote_digital_file_name"
    t.string "doc_comprovante_envio_malote_digital_content_type"
    t.integer "doc_comprovante_envio_malote_digital_file_size"
    t.datetime "doc_comprovante_envio_malote_digital_updated_at"
    t.date "data_apreensao"
    t.text "observacao"
    t.string "logradouro"
    t.string "numero_logradouro"
    t.string "complemento"
    t.string "bairro"
    t.string "cep"
    t.bigint "cidade_id"
    t.integer "cidade_comarca"
    t.integer "cidade_cumprimento_medida"
    t.text "doc_unico_array", default: [], array: true
    t.string "doc_unico_file_name"
    t.string "doc_unico_content_type"
    t.integer "doc_unico_file_size"
    t.datetime "doc_unico_updated_at"
    t.integer "pontuacao_quantidade_certidao_positiva"
    t.bigint "estado_id"
    t.bigint "socioeduk_opcao_sexual_id"
    t.string "nome_pai"
    t.bigint "socioeduk_tipo_endereco_id"
    t.integer "cidade_naturalidade_id"
    t.date "maior_idade"
    t.integer "periodo"
    t.datetime "deleted_at"
    t.boolean "documento_alterado"
    t.string "resposta_arquivo_processo_file_name"
    t.string "resposta_arquivo_processo_content_type"
    t.integer "resposta_arquivo_processo_file_size"
    t.datetime "resposta_arquivo_processo_updated_at"
    t.string "resposta_arquivo_processo2_file_name"
    t.string "resposta_arquivo_processo2_content_type"
    t.integer "resposta_arquivo_processo2_file_size"
    t.datetime "resposta_arquivo_processo2_updated_at"
    t.string "resposta_arquivo_processo3_file_name"
    t.string "resposta_arquivo_processo3_content_type"
    t.integer "resposta_arquivo_processo3_file_size"
    t.datetime "resposta_arquivo_processo3_updated_at"
    t.string "resposta_arquivo_processo4_file_name"
    t.string "resposta_arquivo_processo4_content_type"
    t.integer "resposta_arquivo_processo4_file_size"
    t.datetime "resposta_arquivo_processo4_updated_at"
    t.index ["cidade_id"], name: "index_socioeduk_solicitacao_vagas_on_cidade_id"
    t.index ["estado_id"], name: "index_socioeduk_solicitacao_vagas_on_estado_id"
    t.index ["socioeduk_opcao_sexual_id"], name: "index_socioeduk_solicitacao_vagas_on_socioeduk_opcao_sexual_id"
    t.index ["socioeduk_tipo_endereco_id"], name: "index_socioeduk_solicitacao_vagas_on_socioeduk_tipo_endereco_id"
    t.index ["socioeduk_tipo_medida_socioeducativa_id"], name: "solicitacao_vaga_tipo_medida_socieducativa"
    t.index ["usuario_id"], name: "index_socioeduk_solicitacao_vagas_on_usuario_id"
  end

  create_table "socioeduk_status_processos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_subforma_entradas", force: :cascade do |t|
    t.string "descricao"
    t.bigint "forma_entrada_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["forma_entrada_id"], name: "index_socioeduk_subforma_entradas_on_forma_entrada_id"
  end

  create_table "socioeduk_sugestao_relatorios", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tecnico_jovem_anexos", force: :cascade do |t|
    t.bigint "socioeduk_tecnico_jovem_id"
    t.date "data_inclusao"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anexo_file_name"
    t.string "anexo_content_type"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.index ["socioeduk_tecnico_jovem_id"], name: "tecnico_jovem_anexo"
    t.index ["unidade_socioeducativa_id"], name: "unidade_socioeducativa_anexo"
  end

  create_table "socioeduk_tecnico_jovem_familias", force: :cascade do |t|
    t.bigint "socioeduk_tecnico_jovem_id"
    t.string "nome"
    t.bigint "socioeduk_escolaridade_id"
    t.string "profissao"
    t.bigint "socioeduk_tipo_parentesco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_escolaridade_id"], name: "escolaridade_familia"
    t.index ["socioeduk_tecnico_jovem_id"], name: "tecnico_jovem_familia"
    t.index ["socioeduk_tipo_parentesco_id"], name: "tipo_parentesco_familia"
  end

  create_table "socioeduk_tecnico_jovem_plano_atendimentos", force: :cascade do |t|
    t.bigint "tecnico_jovem_id"
    t.date "data_inclusao"
    t.integer "unidade_socioeducativa_inclusao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anexo_file_name"
    t.string "anexo_content_type"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.index ["tecnico_jovem_id"], name: "tecnico_jovem_plano_atendimento"
  end

  create_table "socioeduk_tecnico_jovem_programa_sociais", force: :cascade do |t|
    t.bigint "tecnico_jovem_id"
    t.bigint "socioeduk_programa_social_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_programa_social_id"], name: "programa_social_programa_social"
    t.index ["tecnico_jovem_id"], name: "tecnico_jovem_programa_social"
  end

  create_table "socioeduk_tecnico_jovem_ultimo_relatorios", force: :cascade do |t|
    t.bigint "tecnico_jovem_id"
    t.bigint "socioeduk_sugestao_relatorio_id"
    t.date "data_inclusao"
    t.bigint "socioeduk_tipo_retorno_id"
    t.integer "unidade_socioeducativa_inclusao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
    t.string "anexo_file_name"
    t.string "anexo_content_type"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.index ["socioeduk_sugestao_relatorio_id"], name: "sugestao_relatorio_ultimo_relatorios"
    t.index ["socioeduk_tipo_retorno_id"], name: "tipo_retorno_ultimo_relatorios"
    t.index ["tecnico_jovem_id"], name: "tecnico_jovem_ultimo_relatorios"
  end

  create_table "socioeduk_tecnico_jovem_visita_familiares", force: :cascade do |t|
    t.bigint "tecnico_jovem_id"
    t.date "data_visita"
    t.string "pessoa_visitada"
    t.text "finalidade_visita"
    t.string "responsavel_realizacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tecnico_jovem_id"], name: "tecnico_jovem_visita_familiar"
  end

  create_table "socioeduk_tecnico_jovens", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.boolean "tem_filhos"
    t.integer "quantos_filhos"
    t.bigint "socioeduk_convivio_familiar_id"
    t.string "codigo_familiar"
    t.string "cnis"
    t.boolean "programas_sociais"
    t.bigint "socioeduk_renda_familiar_id"
    t.bigint "socioeduk_composicao_familiar_id"
    t.bigint "socioeduk_plano_individual_atendimento_id"
    t.string "nome_tecnico"
    t.string "profissional_referencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_composicao_familiar_id"], name: "composicao_familiar_tecnico_jovem"
    t.index ["socioeduk_convivio_familiar_id"], name: "convivio_familiar_tecnico_jovem"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_tecnico_jovens_on_socioeduk_jovem_id"
    t.index ["socioeduk_plano_individual_atendimento_id"], name: "plano_individual_atendimento_tecnico_jovem"
    t.index ["socioeduk_renda_familiar_id"], name: "index_socioeduk_tecnico_jovens_on_socioeduk_renda_familiar_id"
  end

  create_table "socioeduk_tipo_acao_configuracao_emails", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_alfabetizados", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_atendimentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_auto_consideracoes", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_cabelos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_conclusao_medida_socioeducativas", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_contatos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_cursos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_decisao_judiciais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_deficiencias", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "socioeduk_tipo_desligamentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "socioeduk_tipo_documento_recepcoes", force: :cascade do |t|
    t.string "tipo_documento_recepcao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_documentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_enderecos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_exames", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_filtro_configuracao_emails", force: :cascade do |t|
    t.bigint "socioeduk_tipo_acao_configuracao_email_id"
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "parametros"
    t.index ["socioeduk_tipo_acao_configuracao_email_id"], name: "socioeduk_tipo_acao_configuracao_email1"
  end

  create_table "socioeduk_tipo_guia_execucoes", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_infracoes", force: :cascade do |t|
    t.string "artigo"
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "socioeduk_tipo_local_cursos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_marca_corporais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "socioeduk_tipo_medicamento_controlados", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_medida_socioeducativas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo_medida"
  end

  create_table "socioeduk_tipo_ocorrencias", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_oficinas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_parentescos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_processos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_retornos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_sinais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_telefones", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_tratamentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_vacinas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_transferencias", force: :cascade do |t|
    t.integer "unidade_socioeducativa_origem_id"
    t.integer "unidade_socioeducativa_destino_id"
    t.bigint "admissao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["admissao_id"], name: "index_socioeduk_transferencias_on_admissao_id"
  end

  create_table "socioeduk_visitante_jovens", force: :cascade do |t|
    t.bigint "socioeduk_visitante_id"
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_parentesco_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_visitante_jovens_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_parentesco_id"], name: "visitante_jovens_tipo_parentesco"
    t.index ["socioeduk_visitante_id"], name: "index_socioeduk_visitante_jovens_on_socioeduk_visitante_id"
  end

  create_table "socioeduk_visitantes", force: :cascade do |t|
    t.string "nome"
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_documento_id"
    t.string "numero"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uf_documento"
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
    t.string "anexo_file_name"
    t.string "anexo_content_type"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_visitantes_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_documento_id"], name: "index_socioeduk_visitantes_on_socioeduk_tipo_documento_id"
  end

  create_table "solicitacao_patrimonios", force: :cascade do |t|
    t.string "numero_processo"
    t.integer "solicitante"
    t.text "justificativa"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "autorizado", default: false
    t.boolean "atendido", default: false
  end

  create_table "solicitacao_transportes", force: :cascade do |t|
    t.bigint "tipo_solicitacao_transporte_id"
    t.bigint "area_id"
    t.integer "destinado_para_id"
    t.date "data_transporte"
    t.date "data_retorno"
    t.time "hora_solicitada"
    t.time "hora_prevista_retorno"
    t.string "destino"
    t.string "justificativa"
    t.boolean "urgente"
    t.string "justificativa_urgencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "origem"
    t.string "status"
    t.text "justificativa_cancelamento"
    t.datetime "deleted_at"
    t.integer "solicitante"
    t.index ["area_id"], name: "index_solicitacao_transportes_on_area_id"
    t.index ["deleted_at"], name: "index_solicitacao_transportes_on_deleted_at"
    t.index ["tipo_solicitacao_transporte_id"], name: "index_solicitacao_transportes_on_tipo_solicitacao_transporte_id"
  end

  create_table "status_patrimonios", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
  end

  create_table "tipo_de_combustiveis", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_patrimonios", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_pessoas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_solicitacao_transportes", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidade_bloco_dormitorio_capacidades", force: :cascade do |t|
    t.bigint "unidade_bloco_dormitorio_id"
    t.bigint "usuario_id"
    t.integer "quantidade_alteracao"
    t.string "responsavel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_unidade_bloco_dormitorio_capacidades_on_deleted_at"
    t.index ["unidade_bloco_dormitorio_id"], name: "unidade_bloco_dormitorio_capacidade"
    t.index ["usuario_id"], name: "index_unidade_bloco_dormitorio_capacidades_on_usuario_id"
  end

  create_table "unidade_bloco_dormitorios", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_bloco_id"
    t.string "descricao"
    t.integer "capacidade_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_unidade_bloco_dormitorios_on_deleted_at"
    t.index ["unidade_socioeducativa_bloco_id"], name: "unidade_socioeducativa_bloco_dormitorios"
  end

  create_table "unidade_socioeducativa_areas", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["area_id"], name: "index_unidade_socioeducativa_areas_on_area_id"
    t.index ["unidade_socioeducativa_id"], name: "index_unidade_socioeducativa_areas_on_unidade_socioeducativa_id"
  end

  create_table "unidade_socioeducativa_blocos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "socioeduk_tipo_medida_socioeducativa_id"
    t.index ["deleted_at"], name: "index_unidade_socioeducativa_blocos_on_deleted_at"
    t.index ["socioeduk_tipo_medida_socioeducativa_id"], name: "tipo_medida_socioeducativa_id"
    t.index ["unidade_socioeducativa_id"], name: "unidade_socioeducativa_bloco"
  end

  create_table "unidades_medidas", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades_socioeducativas", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "recepcao"
    t.bigint "cidade_id"
    t.string "genero"
    t.string "sexo"
    t.index ["cidade_id"], name: "index_unidades_socioeducativas_on_cidade_id"
  end

  create_table "urlbm_ato_infracionais", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_urlbm_ato_infracionais_on_deleted_at"
  end

  create_table "urlbm_mapas", force: :cascade do |t|
    t.string "num_processo"
    t.string "responsavel"
    t.string "telcontato"
    t.string "data_ocorrencia"
    t.string "data_judicial"
    t.boolean "reincidente"
    t.string "idade"
    t.string "bo_mapa"
    t.string "obs"
    t.bigint "socioeduk_jovem_recepcao_id"
    t.bigint "urlbm_ato_infracional_id"
    t.bigint "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "urlbm_status_map_id"
    t.index ["cidade_id"], name: "index_urlbm_mapas_on_cidade_id"
    t.index ["deleted_at"], name: "index_urlbm_mapas_on_deleted_at"
    t.index ["socioeduk_jovem_recepcao_id"], name: "index_urlbm_mapas_on_socioeduk_jovem_recepcao_id"
    t.index ["urlbm_ato_infracional_id"], name: "index_urlbm_mapas_on_urlbm_ato_infracional_id"
    t.index ["urlbm_status_map_id"], name: "index_urlbm_mapas_on_urlbm_status_map_id"
  end

  create_table "urlbm_status_maps", force: :cascade do |t|
    t.string "nome_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_urlbm_status_maps_on_deleted_at"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "permissao_id"
    t.string "cargo"
    t.string "authentication_token", limit: 30
    t.string "status", default: "ativo"
    t.index ["authentication_token"], name: "index_usuarios_on_authentication_token", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["permissao_id"], name: "index_usuarios_on_permissao_id"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.decimal "km"
    t.bigint "modelos_marca_id"
    t.bigint "tipo_de_combustivel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ano_fab"
    t.string "ano_mod"
    t.string "renavam"
    t.string "chassi"
    t.string "cor"
    t.string "lotacao"
    t.string "avalicao"
    t.bigint "marca_veiculo_id"
    t.string "status"
    t.index ["marca_veiculo_id"], name: "index_veiculos_on_marca_veiculo_id"
    t.index ["modelos_marca_id"], name: "index_veiculos_on_modelos_marca_id"
    t.index ["tipo_de_combustivel_id"], name: "index_veiculos_on_tipo_de_combustivel_id"
  end

  add_foreign_key "andamentos", "areas", column: "destinatario_id"
  add_foreign_key "andamentos", "usuarios"
  add_foreign_key "areas", "unidades_socioeducativas"
  add_foreign_key "biblioteca_emprestimos", "biblioteca_livros"
  add_foreign_key "biblioteca_emprestimos", "pessoas"
  add_foreign_key "biblioteca_emprestimos", "usuarios"
  add_foreign_key "biblioteca_livros", "biblioteca_autores"
  add_foreign_key "biblioteca_livros", "biblioteca_editoras"
  add_foreign_key "biblioteca_livros", "biblioteca_locais"
  add_foreign_key "biblioteca_livros", "biblioteca_local_publicacoes"
  add_foreign_key "capacidades_diarias", "unidades_socioeducativas"
  add_foreign_key "capacidades_diarias", "usuarios"
  add_foreign_key "capacidades_originais", "unidades_socioeducativas"
  add_foreign_key "capacidades_originais", "usuarios"
  add_foreign_key "cidades", "estados"
  add_foreign_key "classe_materiais", "grupo_materiais"
  add_foreign_key "classe_patrimonios", "grupo_patrimonios"
  add_foreign_key "coleta_indicadores", "indicadores"
  add_foreign_key "estados", "regioes"
  add_foreign_key "funcao_pessoas", "funcoes"
  add_foreign_key "funcao_pessoas", "pessoas"
  add_foreign_key "gestao_demandas_solicitacoes", "usuarios"
  add_foreign_key "gestores_areas", "areas"
  add_foreign_key "gestores_areas", "pessoas"
  add_foreign_key "gestores_eixos", "eixos"
  add_foreign_key "gestores_eixos", "pessoas"
  add_foreign_key "gestores_unidades", "pessoas"
  add_foreign_key "gestores_unidades", "unidades_socioeducativas"
  add_foreign_key "grupo_patrimonios", "categoria_patrimonios"
  add_foreign_key "indicadores", "areas"
  add_foreign_key "indicadores", "indicador_assuntos"
  add_foreign_key "indicadores", "indicador_unidade_medidas"
  add_foreign_key "item_patrimonios", "classe_patrimonios"
  add_foreign_key "item_patrimonios", "tipo_patrimonios"
  add_foreign_key "itens_solicitacao_patrimonios", "item_patrimonios"
  add_foreign_key "itens_solicitacao_patrimonios", "solicitacao_patrimonios"
  add_foreign_key "local_armazenamentos", "unidades_socioeducativas"
  add_foreign_key "mapa_de_bordos", "pessoas", column: "motorista_id"
  add_foreign_key "mapa_de_bordos", "pessoas", column: "responsavel_id"
  add_foreign_key "mapa_de_bordos", "veiculos"
  add_foreign_key "materiais", "classe_materiais"
  add_foreign_key "materiais", "local_armazenamentos"
  add_foreign_key "materiais", "unidades_medidas"
  add_foreign_key "material_movimentacoes", "materiais"
  add_foreign_key "material_movimentacoes", "unidades_socioeducativas"
  add_foreign_key "modelos_marcas", "marca_veiculos"
  add_foreign_key "motoristas", "pessoas"
  add_foreign_key "patrimonios", "areas"
  add_foreign_key "patrimonios", "depositos"
  add_foreign_key "patrimonios", "item_patrimonios"
  add_foreign_key "patrimonios", "status_patrimonios"
  add_foreign_key "patrimonios", "unidades_socioeducativas"
  add_foreign_key "pessoas", "cidades"
  add_foreign_key "pessoas", "socioeduk_comarcas"
  add_foreign_key "pessoas", "tipo_pessoas"
  add_foreign_key "pessoas", "usuarios"
  add_foreign_key "recursoshumanos_aditivos", "recursoshumanos_contratos"
  add_foreign_key "recursoshumanos_aditivos", "recursoshumanos_justificativa_aditivos"
  add_foreign_key "recursoshumanos_cargo_aditivos", "recursoshumanos_aditivos"
  add_foreign_key "recursoshumanos_cargo_aditivos", "recursoshumanos_cargos"
  add_foreign_key "recursoshumanos_cargos", "recursoshumanos_contratos", column: "contrato_id"
  add_foreign_key "recursoshumanos_contratos", "recursoshumanos_tipo_legais"
  add_foreign_key "recursoshumanos_contratos", "recursoshumanos_tipo_vinculos"
  add_foreign_key "recursoshumanos_tipo_legais", "recursoshumanos_tipo_vinculos"
  add_foreign_key "recursoshumanos_vinculos", "pessoas", column: "pessoas_id"
  add_foreign_key "recursoshumanos_vinculos", "recursoshumanos_cargos"
  add_foreign_key "recursoshumanos_vinculos", "unidade_socioeducativa_areas"
  add_foreign_key "servicos", "eixos"
  add_foreign_key "servicos_realizados", "areas"
  add_foreign_key "servicos_realizados", "eixos"
  add_foreign_key "servicos_realizados", "gestores_areas"
  add_foreign_key "servicos_realizados", "gestores_eixos"
  add_foreign_key "servicos_realizados", "gestores_unidades"
  add_foreign_key "servicos_realizados", "servicos"
  add_foreign_key "servicos_realizados", "socioeducandos_atendidos", column: "qtd_socioeducandos_atendidos"
  add_foreign_key "servicos_realizados", "unidades_socioeducativas"
  add_foreign_key "socioeducandos_atendidos", "unidades_socioeducativas"
  add_foreign_key "socioeduk_admissao_anexos", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_admissoes", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_admissoes", "unidades_socioeducativas"
  add_foreign_key "socioeduk_alojamento_jovens", "socioeduk_blocos"
  add_foreign_key "socioeduk_alojamento_jovens", "socioeduk_jovens"
  add_foreign_key "socioeduk_alojamento_jovens", "socioeduk_quartos"
  add_foreign_key "socioeduk_alojamento_jovens", "unidades_socioeducativas"
  add_foreign_key "socioeduk_artigo_alineas", "socioeduk_artigo_incisos"
  add_foreign_key "socioeduk_artigo_incisos", "socioeduk_artigo_paragrafos"
  add_foreign_key "socioeduk_artigo_paragrafos", "socioeduk_artigo_infracoes"
  add_foreign_key "socioeduk_atendimento_iniciais", "socioeduk_forma_entradas", column: "forma_entrada_id"
  add_foreign_key "socioeduk_atendimento_iniciais", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_atendimento_iniciais", "socioeduk_subforma_entradas", column: "subforma_entrada_id"
  add_foreign_key "socioeduk_atendimento_iniciais", "socioeduk_tipo_desligamentos", column: "tipo_desligamento_id"
  add_foreign_key "socioeduk_atendimento_iniciais", "unidades_socioeducativas"
  add_foreign_key "socioeduk_atendimento_inicial_documentos", "socioeduk_atendimento_iniciais", column: "atendimento_inicial_id"
  add_foreign_key "socioeduk_atendimento_inicial_documentos", "socioeduk_documento_forma_entradas", column: "documento_forma_entrada_id"
  add_foreign_key "socioeduk_audiencias", "socioeduk_comarcas"
  add_foreign_key "socioeduk_audiencias", "socioeduk_processos"
  add_foreign_key "socioeduk_blocos", "unidades_socioeducativas"
  add_foreign_key "socioeduk_configuracao_email_areas", "areas"
  add_foreign_key "socioeduk_configuracao_email_areas", "socioeduk_configuracao_emails"
  add_foreign_key "socioeduk_configuracao_email_funcoes", "funcoes"
  add_foreign_key "socioeduk_configuracao_email_funcoes", "socioeduk_configuracao_emails"
  add_foreign_key "socioeduk_configuracao_email_pessoas", "socioeduk_configuracao_emails"
  add_foreign_key "socioeduk_configuracao_emails", "socioeduk_tipo_acao_configuracao_emails"
  add_foreign_key "socioeduk_configuracao_emails", "socioeduk_tipo_filtro_configuracao_emails"
  add_foreign_key "socioeduk_contatos", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_contatos", "socioeduk_tipo_contatos", column: "tipo_contato_id"
  add_foreign_key "socioeduk_decisao_judiciais", "socioeduk_atendimento_iniciais", column: "atendimento_inicial_id"
  add_foreign_key "socioeduk_deficiencias", "socioeduk_deficiencias", column: "deficiencias_id"
  add_foreign_key "socioeduk_deficiencias", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_disciplina_escolaridades", "socioeduk_escolaridades"
  add_foreign_key "socioeduk_documento_forma_entradas", "socioeduk_forma_entradas", column: "forma_entrada_id"
  add_foreign_key "socioeduk_documento_forma_entradas", "socioeduk_subforma_entradas", column: "subforma_entrada_id"
  add_foreign_key "socioeduk_documentos", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_endereco_jovens", "bairros"
  add_foreign_key "socioeduk_endereco_jovens", "cidades"
  add_foreign_key "socioeduk_endereco_jovens", "socioeduk_jovens"
  add_foreign_key "socioeduk_endereco_jovens", "socioeduk_tipo_enderecos", column: "socioeduk_tipo_enderecos_id"
  add_foreign_key "socioeduk_enderecos", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_entorpecentes", "unidades_medidas"
  add_foreign_key "socioeduk_evasoes", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_gestao_vagas", "usuarios"
  add_foreign_key "socioeduk_infracao_preliminares", "socioeduk_atendimento_iniciais", column: "atendimento_inicial_id"
  add_foreign_key "socioeduk_infracao_preliminares", "socioeduk_tipo_infracoes", column: "tipo_infracao_id"
  add_foreign_key "socioeduk_infracoes", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_infracoes", "socioeduk_tipo_infracoes", column: "tipo_infracao_id"
  add_foreign_key "socioeduk_jovem_apreensoes", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_apreensoes", "socioeduk_tipo_decisao_judiciais"
  add_foreign_key "socioeduk_jovem_apreensoes", "socioeduk_tipo_medida_socioeducativas"
  add_foreign_key "socioeduk_jovem_caracteristicas", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_caracteristicas", "socioeduk_tipo_sinais"
  add_foreign_key "socioeduk_jovem_contatos", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_contatos", "socioeduk_tipo_contatos"
  add_foreign_key "socioeduk_jovem_contatos", "socioeduk_tipo_parentescos", column: "socioeduk_tipo_parentescos_id"
  add_foreign_key "socioeduk_jovem_controle_pertences", "socioeduk_jovem_recepcoes"
  add_foreign_key "socioeduk_jovem_documentos", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_documentos", "socioeduk_tipo_documentos"
  add_foreign_key "socioeduk_jovem_item_pertences", "socioeduk_jovem_controle_pertences"
  add_foreign_key "socioeduk_jovem_ocorrencias", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_ocorrencias", "socioeduk_tipo_ocorrencias"
  add_foreign_key "socioeduk_jovem_recepcoes", "socioeduk_doc_recepcoes", column: "socioeduk_doc_recepcoes_id"
  add_foreign_key "socioeduk_jovem_recepcoes", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_recepcoes", "socioeduk_tipo_medida_socioeducativas"
  add_foreign_key "socioeduk_jovem_recepcoes", "usuarios"
  add_foreign_key "socioeduk_jovem_saidas", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_suicidios", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_suicidios", "unidades_socioeducativas"
  add_foreign_key "socioeduk_jovem_transferencias", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_transferencias", "unidades_socioeducativas"
  add_foreign_key "socioeduk_jovens", "socioeduk_cor_olhos", column: "socioeduk_cor_olhos_id"
  add_foreign_key "socioeduk_jovens", "socioeduk_opcao_sexuais", column: "opcao_sexual_id"
  add_foreign_key "socioeduk_jovens", "socioeduk_raca_cores"
  add_foreign_key "socioeduk_jovens", "socioeduk_situacao_adolescentes"
  add_foreign_key "socioeduk_jovens", "socioeduk_tipo_cabelos"
  add_foreign_key "socioeduk_jovens", "usuarios"
  add_foreign_key "socioeduk_marca_corporais", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_marca_corporais", "socioeduk_marca_corporais", column: "marca_corporal_id"
  add_foreign_key "socioeduk_medida_socioeducativa_historicos", "socioeduk_medida_socioeducativa_motivo_conclusoes"
  add_foreign_key "socioeduk_medida_socioeducativa_historicos", "socioeduk_medida_socioeducativas"
  add_foreign_key "socioeduk_medida_socioeducativas", "socioeduk_circunstancias"
  add_foreign_key "socioeduk_medida_socioeducativas", "socioeduk_encaminhamento_conclusao_medida_socioeducativas", column: "socioeduk_encaminhamento_conclusao_medida_socioeducativas_id"
  add_foreign_key "socioeduk_medida_socioeducativas", "socioeduk_medida_socioeducativa_motivo_conclusoes"
  add_foreign_key "socioeduk_medida_socioeducativas", "socioeduk_numero_processos"
  add_foreign_key "socioeduk_medida_socioeducativas", "socioeduk_processos"
  add_foreign_key "socioeduk_medida_socioeducativas", "socioeduk_situacao_cumprimentos"
  add_foreign_key "socioeduk_medida_socioeducativas", "socioeduk_tipo_conclusao_medida_socioeducativas", column: "socioeduk_tipo_conclusao_medida_socioeducativas_id"
  add_foreign_key "socioeduk_medida_socioeducativas", "socioeduk_tipo_medida_socioeducativas"
  add_foreign_key "socioeduk_numero_processos", "cidades"
  add_foreign_key "socioeduk_numero_processos", "socioeduk_comarcas"
  add_foreign_key "socioeduk_numero_processos", "socioeduk_processos"
  add_foreign_key "socioeduk_ocorrencias", "socioeduk_tipo_ocorrencias"
  add_foreign_key "socioeduk_outro_nomes", "socioeduk_jovens"
  add_foreign_key "socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas", "socioeduk_escolaridades"
  add_foreign_key "socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas", "socioeduk_pedagogico_jovem_escolaridade_medidas"
  add_foreign_key "socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas", "socioeduk_situacao_disciplinas"
  add_foreign_key "socioeduk_pedagogico_jovem_disciplina_escolaridades", "socioeduk_disciplina_escolaridades"
  add_foreign_key "socioeduk_pedagogico_jovem_disciplina_escolaridades", "socioeduk_pedagogico_jovens", column: "pedagogico_jovem_id"
  add_foreign_key "socioeduk_pedagogico_jovem_disciplina_escolaridades", "socioeduk_situacao_disciplinas"
  add_foreign_key "socioeduk_pedagogico_jovem_escolaridade_medidas", "socioeduk_escolaridades"
  add_foreign_key "socioeduk_pedagogico_jovem_escolaridade_medidas", "socioeduk_pedagogico_jovens", column: "pedagogico_jovem_id"
  add_foreign_key "socioeduk_pedagogico_jovem_escolaridade_medidas", "socioeduk_tipo_local_cursos"
  add_foreign_key "socioeduk_pedagogico_jovem_oficinas", "socioeduk_pedagogico_jovens"
  add_foreign_key "socioeduk_pedagogico_jovem_oficinas", "socioeduk_tipo_oficinas"
  add_foreign_key "socioeduk_pedagogico_jovem_profissionalizantes", "socioeduk_pedagogico_jovens"
  add_foreign_key "socioeduk_pedagogico_jovem_profissionalizantes", "socioeduk_tipo_cursos"
  add_foreign_key "socioeduk_pedagogico_jovem_profissionalizantes", "socioeduk_tipo_local_cursos"
  add_foreign_key "socioeduk_pedagogico_jovens", "socioeduk_escolaridades"
  add_foreign_key "socioeduk_pedagogico_jovens", "socioeduk_jovens"
  add_foreign_key "socioeduk_pedagogico_jovens", "socioeduk_situacao_escolares"
  add_foreign_key "socioeduk_pedagogico_jovens", "socioeduk_tipo_alfabetizados"
  add_foreign_key "socioeduk_processo_advogados", "socioeduk_processos"
  add_foreign_key "socioeduk_processo_advogados", "unidades_socioeducativas"
  add_foreign_key "socioeduk_processo_anexos", "socioeduk_processos"
  add_foreign_key "socioeduk_processo_envolvidos", "socioeduk_jovens"
  add_foreign_key "socioeduk_processo_envolvidos", "socioeduk_processos"
  add_foreign_key "socioeduk_processo_naturezas", "socioeduk_artigo_alineas"
  add_foreign_key "socioeduk_processo_naturezas", "socioeduk_artigo_incisos"
  add_foreign_key "socioeduk_processo_naturezas", "socioeduk_artigo_infracoes"
  add_foreign_key "socioeduk_processo_naturezas", "socioeduk_artigo_paragrafos"
  add_foreign_key "socioeduk_processo_naturezas", "socioeduk_numero_processos"
  add_foreign_key "socioeduk_processo_observacoes", "socioeduk_processos"
  add_foreign_key "socioeduk_processo_recepcao_jovem_infracoes", "socioeduk_processo_recepcao_jovens"
  add_foreign_key "socioeduk_processo_recepcao_jovens", "socioeduk_jovem_recepcoes"
  add_foreign_key "socioeduk_processo_recepcao_jovens", "socioeduk_processos"
  add_foreign_key "socioeduk_processos", "socioeduk_jovem_recepcoes"
  add_foreign_key "socioeduk_processos", "socioeduk_situacao_processos"
  add_foreign_key "socioeduk_processos", "socioeduk_status_processos"
  add_foreign_key "socioeduk_processos", "socioeduk_tipo_processos"
  add_foreign_key "socioeduk_quartos", "socioeduk_blocos"
  add_foreign_key "socioeduk_relatorio_diarios", "unidades_socioeducativas"
  add_foreign_key "socioeduk_relatorio_diarios", "usuarios"
  add_foreign_key "socioeduk_saude_jovem_atendimentos", "socioeduk_cids"
  add_foreign_key "socioeduk_saude_jovem_atendimentos", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovem_atendimentos", "socioeduk_tipo_atendimentos"
  add_foreign_key "socioeduk_saude_jovem_doencas_historicas", "socioeduk_cids"
  add_foreign_key "socioeduk_saude_jovem_doencas_historicas", "socioeduk_saude_jovens"
  add_foreign_key "socioeduk_saude_jovem_exames", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovem_exames", "socioeduk_tipo_exames"
  add_foreign_key "socioeduk_saude_jovem_ocorrencias", "socioeduk_jovem_recepcoes"
  add_foreign_key "socioeduk_saude_jovem_ocorrencias", "socioeduk_tipo_atendimentos"
  add_foreign_key "socioeduk_saude_jovem_saude_clinicas", "socioeduk_cids"
  add_foreign_key "socioeduk_saude_jovem_saude_clinicas", "socioeduk_local_tratamentos"
  add_foreign_key "socioeduk_saude_jovem_saude_clinicas", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovem_vacinas", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovem_vacinas", "socioeduk_tipo_vacinas"
  add_foreign_key "socioeduk_saude_jovens", "socioeduk_condicao_fisicas"
  add_foreign_key "socioeduk_saude_jovens", "socioeduk_jovem_recepcoes"
  add_foreign_key "socioeduk_saude_jovens_metodos_contraceptivos", "socioeduk_metodo_contraceptivos"
  add_foreign_key "socioeduk_saude_jovens_metodos_contraceptivos", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovens_parentes_viciados", "socioeduk_entorpecentes"
  add_foreign_key "socioeduk_saude_jovens_parentes_viciados", "socioeduk_saude_jovens", column: "socioeduk_saude_jovens_id"
  add_foreign_key "socioeduk_saude_jovens_parentes_viciados", "socioeduk_tipo_parentescos"
  add_foreign_key "socioeduk_saude_jovens_substancias_utilizadas", "socioeduk_entorpecentes"
  add_foreign_key "socioeduk_saude_jovens_substancias_utilizadas", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovens_substancias_utilizadas", "socioeduk_tipo_auto_consideracoes"
  add_foreign_key "socioeduk_saude_jovens_substancias_utilizadas", "socioeduk_tipo_tratamentos"
  add_foreign_key "socioeduk_saude_jovens_tipo_medicamento_controlados", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovens_tipo_medicamento_controlados", "socioeduk_tipo_medicamento_controlados", column: "socioeduk_tipo_medicamneto_controlado_id"
  add_foreign_key "socioeduk_saude_jovens_tipo_parentesco_doenca_mentais", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovens_tipo_parentesco_doenca_mentais", "socioeduk_tipo_parentescos"
  add_foreign_key "socioeduk_saude_jovens_tipo_parentesco_suicidios", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovens_tipo_parentesco_suicidios", "socioeduk_tipo_parentescos"
  add_foreign_key "socioeduk_saude_jovens_tipo_parentescos", "socioeduk_saude_jovens", column: "saude_jovem_id"
  add_foreign_key "socioeduk_saude_jovens_tipo_parentescos", "socioeduk_tipo_parentescos"
  add_foreign_key "socioeduk_solicitacao_vaga_infracoes", "bairros"
  add_foreign_key "socioeduk_solicitacao_vaga_infracoes", "cidades"
  add_foreign_key "socioeduk_solicitacao_vagas", "cidades"
  add_foreign_key "socioeduk_solicitacao_vagas", "estados"
  add_foreign_key "socioeduk_solicitacao_vagas", "socioeduk_opcao_sexuais"
  add_foreign_key "socioeduk_solicitacao_vagas", "socioeduk_tipo_enderecos"
  add_foreign_key "socioeduk_solicitacao_vagas", "socioeduk_tipo_medida_socioeducativas"
  add_foreign_key "socioeduk_solicitacao_vagas", "usuarios"
  add_foreign_key "socioeduk_subforma_entradas", "socioeduk_forma_entradas", column: "forma_entrada_id"
  add_foreign_key "socioeduk_tecnico_jovem_anexos", "socioeduk_tecnico_jovens"
  add_foreign_key "socioeduk_tecnico_jovem_anexos", "unidades_socioeducativas"
  add_foreign_key "socioeduk_tecnico_jovem_familias", "socioeduk_escolaridades"
  add_foreign_key "socioeduk_tecnico_jovem_familias", "socioeduk_tecnico_jovens"
  add_foreign_key "socioeduk_tecnico_jovem_familias", "socioeduk_tipo_parentescos"
  add_foreign_key "socioeduk_tecnico_jovem_plano_atendimentos", "socioeduk_tecnico_jovens", column: "tecnico_jovem_id"
  add_foreign_key "socioeduk_tecnico_jovem_programa_sociais", "socioeduk_programa_sociais"
  add_foreign_key "socioeduk_tecnico_jovem_programa_sociais", "socioeduk_tecnico_jovens", column: "tecnico_jovem_id"
  add_foreign_key "socioeduk_tecnico_jovem_ultimo_relatorios", "socioeduk_sugestao_relatorios"
  add_foreign_key "socioeduk_tecnico_jovem_ultimo_relatorios", "socioeduk_tecnico_jovens", column: "tecnico_jovem_id"
  add_foreign_key "socioeduk_tecnico_jovem_ultimo_relatorios", "socioeduk_tipo_retornos"
  add_foreign_key "socioeduk_tecnico_jovem_visita_familiares", "socioeduk_tecnico_jovens", column: "tecnico_jovem_id"
  add_foreign_key "socioeduk_tecnico_jovens", "socioeduk_composicao_familiares"
  add_foreign_key "socioeduk_tecnico_jovens", "socioeduk_convivio_familiares"
  add_foreign_key "socioeduk_tecnico_jovens", "socioeduk_jovens"
  add_foreign_key "socioeduk_tecnico_jovens", "socioeduk_plano_individual_atendimentos"
  add_foreign_key "socioeduk_tecnico_jovens", "socioeduk_renda_familiares"
  add_foreign_key "socioeduk_tipo_filtro_configuracao_emails", "socioeduk_tipo_acao_configuracao_emails"
  add_foreign_key "socioeduk_transferencias", "socioeduk_admissoes", column: "admissao_id"
  add_foreign_key "socioeduk_visitante_jovens", "socioeduk_jovens"
  add_foreign_key "socioeduk_visitante_jovens", "socioeduk_tipo_parentescos"
  add_foreign_key "socioeduk_visitante_jovens", "socioeduk_visitantes"
  add_foreign_key "socioeduk_visitantes", "socioeduk_jovens"
  add_foreign_key "socioeduk_visitantes", "socioeduk_tipo_documentos"
  add_foreign_key "solicitacao_transportes", "areas"
  add_foreign_key "solicitacao_transportes", "tipo_solicitacao_transportes"
  add_foreign_key "unidade_bloco_dormitorio_capacidades", "unidade_bloco_dormitorios"
  add_foreign_key "unidade_bloco_dormitorio_capacidades", "usuarios"
  add_foreign_key "unidade_bloco_dormitorios", "unidade_socioeducativa_blocos"
  add_foreign_key "unidade_socioeducativa_areas", "areas"
  add_foreign_key "unidade_socioeducativa_areas", "unidades_socioeducativas"
  add_foreign_key "unidade_socioeducativa_blocos", "socioeduk_tipo_medida_socioeducativas"
  add_foreign_key "unidade_socioeducativa_blocos", "unidades_socioeducativas"
  add_foreign_key "unidades_socioeducativas", "cidades"
  add_foreign_key "urlbm_mapas", "cidades"
  add_foreign_key "urlbm_mapas", "socioeduk_jovem_recepcoes"
  add_foreign_key "urlbm_mapas", "urlbm_ato_infracionais"
  add_foreign_key "urlbm_mapas", "urlbm_status_maps"
  add_foreign_key "usuarios", "permissoes"
  add_foreign_key "veiculos", "marca_veiculos"
  add_foreign_key "veiculos", "modelos_marcas"
  add_foreign_key "veiculos", "tipo_de_combustiveis"
end
