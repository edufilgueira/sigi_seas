class Socioeduk::GestaoVagasController < SocioedukApplicationController
  require 'util'

  def index
    @unidades_socioeducativas = UnidadeSocioeducativa.all
  end

  def listar_jovens
    if(!params[:id_unidade].nil?)
      @id_unidade = params[:id_unidade]
    end

    @UnidadeSocioeducativa = UnidadeSocioeducativa.find(@id_unidade)

    @jovens = Socioeduk::Jovem.listar_jovens_por_unidade(@id_unidade);
  end

  def transferir
    if(!params[:id_unidade].nil?)
      @id_unidade_origem = params[:id_unidade]
    end
    if(!params[:id_jovem_recepcao].nil?)
      @id_jovem_recepcao = params[:id_jovem_recepcao]
    end

    @gestao_vaga = Socioeduk::GestaoVaga.new
    @gestao_vaga.de_unidade_socioeducativa_id = @id_unidade_origem
    @gestao_vaga.socioeduk_jovem_recepcao_id = @id_jovem_recepcao
  end

  def admitir
    if(!params[:id_unidade].nil?)
      @id_unidade = params[:id_unidade]
    end

    if(!params[:id_jovem].nil?)
      @id_jovem = params[:id_jovem]
    end

    if(!params[:text_status].nil?)
      @status = params[:text_status]
    end

    @gestao_vaga = Socioeduk::GestaoVaga.new
    @gestao_vaga.socioeduk_jovem_recepcao_id = @id_jovem
    @gestao_vaga.para_unidade_socioeducativa_id = @id_unidade
    @gestao_vaga.status = @status
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
    self.salvar_gestao_vaga
  end

  def salvar_emissao
    id_unidade_destino = socioeduk_gestao_vaga_params['para_unidade_socioeducativa_id']
    id_jovem_recepcao = socioeduk_gestao_vaga_params['socioeduk_jovem_recepcao_id']
    # Lista a ultima Recepção de vaga valida de um jovem
    verificar_gestao_vaga = Socioeduk::GestaoVaga.where(status: 'Recepcionado', socioeduk_jovem_recepcao_id: id_jovem_recepcao, ativo: true).order('created_at DESC').limit(1)[0]
    id_unidade_origem = verificar_gestao_vaga.para_unidade_socioeducativa_id
        # processo = Socioeduk::Processo.where(socioeduk_jovem_recepcao_id: id_jovem_recepcao)[0]
        # Socioeduk::ConfiguracaoEmail.enviar_email_ao_admintir(id_unidade_origem, id_unidade_destino, processo)
    # Invalida a ultima Recepção de vaga
    if(!verificar_gestao_vaga.blank?)
      @old_gestao_vaga = Socioeduk::GestaoVaga.find(verificar_gestao_vaga.id)
      
      #Verifica se o jovem ja esta na unidade selecionada. Se estiver exibe mensagem informando que nao é possível movimentar na mesma unidade
      if(id_unidade_destino.to_i != @old_gestao_vaga.para_unidade_socioeducativa_id.to_i || text_status != @old_gestao_vaga.status)
        @old_gestao_vaga.update(ativo: false)
        self.salvar_gestao_vaga
        processo = Socioeduk::Processo.where(socioeduk_jovem_recepcao_id: id_jovem_recepcao)[0]
        Socioeduk::ConfiguracaoEmail.enviar_email_ao_admintir(id_unidade_origem, id_unidade_destino, processo)
      else
        @gestao_vaga = Socioeduk::GestaoVaga.find(verificar_gestao_vaga[0].id)
        respond_to do |format|
          flash[:notice] = "Jovem já está #{text_status.downcase} nesta unidade." 
          format.html { redirect_to action: :admitir, id_unidade: id_unidade_destino, id_jovem: id_jovem, text_status: text_status }
        end
      end
    else
      self.salvar_gestao_vaga
    end
    
  end

  def update
    #raise socioeduk_gestao_vaga_params.inspect
    @gestao_vaga = Socioeduk::GestaoVaga.find(socioeduk_gestao_vaga_params[:id])
    @gestao_vaga.de_unidade_socioeducativa_id = socioeduk_gestao_vaga_params[:de_unidade_socioeducativa_id]
    @gestao_vaga.para_unidade_socioeducativa_id = socioeduk_gestao_vaga_params[:para_unidade_socioeducativa_id]
    @gestao_vaga.data_movimentacao = socioeduk_gestao_vaga_params[:data_movimentacao]
    @gestao_vaga.motivo_transferencia = socioeduk_gestao_vaga_params[:motivo_transferencia]

    if @gestao_vaga.save
      redirect_to detalhe_recepcao_socioeduk_jovens_url(id_jovem_recepcao: socioeduk_gestao_vaga_params[:recepcao_id]), notice: t('messages.atualizado_sucesso')
    end

  end

  def ativos_recepcao
    @socioeduk_jovem_recepcoes = Socioeduk::GestaoVaga.ativos_recepcao
  end

  def buscar_jovem_recepcionado
    if !params[:frm].blank?
      @nome = params[:frm][:nome]
      @status = params[:frm][:status]

      where_nome = ''
      if (!@nome.blank?)
        where_nome = " AND socioeduk_jovens.nome ilike '%" + @nome + "%'"
      end

      where_status = ''
      if (!@status.blank?)
        where_status = " AND socioeduk_jovem_recepcoes.status = "+@status
      end

      @socioeduk_jovem_recepcoes = Socioeduk::JovemRecepcao
      .select('socioeduk_jovens.id id_jovem', 'socioeduk_jovens.nome nome_jovem', 'socioeduk_jovens.nome_mae nome_mae', 'socioeduk_jovem_recepcoes.datahora_apresentacao', 'socioeduk_jovem_recepcoes.status','tms.descricao')
      .joins(:socioeduk_jovem)
      .joins('left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = socioeduk_jovem_recepcoes.socioeduk_tipo_medida_socioeducativa_id')
      .where("socioeduk_jovem_recepcoes.id not in
              (
              select socioeduk_jovem_recepcao_id from socioeduk_processos where socioeduk_jovem_recepcao_id = socioeduk_jovem_recepcoes.id
              ) 
              and socioeduk_jovens.deleted_at is null " + where_nome + where_status)
      .order('nome_jovem')
    end

    render :ativos_recepcao
  end

  def salvar_gestao_vaga
    @gestao_vaga = Socioeduk::GestaoVaga.new(socioeduk_gestao_vaga_params)
    @gestao_vaga.usuario_id = current_usuario[:id]

    respond_to do |format|
      if @gestao_vaga.save
        # if @gestao_vaga.status == 'Admitido'
        #   Socioeduk::ConfiguracaoEmail.enviar_email_ao_admintir(socioeduk_gestao_vaga_params[:para_unidade_socioeducativa_id])
        # end
        format.html { redirect_to visualizar_vagas_socioeduk_gestao_vagas_path, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @gestao_vaga }
      else
        format.html { render :new }
        format.json { render json: @gestao_vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  def cadastrar_blocos
    @unidade_socioeducativa = UnidadeSocioeducativa.find(params[:id])
  end

  def flag_hononimo
    respond_to do |format|
      ids = params[:ids]
      ids.each do |id|
        jovem = Socioeduk::Jovem.find(id)
        jovem.flag_hononimo = true
        jovem.save
      end
      format.html { redirect_to :controller => 'gestao_vagas', :action => 'dashboards' }
    end
  end

  def dashboards

    @grafico = {}

    # PROCESSOS COM NUMERO INCOMPLETO
    @n_processo_incompleto = Socioeduk::NumeroProcesso.select('j.nome, socioeduk_numero_processos.numero, p.id')
    .joins('inner join socioeduk_processos as p on p.id = socioeduk_numero_processos.socioeduk_processo_id
            inner join socioeduk_jovem_recepcoes as jr on jr.id = p.socioeduk_jovem_recepcao_id
            inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id')
    .where('length(numero) < 25 and j.deleted_at is null and p.deleted_at is null')
    .order('length(numero) desc').to_a
    @qtd_n_processo_incompleto = @n_processo_incompleto.length
    @grafico.store('Nº Processo Incompleto', @qtd_n_processo_incompleto)
  
    #JOVEM SEM ATO INFRACIONAL
    @sem_processo_ato_infracional = Socioeduk::Jovem.select('socioeduk_jovens.nome, p.id')
    .joins('inner join socioeduk_jovem_recepcoes as jr on jr.socioeduk_jovem_id = socioeduk_jovens.id
            inner join socioeduk_processos as p on p.socioeduk_jovem_recepcao_id = jr.id
            left join socioeduk_processo_naturezas as pn on pn.processo_id = p.id')
    .where('socioeduk_jovens.deleted_at is null and p.deleted_at is null')
    .group('socioeduk_jovens.nome, p.id')
    .having('count(pn.*) < 1')
    .order('count(pn.*) asc').to_a
    @qtd_sem_processo_ato_infracional = @sem_processo_ato_infracional.length
    @grafico.store('Cadastro de Jovem sem Informação de Ato Infracional', @qtd_sem_processo_ato_infracional)
    
    #JOVEM SEM MADIDA CADASTRADA
    @sem_jovem_sem_medida = Socioeduk::Jovem.select('socioeduk_jovens.nome, p.id')
    .joins('inner join socioeduk_jovem_recepcoes as jr on jr.socioeduk_jovem_id = socioeduk_jovens.id
            inner join socioeduk_processos as p on p.socioeduk_jovem_recepcao_id = jr.id
            left join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = p.id')
    .where('socioeduk_jovens.deleted_at is null and p.deleted_at is null')
    .group('socioeduk_jovens.nome, p.id')
    .having('count(ms.*) < 1')
    .order('count(ms.*) asc').to_a

    @qtd_sem_jovem_sem_medida = @sem_jovem_sem_medida.length
    @grafico.store('Cadastro de Jovem sem Informação de Medida', @qtd_sem_jovem_sem_medida)

    # JOVEM RECEPCIONADO POREM NÃO ADMITIDO EM NUNHUMA UNIDADE
    @jovem_admitido_mas_sem_processo = Socioeduk::Jovem.jovens_recepcao_admitidos_sem_processo
    @qtd_jovem_admitido_mas_sem_processo = @jovem_admitido_mas_sem_processo.length
    @grafico.store('Jovens Recepcionados Aguardando Definição da Central de Vagas', @qtd_jovem_admitido_mas_sem_processo)

    # JOVEM RECEPCIONADO POREM NÃO ADMITIDO EM NUNHUMA UNIDADE COM VAGA NEGADA NO PROCESSO
    @jovem_admitido_mas_sem_processo_vaga_negada = Socioeduk::Jovem.jovens_recepcao_admitidos_sem_processo_vaga_negada
    @qtd_jovem_admitido_mas_sem_processo_vaga_negada = @jovem_admitido_mas_sem_processo_vaga_negada.length
    @grafico.store('Jovem com vaga negada', @jovem_admitido_mas_sem_processo_vaga_negada)


    #JOVEM COM MEDIDAS VENCIDAS
    @n_medidas_socioeducativa_vencida = Socioeduk::Jovem.select('p.id as numero_processo, socioeduk_jovens.nome as nome_jovem, us.nome nome_unidade, ms.fim_previsto')
    .joins('inner join socioeduk_jovem_recepcoes jr on jr.socioeduk_jovem_id = socioeduk_jovens.id
      inner join socioeduk_processos p on jr.id = p.socioeduk_jovem_recepcao_id
      inner join socioeduk_medida_socioeducativas ms on p.id = ms.socioeduk_processo_id
      inner join socioeduk_gestao_vagas gv on gv.socioeduk_jovem_recepcao_id = jr.id
      inner join unidades_socioeducativas us on us.id = gv.para_unidade_socioeducativa_id')
    .where('ms.deleted_at is null and p.deleted_at is null and socioeduk_jovens.deleted_at is null and p.socioeduk_status_processo_id = 1 and (current_date > ms.fim_previsto) 
      and gv.ativo = true and ms.socioeduk_situacao_cumprimento_id not in (3,5,6)')
    .group('p.id, socioeduk_jovens.nome, us.nome, ms.fim_previsto')
    .order('socioeduk_jovens.nome').to_a
    @qtd_n_medidas_socioeducativa_vencida = @n_medidas_socioeducativa_vencida.length
    @grafico.store('Medida vencida', @qtd_n_medidas_socioeducativa_vencida)

    #MEDIDAS CONCLUIDAS E NÃO FINALIZADAS
    @medidas_concluidas_e_nao_finalizadas = Socioeduk::Processo.select('j.nome, socioeduk_processos.id')
    .joins('inner join socioeduk_medida_socioeducativas ms on socioeduk_processos.id = ms.socioeduk_processo_id
      inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
      inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id')
    .where('socioeduk_processos.socioeduk_status_processo_id = 1 AND j.deleted_at is null and socioeduk_processos.deleted_at is null AND ms.socioeduk_situacao_cumprimento_id = (
      select ms2.socioeduk_situacao_cumprimento_id from socioeduk_medida_socioeducativas ms2
      where ms2.socioeduk_processo_id = socioeduk_processos.id
      order by ms2.id desc
      limit 1)')
    .group('socioeduk_processos.id, j.nome')
    .having('(select ms2.socioeduk_situacao_cumprimento_id from socioeduk_medida_socioeducativas ms2
      where ms2.socioeduk_processo_id = socioeduk_processos.id
      order by ms2.id desc
      limit 1)= 3')
    .order('j.nome').to_a
    @qtd_medidas_concluidas_e_nao_finalizadas = @medidas_concluidas_e_nao_finalizadas.length
    @grafico.store('Cadastro de Jovens com Medidas Concluídas e Não Finalizadas', @qtd_medidas_concluidas_e_nao_finalizadas)

    #PROCESSO EVADIDO NÃO FINALIZADO
    @processo_evadido_nao_finalizado = Socioeduk::Processo.select('j.nome, socioeduk_processos.id')
    .joins('inner join socioeduk_medida_socioeducativas ms on socioeduk_processos.id = ms.socioeduk_processo_id
            inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
            inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id')
    .where('socioeduk_processos.socioeduk_status_processo_id = 1 AND j.deleted_at is null AND socioeduk_processos.deleted_at is null AND ms.socioeduk_situacao_cumprimento_id = (
      select ms2.socioeduk_situacao_cumprimento_id from socioeduk_medida_socioeducativas ms2
      where ms2.socioeduk_processo_id = socioeduk_processos.id AND ms2.socioeduk_situacao_cumprimento_id = 5
      order by ms2.id desc
      limit 1
    )')
    .order('j.nome').to_a
    @qtd_processo_evadido_nao_finalizado = @processo_evadido_nao_finalizado.length
    @grafico.store('Cadastro de Jovem Evadido Não Finalizado no Sistema', @qtd_processo_evadido_nao_finalizado)

    #JOVEM SEM MADIDA CADASTRADA
    @jovem_sem_unidade = Socioeduk::Jovem.select('socioeduk_jovens.id, socioeduk_jovens.nome')
    .joins('inner join socioeduk_jovem_recepcoes as jr on jr.socioeduk_jovem_id = socioeduk_jovens.id
            left join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id')
    .where('socioeduk_jovens.deleted_at is null and jr.deleted_at is null')
    .group('socioeduk_jovens.nome, socioeduk_jovens.id')
    .having('count(gv.*) < 1')
    .order('socioeduk_jovens.nome').to_a

    @qtd_jovem_sem_unidade = @jovem_sem_unidade.length
    @grafico.store('Cadastro de Jovem sem Informação de Unidade', @qtd_jovem_sem_unidade)

    #JOVEM COM NOMES HOMÔNIMOS (IGUAIS)
    @jovem_homonimo = Socioeduk::Jovem.select('count(id) qtd, nome, (SELECT array_agg(id) from socioeduk_jovens j2 where j2.nome = socioeduk_jovens.nome) ids')
    .where('socioeduk_jovens.deleted_at is null AND flag_hononimo is not true')
    .group('nome')
    .having('count(id) > 1')
    .order('nome').to_a

    @qtd_jovem_homonimo = @jovem_homonimo.length
    @grafico.store('Cadastro de Jovens com Nomes Homônimos', @qtd_jovem_homonimo)

    #PROCESSOS COM MAIS DE UMA MEDIDA NÃO CONCLUÍDA
    @processos_mais_medidas_ativas = Socioeduk::Processo.select('count(socioeduk_processos.id) qtd, socioeduk_processos.id processo_id, j.nome')
    .joins('inner join socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = socioeduk_processos.id
            inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
            inner join socioeduk_gestao_vagas gv ON gv.socioeduk_jovem_recepcao_id = jr.id
            inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id')
    .where('ms.socioeduk_situacao_cumprimento_id != 3 and gv.ativo = true and jr.status = true and j.deleted_at is null and jr.deleted_at is null and socioeduk_processos.deleted_at is null and ms.deleted_at is null')
    .group('socioeduk_processos.id, j.nome ')
    .having('count(socioeduk_processos.id) > 1')
    .order('j.nome ').to_a

    @qtd_processos_mais_medidas_ativas = @processos_mais_medidas_ativas.length
    @grafico.store('Cadastro de Jovem com Mais de uma Medida não Concluída no Processo', @qtd_processos_mais_medidas_ativas)

    #PROCESSO SEM CORRELAÇÃO DE ATO INFRACIONAL
    @processos_sem_correlacao_ato_infracional =  Socioeduk::Processo.select('socioeduk_processos.id')
    .joins('inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id 
            inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id 
            left join socioeduk_numero_processos np ON np.socioeduk_processo_id = socioeduk_processos.id 
            left join socioeduk_processo_naturezas pn ON pn.socioeduk_numero_processo_id = np.id ')
    .where('socioeduk_processos.deleted_at is null and jr.deleted_at is null and j.deleted_at is null ')
    .group('socioeduk_processos.id')
    .having('count(pn.id) = 0')

    @qtd_processos_sem_correlacao_ato_infracional = @processos_sem_correlacao_ato_infracional.length
    @grafico.store('Processos Sem Correlação de Ato Infracional', @qtd_processos_mais_medidas_ativas)

    #JOVENS ATIVOS COM MAIS DE UM CADASTRO DE PROCESSO
    @jovens_ativos_com_mais_de_um_processo =  Socioeduk::Processo.select('socioeduk_processos.id, j.nome, count(np.id) qtd, socioeduk_processos.created_at')
    .joins('inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id 
      inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id 
      left join socioeduk_numero_processos np ON np.socioeduk_processo_id = socioeduk_processos.id')
    .where('socioeduk_processos.deleted_at is null and jr.deleted_at is null and j.deleted_at is null and socioeduk_status_processo_id = 1')
    .group('socioeduk_processos.id, j.nome')
    .having('count(np.id) > 1')
    .order('socioeduk_processos.created_at desc')

    @qtd_jovens_ativos_com_mais_de_um_processo = @jovens_ativos_com_mais_de_um_processo.length
    @grafico.store('Jovens ativos com  mais de um processo', @qtd_processos_mais_medidas_ativas)

    @total_alertas = @qtd_n_processo_incompleto + @qtd_sem_processo_ato_infracional + @qtd_sem_jovem_sem_medida + @qtd_jovem_admitido_mas_sem_processo + @qtd_n_medidas_socioeducativa_vencida + @qtd_medidas_concluidas_e_nao_finalizadas + @qtd_processo_evadido_nao_finalizado + @qtd_jovem_sem_unidade + @qtd_jovem_homonimo + @qtd_processos_mais_medidas_ativas

  end

  def indicadores
    #QUANTITATIVO E PERCENTUAL DE JOVENS TRANS
    @jovens_trans = Socioeduk::Jovem.select('count(id) qtd, (select count(id) from socioeduk_jovens j where j.deleted_at is null) total')
                                    .where('socioeduk_jovens.opcao_sexual_id != 2').to_a
    @jovens_trans = @jovens_trans.last
    @jovens_trans_percentual = ((@jovens_trans.qtd.to_f/@jovens_trans.total.to_f)*100).round(2)
    # select count(j.id) id, (select count(id) from socioeduk_jovens where deleted_at is null) total
    # from socioeduk_jovens j
    # INNER JOIN socioeduk_opcao_sexuais os ON os.id = j.opcao_sexual_id
    # where j.opcao_sexual_id != 2
    #----------------------------------------------------------------------------------
  end

  def cadastrar_dormitorios
    @id_bloco = params[:id_bloco]
    @unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.find(@id_bloco)
    @unidade_socioeducativa = @unidade_socioeducativa_bloco.unidade_socioeducativa
    if params[:button] == "new"
      @unidade_bloco_dormitorio = UnidadeBlocoDormitorio.new
    else
      @unidade_bloco_dormitorio = UnidadeBlocoDormitorio.find(params[:id])
    end
  end

  def gerir_vagas
    @unidades_socioeducativas = UnidadeSocioeducativa.all
  end

  def visualizar_vagas
    @unidades_socioeducativas = UnidadeSocioeducativa.centros_socioeducativos_urlbm
  end

  def visualizar_pontuacao
    @capacidade_real = UnidadeBlocoDormitorio.where(status: :true).sum('capacidade_base')
    lista = []
    @processos = Socioeduk::Processo.joins(socioeduk_jovem_recepcao: :socioeduk_jovem).where('socioeduk_jovens.deleted_at is null')
    @processos.each do |processo|
      hash = {}
      hash[:nome] = processo.socioeduk_jovem_recepcao.socioeduk_jovem&.nome
      hash[:nome_mae] = processo.socioeduk_jovem_recepcao.socioeduk_jovem&.nome_mae
      hash[:data_hora_apreensao] = processo&.data_hora_apreensao
      hash[:pontuacao] = processo&.pontuacao
      hash[:medida_socioeducativa] = processo.ultima_medida_socioeducativa_ativa
      lista.push(hash)
    end
    @socioeduk_processos = lista.sort_by{|e| -e[:pontuacao]}
  end

  def fila_vagas
    lista = []
    @capacidade_base = UnidadeSocioeducativa.resumo_capacidades(params).sum(&:capacidade_base).to_i
    @capacidade_base_19 = UnidadeSocioeducativa.resumo_capacidades(params).sum(&:capacidade_19_percent).to_i
    capacidades_unidades = UnidadeSocioeducativa.resumo_capacidades_unidades

    @tipo_lista = params['tipo_lista'].nil?? 'lista_cumprindo_medida' : params['tipo_lista']

    @lista_regioes = UnidadeSocioeducativa.joins(:cidade).select('cidades.id', 'cidades.nome').order('cidades.nome ASC').uniq.sort_by{|e| -e[:nome]}
    @lista_medidas = Socioeduk::TipoMedidaSocioeducativa.select(:id, :descricao).where(tipo_medida: "FECHADO").order(:descricao)
    if params[:commit]
      @regioes = Array.new
      @generos = Array.new
      @medidas = Array.new
      @unidade = 0
      @idade = 0
      @tipo_lista = 'lista_cumprindo_medida'

      
      if params['tipo_lista'] == 'lista_cumprindo_medida'
        @tipo_lista = 'lista_cumprindo_medida'
        # Buscar jovens cumprindo medida
        query = ""
        if !params[:idade].blank? 
          @idade = params[:idade]
          query << " AND extract(year from age(j.data_nascimento)) = #{@idade}"
        end

        if params[:regiao]
          params[:regiao].each do |key, value|
            @regioes.push(value)
          end
          query << " and c.id IN (#{@regioes.join(', ')})"
        end
        if params[:sexo]
          params[:sexo].each do |key, value|
            @generos.push("'#{value}'")
          end
          query << " and j.sexo IN (#{@generos.join(', ')})"
        end
        if params[:medida]
          params[:medida].each do |key, value|
            @medidas.push(value)
          end
          query << " and tms.id IN (#{@medidas.join(', ')})"
        end
        if !params[:unidade_socioeducativa_id].blank? 
          @unidade = params[:unidade_socioeducativa_id]
          query << " and us.id = #{params[:unidade_socioeducativa_id]}"
        end

        busca_processos = Socioeduk::Processo.relatorio_vagas(query)
        busca_processos.each do |processo|
          hash = {}
          hash[:id] = processo.processo_id
          hash[:nome] = processo&.nome_jovem
          hash[:nome_mae] = processo&.nome_mae
          hash[:data_hora_apreensao] = processo&.data_hora_apreensao
          hash[:pontuacao] = Socioeduk::Processo.find(processo.processo_id).pontuacao
          hash[:medida_socioeducativa] = processo&.ultima_medida_socioeducativa
          hash[:sigla] = processo&.sigla_unidade
          hash[:unidade] = processo&.nome_unidade
          hash[:situacao] = processo&.status_processo
          hash[:idade] = processo&.idade
          lista.push(hash)
        end

        @processos = lista.sort_by{|e| -e[:pontuacao]}

        directory = "#{Rails.root}/docs/relatorios_csv/"
        Dir.mkdir(directory) unless File.exists?(directory)
        @file_name = ("file_" + Time.now.strftime('%Y%m%d%H%M%S%L') + ".csv")
        @file_path = (directory + @file_name)
        headers = ['Jovem', 'Data Apreensão', 'Medida Socioeducativa', 'Unidade', 'Situação', 'Pontuação']
        lines = @processos.pluck(:nome, :data_hora_apreensao, :medida_socioeducativa, :unidade, :situacao, :pontuacao)
        Util.generate_file_csv(@file_path, headers, lines)
      else
        # Buscar solicitações aguardando vagas
        @tipo_lista = 'fila_espera'
        query = "1=1"
        if params[:regiao]
          params[:regiao].each do |key, value|
            @regioes.push(value)
          end
          #query << " and c.id IN (#{@regioes.join(', ')})"
        end
        if params[:sexo]
          params[:sexo].each do |key, value|
            @generos.push("'#{value}'")
          end
          query << " and sexo IN (#{@generos.join(', ')})"
        end
        if params[:medida]
          params[:medida].each do |key, value|
            @medidas.push(value)
          end
          query << " and socioeduk_tipo_medida_socioeducativa_id IN (#{@medidas.join(', ')})"
        end
        busca_solicitacoes = Socioeduk::SolicitacaoVaga.joins(:tipo_medida_socioeducativa).where(query)
        busca_solicitacoes.each do |busca_solicitacao|
          hash = {}
          hash[:id] = busca_solicitacao.id
          hash[:nome] = busca_solicitacao.nome
          hash[:data_apreensao] = busca_solicitacao&.data_apreensao
          hash[:created_at] = busca_solicitacao&.created_at
          hash[:pontuacao] = busca_solicitacao&.pontuacao
          hash[:medida_socioeducativa] = busca_solicitacao.tipo_medida_socioeducativa&.descricao
          lista.push(hash)
        end
        @solicitacoes = lista.sort_by{|e| -e[:pontuacao]}
      end
    end

      respond_to do |format|
        format.html
        format.csv { send_data busca_processos.to_csv, filename:  "processos-#{Date.today}.csv"}
      end
  end
  
  def acompanhar_solicitacao_vagas
    @solicitacoes = Socioeduk::SolicitacaoVaga.all.order(created_at: :desc)
  end

  def visualizar_solicitacao_vagas
    @socioeduk_solicitacao_vaga = Socioeduk::SolicitacaoVaga.find(params[:id])
  end

  def baixar_relatorio_csv
    send_file(params[:file])
  end


  private

  def socioeduk_gestao_vaga_params
    params.require(:socioeduk_gestao_vaga).permit(:id, :recepcao_id, :socioeduk_jovem_recepcao_id, :de_unidade_socioeducativa_id, :para_unidade_socioeducativa_id, :status, :data_movimentacao, :motivo_transferencia)
  end

end
