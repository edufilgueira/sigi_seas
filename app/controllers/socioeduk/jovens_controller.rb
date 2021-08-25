# frozen_string_literal: true

class Socioeduk::JovensController < SocioedukApplicationController
  before_action :set_socioeduk_jovem, only: %i[show edit update destroy]
  # add_breadcrumb I18n.t('activerecord.models.socioeduk_jovem').pluralize, :socioeduk_jovens_path
  # add_breadcrumb 'Detalhe', :socioeduk_jovem_path, only: [:show]
  # add_breadcrumb 'Novo', :new_socioeduk_jovem_path, only: %i[new create]
  # add_breadcrumb 'Editar', :edit_socioeduk_jovem_path, only: %i[edit update]

  respond_to :html
  def index
    # @socioeduk_jovens = Socioeduk::Jovem.all.order(:nome)
    @socioeduk_jovens = Socioeduk::Jovem.all.order(:nome).page(params[:page]).per(50)
    @q = @socioeduk_jovens.ransack(params[:q])
    @socioeduk_jovens = @q.result
    respond_to do |format|
      format.html
      format.csv { send_data Socioeduk::Jovem.all.order(:nome).to_csv, filename: "todos-jovens-#{Date.today}.csv" }
    end
  end

  def fotos
    jovem = Socioeduk::Jovem.find(params[:id])
    caminho = "#{Rails.root}/app"+jovem.foto.to_s
    caminha_split = caminho.split("?")
    send_file caminha_split[0], type: 'image/jpg', disposition: 'inline'
  end

  def autocomplete
    @socioeduk_jovens = Socioeduk::Jovem.all.pluck(:nome)
    render json: @socioeduk_jovens
  end

  def buscar_por_id
    jovens = Socioeduk::Jovem.select(:id, :nome, :data_nascimento, :nome_mae, :nome_pai).where(id: params[:id])
    #raise jovens.inspect
    render json: jovens[0]
  end

  def show; end

  def new
    @socioeduk_jovem = Socioeduk::Jovem.new
    # @socioeduk_jovem.jovem_recepcoes.build
    # @socioeduk_jovem.outros_nomes.build
    # @socioeduk_jovem.jovem_caracteristicas.build
    # @socioeduk_jovem.endereco_jovens.build
    # @socioeduk_jovem.jovem_contatos.build
  end

  def edit
    status = []
    recepcoes = Socioeduk::JovemRecepcao.where(socioeduk_jovem_id: params[:id])
    recepcoes.each do |recepcao|
      status.push(recepcao.status)
    end

    @temRecepcaoAtiva = if status.find_index(true).nil?
                          false
                        else
                          true
                        end
  end

  def create
    #Altera o nome da imagem durante upload
    if !socioeduk_jovem_params[:foto].nil?
      texto = socioeduk_jovem_params[:foto].original_filename
      texto = remover_acentos(texto)
      texto = remover_caracteres_especiais(texto)
      socioeduk_jovem_params[:foto].original_filename = texto.upcase
    end
    @socioeduk_jovem = Socioeduk::Jovem.new(socioeduk_jovem_params)
    unless @socioeduk_jovem.cpf.nil?
      @socioeduk_jovem.cpf = socioeduk_jovem_params[:cpf].gsub(/[^0-9]/, '')
    end
    # Salvar usuario logado
    @socioeduk_jovem.usuario_id = current_usuario.id

    respond_to do |format|
      if @socioeduk_jovem.save
        incluir_nova_vaga_unidade_recepcao(socioeduk_jovem_params[:jovem_recepcoes_attributes])
        # format.html { redirect_to socioeduk_jovens_url, notice: I18n.t('messages.cadastro_sucesso') }
        # format.json { render :show, status: :created, location: @socioeduk_jovem }
        format.html { redirect_to edit_socioeduk_jovem_path(@socioeduk_jovem.id, notice: 'create'), notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :edit, status: :edited, location: @socioeduk_jovem }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #Verifica se o campo FOTO estar vazio para alterar o nome da imagem durante upload
    if !socioeduk_jovem_params[:foto].nil?
      texto = socioeduk_jovem_params[:foto].original_filename
      texto = remover_acentos(texto)
      texto = remover_caracteres_especiais(texto)
      socioeduk_jovem_params[:foto].original_filename = texto.upcase
    end

    if @socioeduk_jovem.update(socioeduk_jovem_params)
      unless @socioeduk_jovem.cpf.nil?
        @socioeduk_jovem.cpf = socioeduk_jovem_params[:cpf].gsub(/[^0-9]/, '')
      end
      @socioeduk_jovem.usuario_update_id = current_usuario.id
      @socioeduk_jovem.save
      # Socioeduk::JovemRecepcao.ativar_recepcao_atual(socioeduk_jovem_params[:jovem_recepcoes_attributes])
      incluir_nova_vaga_unidade_recepcao(socioeduk_jovem_params[:jovem_recepcoes_attributes])
      redirect_to edit_socioeduk_jovem_path(@socioeduk_jovem.id, notice: 'update'), notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem.destroy
        @socioeduk_jovem.socioeduk_processos.update_all(deleted_at: @socioeduk_jovem.deleted_at)
        format.html { redirect_to socioeduk_jovens_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        if @socioeduk_jovem.errors.present?
          flash[:error] = @socioeduk_jovem.errors.full_messages[0]
        end
        format.html { redirect_to :back }
      end
    end
  end

  def detalhe_recepcao
    @id_jovem_recepcao = params[:id_jovem_recepcao]
    jovem_recepcao = Socioeduk::JovemRecepcao.find(@id_jovem_recepcao)
    @jovem = Socioeduk::Jovem.find(jovem_recepcao.socioeduk_jovem_id)
    @processo = Socioeduk::Processo.buscar_processo_por_recepcao(@id_jovem_recepcao)[0]
    @numero_processos = Socioeduk::NumeroProcesso.where(socioeduk_processo_id: @processo.id)
    @processo_naturezas = Socioeduk::ProcessoNatureza.where(processo_id: @processo.id)
    @medida_socioeducativas = Socioeduk::MedidaSocioeducativa.where(socioeduk_processo_id: @processo.id).order(:id)
    @audiencias = Socioeduk::Audiencia.where(socioeduk_processo_id: @processo.id)
    @gestao_vagas = Socioeduk::GestaoVaga.listar_historico_transferencia(@id_jovem_recepcao)
    @observacoes = Socioeduk::ProcessoObservacao.where(socioeduk_processo_id: @processo.id)
  end

  def cidades_por_estado
    @cidades = Cidade.where(estado_id: params[:socioeduk_jovem][:uf_naturalidade_id]).order('nome asc')
  end

  def bairros_por_cidade
    @bairros = Bairro.where(cidade_id: params[:cidade_id]).order(nome: :asc)
    @elemento_id = 'socioeduk_jovem_endereco_jovens_attributes_' + params[:number_element_id] + '_bairro_id'
  end

  def editar_historico_transferencia
    @id = params[:id]
    @recepcao_id = params[:recepcao_id]
    @socioeduk_gestao_vaga = Socioeduk::GestaoVaga.find(@id)
  end

  def transferir_jovem
    unless params[:id_unidade_origem].nil?
      @id_unidade_origem = params[:id_unidade_origem]
    end
    unless params[:id_jovem_recepcao].nil?
      @id_jovem_recepcao = params[:id_jovem_recepcao]
    end

    @gestao_vaga = Socioeduk::GestaoVaga.new
    @gestao_vaga.de_unidade_socioeducativa_id = @id_unidade_origem
    @gestao_vaga.socioeduk_jovem_recepcao_id = @id_jovem_recepcao
  end

  def deletar_transferir_jovem
    id = params[:id]
    # INATIVAR A ULTIMA GESTÃO VAGA ATIVA
    gestaoVaga = Socioeduk::GestaoVaga.find(id)
    gestaoVaga.ativo = false
    gestaoVaga.save
    # DELETAR A ULTIMA GESTAO VAGA
    jovem_recepcao_id = gestaoVaga.socioeduk_jovem_recepcao_id
    gestaoVaga.destroy
    # BUSCAR A ULTIMA APÓS A DELEÇÃO E ALTERAR O STATUS PARA TRUE. DESSA FORMA APÓS DELATAR REATIVA A MAIS PROXIMA MANTENDO SEMPRE UM STATUS ATIVO
    ultimoGestaoVaga = Socioeduk::GestaoVaga.where(socioeduk_jovem_recepcao_id: jovem_recepcao_id).order(:created_at).last
    ultimoGestaoVaga.ativo = true
    ultimoGestaoVaga.save
    # REDIRECIONA A PAGINA
    redirect_to detalhe_recepcao_socioeduk_jovens_url(id_jovem_recepcao: jovem_recepcao_id), notice: t('messages.atualizado_sucesso')
  end

  def salvar_transferencia
    unidade_origem_id = socioeduk_gestao_vaga_params['de_unidade_socioeducativa_id']
    unidade_destino_id = socioeduk_gestao_vaga_params['para_unidade_socioeducativa_id']
    id_jovem_recepcao = socioeduk_gestao_vaga_params['socioeduk_jovem_recepcao_id']
    text_status = socioeduk_gestao_vaga_params['status']

    # Lista a ultima distribuição de vaga valida de um jovem
    verificar_gestao_vagas = Socioeduk::GestaoVaga.where(socioeduk_jovem_recepcao_id: id_jovem_recepcao, ativo: true)

    # Invalida as ultimas distribuições de vaga
    verificar_gestao_vagas.each do |verificar_gestao_vaga|
      verificar_gestao_vaga.update(ativo: false)
    end

    salvar_gestao_vaga
  end

  def buscar_jovem_por_nome
    @socioeduk_jovem = Socioeduk::Jovem.where(nome: params[:nome]).limit(1)[0]
    render json: @socioeduk_jovem
  end

  def dashboards
    @grafico = {}

    # JOVEM RECEPCIONADO POREM NÃO ADMITIDO EM NUNHUMA UNIDADE
    @jovem_admitido_mas_sem_processo = Socioeduk::Jovem.jovens_recepcao_admitidos_sem_processo_e_nao_finalizado
    @qtd_jovem_admitido_mas_sem_processo = @jovem_admitido_mas_sem_processo.length
    @grafico.store('Jovem recepcionado não finalizado', @qtd_jovem_admitido_mas_sem_processo)

    # JOVEM SEM INFORMAÇÃO DE ENDEREÇO
    @jovem_sem_endereco = Socioeduk::Jovem.select('socioeduk_jovens.id jovem_id, nome')
                                          .joins('left join socioeduk_endereco_jovens as ej on ej.socioeduk_jovem_id = socioeduk_jovens.id')
                                          .where('socioeduk_jovens.deleted_at is null')
                                          .group('nome, socioeduk_jovens.id')
                                          .having('count(ej.id) = 0')
                                          .order('socioeduk_jovens.nome').to_a

    @qtd_jovem_sem_endereco = @jovem_sem_endereco.length
    @grafico.store('Cadastro de Jovem sem Informação de Endereço', @qtd_jovem_sem_endereco)

    # JOVEM COM ENDEREÇO, MAS BAIRRO NULO
    @jovem_bairro_nulo = Socioeduk::Jovem.select('socioeduk_jovens.id jovem_id, nome')
                                         .joins('inner join socioeduk_endereco_jovens as ej on ej.socioeduk_jovem_id = socioeduk_jovens.id')
                                         .where('ej.bairro_id is null AND socioeduk_jovens.deleted_at is null')
                                         .order('socioeduk_jovens.nome').to_a

    @qtd_jovem_bairro_nulo = @jovem_bairro_nulo.length
    @grafico.store('Cadastro de Jovem com Erro na Informação Referente ao Bairro', @qtd_jovem_sem_endereco)

    # JOVEM COM IDADE ERRADA
    @jovem_idade_errada = Socioeduk::Jovem.select('socioeduk_jovens.id jovem_id, socioeduk_jovens.nome, extract(year from age(socioeduk_jovens.data_nascimento)) idade')
                                          .joins('inner join socioeduk_jovem_recepcoes as jr on jr.socioeduk_jovem_id = socioeduk_jovens.id
            inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id
            inner join socioeduk_processos as p on p.socioeduk_jovem_recepcao_id = jr.id')
                                          .where('jr.status = true and gv.ativo = true and socioeduk_jovens.deleted_at is null and jr.deleted_at is null and p.deleted_at is null and extract(year from age(socioeduk_jovens.data_nascimento)) > 21 or extract(year from age(socioeduk_jovens.data_nascimento)) < 12')
                                          .group('socioeduk_jovens.id, socioeduk_jovens.nome')
                                          .order('socioeduk_jovens.nome').to_a

    @qtd_jovem_idade_errada = @jovem_idade_errada.length
    @grafico.store('Jovem com idade errada', @qtd_jovem_idade_errada)

    @aguardando_crv = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '1' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null
    order by datahora_apresentacao asc ")
    @qtd_jovem_aguardando_crv = @aguardando_crv.length
    @grafico.store('Jovens Recepcionados Aguardando CRV', @aguardando_crv)

    @aguardando_comarca = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '15' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null 
    order by datahora_apresentacao asc")
    @qtd_jovem_aguardando_comarca = @aguardando_comarca.length
    @grafico.store('Jovens Recepcionados Aguardando Comarca', @aguardando_comarca)

    @indisponibilidade_vagas = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '11' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null
    order by datahora_apresentacao asc")
    @qtd_indisponibilidade_vagas = @indisponibilidade_vagas.length
    @grafico.store('Jovens com Indisponibilidade de Vaga', @indisponibilidade_vagas)

    @aguardando_familia = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '2' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null 
    order by datahora_apresentacao asc")
    @qtd_jovem_aguardando_familia = @aguardando_familia.length
    @grafico.store('Jovens Aguardadando Família', @aguardando_familia)

    @projetoJusticaJa = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '4' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null 
    order by datahora_apresentacao asc")
    @qtd_jovem_projeto_justica_ja = @projetoJusticaJa.length
    @grafico.store('Jovens Projeto Justiça Já', @projetoJusticaJa)

    #----
    @total_alertas = @qtd_jovem_admitido_mas_sem_processo + @qtd_jovem_sem_endereco + @qtd_jovem_bairro_nulo + @qtd_jovem_idade_errada + @qtd_jovem_aguardando_crv + @qtd_jovem_aguardando_comarca + @qtd_indisponibilidade_vagas + @qtd_jovem_aguardando_familia + @qtd_jovem_projeto_justica_ja
  end

  private

  # Inclue nova vaga na URLBM unidade de recepção
  def incluir_nova_vaga_unidade_recepcao(recepcoes)
    unless recepcoes.nil?
      lista = []
      recepcoes.each { |_k, v| lista.push(v[:id]) }
      unless lista.find_index('').nil?
        jovem_recepcao_id = @socioeduk_jovem.jovem_recepcoes.last.id
        Socioeduk::GestaoVaga.incluir_gestao_vaga_recepcionado(current_usuario.id, jovem_recepcao_id)
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_jovem
    @socioeduk_jovem = Socioeduk::Jovem.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_jovem_params
    params.require(:socioeduk_jovem).permit(:nome, :apelido, :falecido, :data_nascimento, :sexo, :opcao_sexual_id, :nome_mae, :nome_pai, :peso, :altura, :dependente_quimico, :nacionalidade, :naturalidade, :etnia, :estado_civil_id, :orfao, :responsavel, :mora_com, :numero_filhos, :responsavel_filhos, :tempo_gestacao, :amamentando, :foto, :socioeduk_situacao_adolecente_id, :uf_naturalidade_id, :cidade_naturalidade_id, :idade_estimada, :outras_info_fisica, :cpf, :rg, :data_providencia_documento, :providenciando_documentos, :orgao_expedidor, :socioeduk_situacao_adolescente_id, :socioeduk_cor_olhos_id, :socioeduk_raca_cor_id, :socioeduk_tipo_cabelo_id,
                                            outros_nomes_attributes: %i[jovem_id descricao id _destroy],
                                            jovem_caracteristicas_attributes: %i[socioeduk_tipo_sinal_id local_sinal descricao id _destroy],
                                            endereco_jovens_attributes: %i[socioeduk_jovem_id cidade_id rua numero complemento bairro bairro_id socioeduk_tipo_enderecos_id cep id _destroy],
                                            jovem_contatos_attributes: %i[socioeduk_jovem_id socioeduk_tipo_contato_id numero socioeduk_tipo_parentescos_id id _destroy],
                                            jovem_recepcoes_attributes: %i[socioeduk_jovem_id usuario_id usuario_update_id antecedentes bo socioeduk_doc_recepcoes_id responsavel nome_responsavel telefone presenca_familiar_junto condutor_nome condutor_documento condutor_cargo datahora_apresentacao oficio documentos_pessoais decisao corpo_delito certidao_antecedente_criminal kit_vestuario agredido dias_para_efetuar_cadastro id socioeduk_jovem_recepcoes_id],
                                            jovem_documentos_attributes: %i[socioeduk_jovem_id socioeduk_tipo_documento_id numero data_emissao id _destroy])
  end
end
