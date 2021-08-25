# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :urlbm do
    resources :mapas do
      get "/urlbm/mapas", to: "urlbm/mapas#index", as: :urlbm_mapas
    end
  end
  namespace :urlbm do
    resources :status_maps
  end
  namespace :urlbm do
    resources :ato_infracionais
  end
  namespace :socioeduk do
    resources :doc_recepcoes
  end
  namespace :socioeduk do
    resources :tipo_documento_recepcoes
  end
  namespace :socioeduk do
    resources :jovem_controle_pertences
  end
  namespace :socioeduk do
    resources :saude_jovem_ocorrencias
  end
  resources :bairros
  namespace :socioeduk do
    resources :relatorios do
      collection do
        match :total_jovens_provisoria_decurso_ip, via: [:get, :post]
        match :quantidade_por_tipo_conclusao_medidas, via: [:get, :post]
        match :quantidade_por_tipo_conclusao_medida_detalhes, via: [:get, :post]
        match :tempo_cumprimento_por_medidas, via: [:get, :post]
        match :qtd_infracoes_tentada_consumada, via: [:get, :post]
        match :movimentacao_transferencias, via: [:get, :post]
        match :mapeamento_atendimentos, via: [:get, :post]
        match :relacao_adolescentes, via: [:get, :post]
        match :ocupacao_quantitativos, via: [:get, :post]
        match :qtd_jovens_por_sexo, via: [:get, :post]
        match :quantitativo_por_ato_infracionais, via: [:get, :post]
        match :quantitativo_por_comarcas, via: [:get, :post]
        match :quantitativo_em_espera, via: [:get, :post]
      end
    end
  end

  resources :tipo_pessoas
  namespace :gestao_demandas do
    resources :solicitacoes
  end
  namespace :socioeduk do
    resources :solicitacao_vaga_infracoes
  end
  namespace :socioeduk do
    match "solicitacao_vagas/cidades_por_estado", via: [:get, :post]
    match "solicitacao_vagas/bairros_por_cidade", via: [:get, :post]
    resources :solicitacao_vagas do
      collection do
        get :autorizar_vaga
        get :negar_vaga
        match :aguardar_solicitacao_vaga, via: [:get, :post]
        match :autorizar_solicitacao_vaga, via: [:get, :post]
        match :informar_dados_ausente, via: [:get, :post]
        get :administracao_solicitante
      end
    end
  end
  namespace :socioeduk do
    resources :artigo_paragrafos
  end
  namespace :socioeduk do
    resources :artigo_infracoes do
      collection do
        get :buscar_por_id
      end
    end
  end

  resources :unidade_socioeducativa_areas

  namespace :socioeduk do
    resources :relatorio_diarios do
      collection do
        match :monitoramento, via: [:get, :post]
        match :monitoramento_unidade, via: [:get, :post]
      end
    end
  end
  # namespace :socioeduk do
  #   resources :numero_processos
  # end
  # namespace :socioeduk do
  #   resources :audiencias
  # end
  # namespace :socioeduk do
  #   resources :audiencias
  # end
  namespace :socioeduk do
    resources :medida_socioeducativas
  end
  # namespace :socioeduk do
  #   resources :circunstancias
  # end
  # namespace :socioeduk do
  #   resources :situacao_cumprimentos
  # end

  # namespace :socioeduk do
  #   resources :processo_recepcao_jovem_infracoes do
  #     collection do
  #       get :infracao
  #     end
  #   end
  # end

  namespace :api do
    resources :login do
      post "logar", on: :collection
    end
  end

  namespace :api do
    resources :relatorio_diarios do
      get "listar_envio_unidades", on: :collection
    end
  end

  namespace :socioeduk do
    resources :jovem_recepcoes do
      get :listar_recepcoes
      get :editar_recepcoes
      collection do
        get :medida_meio_aberto
        get :editar_meio_aberto
        get :recepcao_direta
        post :aplicar_medida_meio_aberto
        post :editar_medida_meio_aberto
        get :buscar_jovem_recepcionado
      end
    end
  end
  resources :itens_solicitacao_patrimonios
  resources :solicitacao_patrimonios do
    collection do
      get :autorizar_solicitacao
      get :atender_solicitacao
      post :atender_itens_solicitacao
      post :atender_itens_solicitacao
      get :solicitacoes_autorizadas
      get :solicitacoes_atendidas
    end
  end
  resources :unidade_bloco_dormitorios
  resources :unidade_socioeducativa_blocos
  namespace :biblioteca do
    resources :editoras
  end
  namespace :socioeduk do
    resources :gestao_vagas, only: [:index, :new, :update] do
      collection do
        get :cadastrar_blocos
        get :cadastrar_dormitorios
        get :gerir_vagas
        get :visualizar_vagas
        get :admitir
        get :transferir
        get :dashboards
        get :indicadores
        get :listar_jovens
        get :visualizar_pontuacao
        get :acompanhar_solicitacao_vagas
        get :visualizar_solicitacao_vagas
        get :baixar_relatorio_csv
        get :flag_hononimo
        get :ativos_recepcao
        get :buscar_jovem_recepcionado
        match :salvar_emissao, via: [:get, :post]
        match :salvar_transferencia, via: [:get, :post]
        match :fila_vagas, via: [:get, :post]
      end
    end
  end

  namespace :socioeduk do
    match "configuracoes/configuracao_emails", via: [:get, :post]
    match "configuracoes/configuracao_email_filtro_por_acao", via: [:get, :post]
    match "configuracoes/configuracao_email_pessoas", via: [:get, :post]
    match "configuracoes/configuracao_email_salvar", via: [:get, :post]
    match "configuracoes/configuracao_email_salvar_body", via: [:get, :post]
    match "configuracoes/configuracao_email_destroy", via: [:get, :post]
    match "configuracoes/configuracao_email_area_destroy", via: [:get, :post]
    match "configuracoes/configuracao_email_funcao_destroy", via: [:get, :post]
    match "configuracoes/configuracao_email_pessoa_destroy", via: [:get, :post]
    match "configuracoes/buscar_por_id_configuracao_email", via: [:get, :post]
  end

  namespace :biblioteca do
    resources :local_publicacoes
  end
  namespace :socioeduk do
    resources :marca_corporais
  end
  namespace :socioeduk do
    resources :ocorrencias
  end
  namespace :socioeduk do
    resources :processo_naturezas
  end
  namespace :socioeduk do
    resources :processo_advogados
  end
  namespace :socioeduk do
    resources :jovem_suicidios
  end
  namespace :socioeduk do
    resources :visitante_jovens
  end
  namespace :socioeduk do
    resources :visitantes
  end
  namespace :socioeduk do
    resources :jovem_saidas
  end
  namespace :socioeduk do
    resources :jovem_documentos
  end
  namespace :socioeduk do
    resources :saude_jovens_tipo_parentescos
  end
  namespace :socioeduk do
    resources :jovem_apreensoes
  end
  namespace :socioeduk do
    resources :jovem_transferencias
  end
  namespace :socioeduk do
    resources :jovem_ocorrencias
  end
  namespace :socioeduk do
    resources :processo_anexos
  end
  namespace :socioeduk do
    resources :alojamento_jovens
  end

  # namespace :socioeduk do
  #   resources :processos
  # end
  namespace :socioeduk do
    match "processos/buscar_data_infracao", via: [:get, :post]
    match "processos/listar_conclusao", via: [:get, :post]
    resources :processos do
      collection do
        post :listar_paragrafos
        post :listar_incisos
        post :listar_alineas
        get :adicionar_medida
        get :editar_medida
        get :deletar_medida
        get :finalizar_processo
        get :evadir_processo
        get :fuga_processo
        get :reverter_processo_finalizado
      end
    end
  end

  namespace :socioeduk do
    resources :municipios
  end
  namespace :socioeduk do
    resources :blocos
  end
  namespace :socioeduk do
    resources :tecnico_jovem_anexos
  end
  namespace :socioeduk do
    resources :situacao_processos
  end
  namespace :socioeduk do
    resources :comarcas
  end
  # namespace :socioeduk do
  #   resources :tipo_processos
  # end
  namespace :socioeduk do
    resources :tecnico_jovem_programa_sociais
  end
  namespace :socioeduk do
    resources :programa_sociais
  end
  namespace :socioeduk do
    resources :tecnico_jovem_familias
  end
  namespace :socioeduk do
    resources :tecnico_jovem_plano_atendimentos
  end
  namespace :socioeduk do
    resources :tecnico_jovem_ultimo_relatorios
  end
  namespace :socioeduk do
    resources :tipo_retornos
  end
  namespace :socioeduk do
    resources :sugestao_relatorios
  end
  namespace :socioeduk do
    resources :tecnico_jovem_visita_familiares
  end
  namespace :socioeduk do
    resources :tecnico_jovens
  end
  namespace :socioeduk do
    resources :plano_individual_atendimentos
  end
  namespace :socioeduk do
    resources :pedagogico_jovem_disciplina_escolaridade_medidas
  end
  namespace :socioeduk do
    resources :pedagogico_jovem_escolaridade_medidas
  end
  namespace :socioeduk do
    resources :pedagogico_jovem_disciplina_escolaridades
  end
  namespace :socioeduk do
    resources :pedagogico_jovem_profissionalizantes
  end
  namespace :socioeduk do
    resources :pedagogico_jovem_oficinas
  end
  namespace :socioeduk do
    resources :pedagogico_jovens
  end
  namespace :socioeduk do
    resources :composicao_familiares
  end
  namespace :socioeduk do
    resources :renda_familiares
  end
  namespace :socioeduk do
    resources :convivio_familiares
  end
  namespace :socioeduk do
    resources :quartos
  end
  namespace :socioeduk do
    resources :tipo_oficinas
  end
  namespace :socioeduk do
    resources :tipo_local_cursos
  end
  namespace :socioeduk do
    resources :tipo_cursos
  end
  namespace :socioeduk do
    resources :tipo_alfabetizados
  end
  namespace :socioeduk do
    resources :tipo_medida_socioeducativas, only: [:index]
  end
  namespace :socioeduk do
    resources :tipo_decisao_judiciais
  end
  namespace :socioeduk do
    resources :situacao_disciplinas
  end
  namespace :socioeduk do
    resources :local_atendimentos
  end
  namespace :recursoshumanos do
    resources :cargo_aditivos
  end
  namespace :recursoshumanos do
    resources :aditivos
  end
  namespace :recursoshumanos do
    resources :justificativa_aditivos
  end
  namespace :socioeduk do
    resources :disciplina_escolaridades
  end
  namespace :socioeduk do
    resources :situacao_escolares
  end
  namespace :socioeduk do
    resources :situacao_ocupacionais
  end
  namespace :socioeduk do
    resources :escolaridades
  end
  namespace :biblioteca do
    resources :emprestimos
  end
  namespace :biblioteca do
    resources :livros
  end
  namespace :biblioteca do
    resources :locais
  end
  namespace :biblioteca do
    resources :autores
  end
  namespace :socioeduk do
    resources :saude_jovens_metodos_contraceptivos
  end
  namespace :socioeduk do
    resources :saude_jovens_substancias_utilizadas
  end
  namespace :socioeduk do
    resources :tipo_auto_consideracoes
  end
  namespace :socioeduk do
    resources :saude_jovens_parentes_viciados
  end
  namespace :socioeduk do
    resources :saude_jovens_tipo_medicamento_controlados
  end
  namespace :socioeduk do
    resources :saude_jovens_tipo_parentesco_suicidios
  end
  namespace :socioeduk do
    resources :saude_jovens_tipo_parentesco_doenca_mentais
  end
  namespace :socioeduk do
    resources :saude_jovem_saude_clinicas
  end
  namespace :socioeduk do
    resources :saude_jovem_doencas_historicas
  end
  namespace :socioeduk do
    resources :saude_jovem_vacinas
  end
  namespace :socioeduk do
    resources :saude_jovem_exames
  end
  namespace :socioeduk do
    resources :saude_jovem_atendimentos
  end
  namespace :socioeduk do
    resources :saude_jovens
  end
  namespace :socioeduk do
    resources :condicao_fisicas
  end
  namespace :socioeduk do
    resources :tipo_guia_execucoes
  end
  namespace :socioeduk do
    resources :outro_nomes
  end
  namespace :socioeduk do
    resources :tipo_atendimentos
  end
  namespace :socioeduk do
    resources :tipo_exames
  end
  namespace :socioeduk do
    resources :tipo_vacinas
  end
  namespace :socioeduk do
    resources :cids
  end
  namespace :socioeduk do
    resources :tipo_medicamento_controlados
  end
  namespace :socioeduk do
    resources :local_tratamentos
  end
  namespace :socioeduk do
    resources :tipo_tratamentos
  end
  namespace :socioeduk do
    resources :tipo_parentescos
  end
  namespace :socioeduk do
    resources :metodo_contraceptivos
  end
  namespace :socioeduk do
    resources :entorpecentes
    resources :tipo_documentos
  end
  namespace :socioeduk do
    resources :tipo_ocorrencias do
      collection do
        match :listar_ocorrencias, via: [:get, :post]
      end
    end
  end
  namespace :socioeduk do
    resources :jovem_contatos
  end
  namespace :socioeduk do
    resources :tipo_telefones
  end
  namespace :socioeduk do
    resources :jovem_caracteristicas
  end
  namespace :socioeduk do
    resources :tipo_sinais
  end
  namespace :socioeduk do
    resources :endereco_jovens
  end
  namespace :socioeduk do
    resources :situacao_adolescentes
  end
  resources :situacao_adolescentes
  namespace :socioeduk do
    resources :cor_olhos
  end
  namespace :socioeduk do
    resources :raca_cores
  end
  namespace :socioeduk do
    resources :tipo_cabelos
  end
  namespace :socioeduk do
    resources :situacao_adolecentes
  end
  resources :cidades
  resources :estados
  resources :regioes
  resources :motoristas do
    member do
      get :ocupar
      get :ausentar
      get :disponibilizar
    end
  end
  resources :mapa_de_bordos do
    member do
      get :autorizar
      get :finalizar
      get :imprimir_mapa_bordo
    end
  end
  get "dashboard_patrimonio/index"

  namespace :recursoshumanos do
    get "dashboard/index"
  end

  resources :categoria_patrimonios
  namespace :recursoshumanos do
    patch ":cpf/gerar_contrato" => "vinculos#gerar_contrato", as: "vinculos_gerar_contrato"
    match "vinculos/areas_por_unidade", via: [:get, :post]
    get "vinculos/visualizar_contrato" => "vinculos#visualizar_contrato"

    resources :vinculos do
      collection do
        get :desligamento
        match :desligar_colaborador, via: [:get, :post]
      end
    end
  end
  resources :item_patrimonios do
    get "lista_classes_grupo", on: :collection
  end
  get "estoque_patrimonio/index"

  resources :tipo_patrimonios
  resources :classe_patrimonios
  resources :grupo_patrimonios
  resources :depositos
  resources :status_patrimonios
  resources :patrimonios do
    collection do
      get :lista_classes_grupo
      match :lista_itens_classe, via: %i[get post]
      match :informacoes_item_patrimonio, via: %i[get post]
      match :lista_areas, via: %i[get post]
      match :lista_subareas, via: %i[get post]
    end
  end
  namespace :recursoshumanos do
    resources :cargos
  end
  namespace :recursoshumanos do
    resources :contratos
  end
  namespace :recursoshumanos do
    resources :tipo_legais
  end
  resources :tipo_solicitacao_transportes
  resources :solicitacao_transportes do
    collection do
      get :justificar_cancelamento
      post :salvar_justificativa_cancelamento
    end
    member do
      get :autorizar
      get :dar_andamento
      get :finalizar
      get :cancelar
    end
  end
  namespace :recursoshumanos do
    resources :tipo_vinculos
  end
  get "seguranca/index"

  resources :veiculos do
    member do
      get :ativar
      get :consertar
      get :ocupar
      get :alocar
      get :disponibilizar
    end
  end
  resources :tipo_de_combustiveis
  resources :funcao_pessoas
  resources :modelos_marcas
  resources :funcoes
  resources :posto_combustiveis
  resources :marca_veiculos
  resources :indicador_assuntos
  resources :local_armazenamentos
  get "indicadores/relatorio" => "indicadores#relatorio"
  get "indicadores/list" => "indicadores#list"
  resources :coleta_indicadores do
    collection do
      get :preselect
      get "indicadores_filtered_list/" => "coleta_indicadores#index", as: "index_get"
      post "indicadores_filtered_list/" => "coleta_indicadores#index", as: "index"
    end
  end
  resources :indicadores
  resources :indicador_unidade_medidas
  resources :material_movimentacoes
  resources :capacidades_diarias
  resources :capacidades_originais
  resources :classe_materiais
  resources :permissoes do
    get "duplicate"
  end
  resources :servicos_realizados
  resources :servicos
  resources :gestores_unidades
  resources :gestores_areas
  resources :gestores_eixos
  resources :socioeducandos_atendidos
  
  resources :pessoas do
    collection do
      get :contratacao
    end
  end

  resources :pessoa_juizes do
    collection do
      get :juizes_cidade
      get :redefinir_senha
    end
  end

  resources :areas
  resources :unidades_socioeducativas
  resources :materiais
  resources :unidades_medidas
  resources :grupo_materiais
  resources :eixos

  # get 'socioeduk' => 'home#sistemas_socioeduk'
  get "sistemas" => "home#sistemas"
  get "socioeduk" => "home#tela_inicial_socioeduk"
  get "filtra_eixos" => "gestores_eixos#eixos"
  get "filtra_areas" => "gestores_areas#areas"
  get "filtra_unidades" => "gestores_unidades#unidades"
  get "socioeducandos_atendidos/filter/:unidade/:ano/:mes" => "socioeducandos_atendidos#filter"

  devise_for :usuarios, controllers: { sessions: "usuarios/sessions", registrations: "usuarios/registrations" }, path_names: { sign_in: "login", sign_out: "logout" }

  devise_scope :usuario do
    root to: "home#sistemas"
  end

  post "admin/usuarios/calcular"
  namespace :admin do
    resources :usuarios do
      get "redefinir_senha"
      get "bloquear_usuario"
      collection do
        get "buscar_usuario_cpf"
      end
    end
  end

  get 'socioeduk/jovens/images/:id/:foto', action: :fotos, controller: 'socioeduk/jovens'
  namespace :socioeduk do
    match "jovens/cidades_por_estado", via: [:get, :post]
    match "jovens/deletar_transferir_jovem", via: [:get, :post]
    resources :jovens do
      collection do
        get :detalhe_recepcao
        get :editar_historico_transferencia
        get :transferir_jovem
        match :salvar_transferencia, via: [:get, :post]
        get :buscar_jovem_por_nome
        get :autocomplete
        get :dashboards
        get :bairros_por_cidade
        get :fotos
        get :buscar_por_id
      end
      resources :admissoes do
        resources :admissao_anexos, as: :anexos
        resources :transferencias
        resources :infracoes
        resources :evasoes
      end
      resources :deficiencias
      resources :marca_corporais
      resources :contatos
      resources :enderecos
      resources :documentos
      resources :atendimento_iniciais do
        resources :infracao_preliminares
      end
    end
    resources :decisao_judiciais
    resources :atendimento_inicial_documentos
    resources :documento_forma_entradas
    resources :subforma_entradas
    resources :forma_entradas
    resources :tipo_desligamentos
    resources :tipo_contatos
    resources :opcao_sexuais
    resources :tipo_marca_corporais
    resources :tipo_infracoes
    resources :tipo_deficiencias
  end
end
