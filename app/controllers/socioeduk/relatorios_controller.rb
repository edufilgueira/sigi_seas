class Socioeduk::RelatoriosController < SocioedukApplicationController
  before_action :find_venue, only: [:show, :edit, :update, :destroy]
  def index
    
  end
  def show
    
  end

  def total_jovens_provisoria_decurso_ip
    if params[:frm]
      @data_inicial = params[:frm][:data_inicial]
      @data_final = params[:frm][:data_final]
      @total_jovens_provisoria = Socioeduk::Processo
        .joins("INNER JOIN socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id 
                INNER JOIN socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id 
                INNER JOIN socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = socioeduk_processos.id")
        .where("ms.socioeduk_tipo_medida_socioeducativa_id = 2 AND socioeduk_processos.deleted_at is null AND j.deleted_at is null
                AND socioeduk_processos.data_hora_apreensao BETWEEN '"+@data_inicial.to_date.strftime('%Y-%m-%d')+"' AND '"+@data_final.to_date.strftime('%Y-%m-%d')+"'
                AND ms.data_conclusao BETWEEN '"+@data_inicial.to_date.strftime('%Y-%m-%d')+"' AND '"+@data_final.to_date.strftime('%Y-%m-%d')+"'")
        .count

      @total_jovens_provisoria_decurso_ip = Socioeduk::Processo.select("socioeduk_processos.id id_processo, j.id id_jovem, j.nome")
          .joins("INNER JOIN socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id 
                  INNER JOIN socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id 
                  INNER JOIN socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = socioeduk_processos.id")
          .where("ms.socioeduk_tipo_medida_socioeducativa_id = 2 AND ms.socioeduk_medida_socioeducativa_motivo_conclusao_id = 53 AND socioeduk_processos.deleted_at is null AND j.deleted_at is null
                  AND socioeduk_processos.data_hora_apreensao BETWEEN '"+@data_inicial.to_date.strftime('%Y-%m-%d')+"' AND '"+@data_final.to_date.strftime('%Y-%m-%d')+"'
                  AND ms.data_conclusao BETWEEN '"+@data_inicial.to_date.strftime('%Y-%m-%d')+"' AND '"+@data_final.to_date.strftime('%Y-%m-%d')+"'")
      @percentual = ((@total_jovens_provisoria_decurso_ip.length.to_f/@total_jovens_provisoria)*100).round(2)
    end
  end

  def quantidade_por_tipo_conclusao_medidas
    if params[:frm]
      @data_inicial = params[:frm][:data_inicial]
      @data_final = params[:frm][:data_final]
      @tipo_medida = params[:frm][:tipo_medida]
      
      if(@tipo_medida == 'TODOS')
        @quantidade_por_tipo_conclusao_medidas = Socioeduk::TipoConclusaoMedidaSocioeducativa.select("id, descricao, 
          (select count(*) from socioeduk_processos p
          INNER JOIN socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = p.id
          INNER JOIN socioeduk_medida_socioeducativa_motivo_conclusoes msmc ON msmc.id = ms.socioeduk_medida_socioeducativa_motivo_conclusao_id
          WHERE p.deleted_at is null and ms.data_conclusao BETWEEN '"+@data_inicial.to_date.strftime('%Y-%m-%d')+"' AND '"+@data_final.to_date.strftime('%Y-%m-%d')+"'
          and msmc.socioeduk_tipo_conclusao_medida_socioeducativa_id = socioeduk_tipo_conclusao_medida_socioeducativas.id) as quantidade")
          .order('descricao')
      else
        @quantidade_por_tipo_conclusao_medidas = Socioeduk::TipoConclusaoMedidaSocioeducativa.select("socioeduk_tipo_conclusao_medida_socioeducativas.id, descricao, 
          (select count(*) from socioeduk_processos p
          INNER JOIN socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = p.id
          INNER JOIN socioeduk_medida_socioeducativa_motivo_conclusoes msmc ON msmc.id = ms.socioeduk_medida_socioeducativa_motivo_conclusao_id
          WHERE p.deleted_at is null and ms.data_conclusao BETWEEN '"+@data_inicial.to_date.strftime('%Y-%m-%d')+"' AND '"+@data_final.to_date.strftime('%Y-%m-%d')+"'
          and msmc.socioeduk_tipo_conclusao_medida_socioeducativa_id = socioeduk_tipo_conclusao_medida_socioeducativas.id
          and msmc.socioeduk_tipo_medida_socioeducativa_id = #{@tipo_medida}) as quantidade")
          .joins('inner join socioeduk_medida_socioeducativa_motivo_conclusoes msmc ON msmc.socioeduk_tipo_conclusao_medida_socioeducativa_id = socioeduk_tipo_conclusao_medida_socioeducativas.id')
          .where("msmc.socioeduk_tipo_medida_socioeducativa_id = #{@tipo_medida}")
          .order('descricao')
      end
    end
  end

  def quantidade_por_tipo_conclusao_medida_detalhes
    @data_inicial = params[:data_inicial]
    @data_final = params[:data_final]
    if(!params[:id].nil?)
      @id = params[:id]
      @ids = Socioeduk::MedidaSocioeducativaMotivoConclusao.select(:id).where(socioeduk_tipo_conclusao_medida_socioeducativa_id: @id)
      @ids = @ids.map{|c| c["id"]}.join(",")
      #raise @ids.inspect
      @jovens = Socioeduk::Jovem.select("p.id processo_id, socioeduk_jovens.id jovem_id, socioeduk_jovens.nome, socioeduk_jovens.nome_mae, ms.id,
      (
        select concat(uso.sigla, ' - ', uso.nome) as nome from socioeduk_gestao_vagas sgv
        left join unidades_socioeducativas uso ON uso.id = sgv.para_unidade_socioeducativa_id
        where sgv.socioeduk_jovem_recepcao_id = jr.id
        order by sgv.id desc limit 1
      ) unidade_destino,
      (
        select concat(uso.sigla, ' - ', uso.nome) as nome1 from socioeduk_gestao_vagas sgv
        left join unidades_socioeducativas uso ON uso.id = sgv.de_unidade_socioeducativa_id
        where sgv.socioeduk_jovem_recepcao_id = jr.id
        order by sgv.id desc limit 1
      ) unidade_origem")
                .joins('INNER JOIN socioeduk_jovem_recepcoes jr ON jr.socioeduk_jovem_id = socioeduk_jovens.id
                        INNER JOIN socioeduk_processos p ON p.socioeduk_jovem_recepcao_id = jr.id
                        LEFT JOIN socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = p.id
                        LEFT JOIN socioeduk_medida_socioeducativa_motivo_conclusoes msmc ON msmc.id = ms.socioeduk_medida_socioeducativa_motivo_conclusao_id')
                .where("socioeduk_jovens.deleted_at is null AND jr.deleted_at is null and jr.deleted_at is null and ms.socioeduk_medida_socioeducativa_motivo_conclusao_id in ("+@ids+") and ms.data_conclusao BETWEEN '"+(@data_inicial.to_date.strftime('%Y-%m-%d'))+"' and '"+(@data_final.to_date.strftime('%Y-%m-%d'))+"'")
                .group('p.id, socioeduk_jovens.id, socioeduk_jovens.nome, socioeduk_jovens.nome_mae, ms.id, unidade_destino, unidade_origem')
    end
  end

  def ocupacao_quantitativos
    # BLOCO DE CODIGO SINTETICO QUE CONSTROI A LINHA (DADOS) DA URLBM
    @unidade_recepcao = []
    hash = {}
    jovens_recepcao = Socioeduk::GestaoVaga.ativos_recepcao
    unidade_socioeducativa = UnidadeSocioeducativa.find_by(recepcao: true)
    capacidade = unidade_socioeducativa.capacidade_total
    ocupacao = jovens_recepcao.length
    masculino = 0
    feminino = 0
    jovens_recepcao.group_by(&:sexo_jovem).each do |k, v|
      if k == 'M'
        masculino = v.length
      else
        feminino = v.length
      end
    end
    hash["id"] = unidade_socioeducativa.id
    hash["sigla"] = unidade_socioeducativa.sigla
    hash["nome"] = unidade_socioeducativa.nome
    hash["capacidade_total"] = capacidade
    hash["quantidade_jovem_admitido"] = ocupacao
    hash["masculino"] = masculino
    hash["feminino"] = feminino 
    @unidade_recepcao.push(hash)
    # ARRAY PADRÃO QUE LISTA TODAS AS UNIDADES SOCIOEDUCATIVAS DESCONSIDERANDO 'CRV', 'SEAS' E 'URLBM'
    @unidades_socioeducativas = UnidadeSocioeducativa.select("unidades_socioeducativas.*, cidades.capital as capital,
      (
        select count(p.id) from socioeduk_processos p
        inner join socioeduk_status_processos as sp on sp.id = p.socioeduk_status_processo_id
        inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = p.id
        inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
        inner join socioeduk_jovem_recepcoes as jr on jr.id = p.socioeduk_jovem_recepcao_id
        inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
        inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id
        where ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true AND j.sexo = 'M'
        AND j.deleted_at is null and jr.deleted_at is null AND p.deleted_at is null AND ms.deleted_at is null 
        AND para_unidade_socioeducativa_id = unidades_socioeducativas.id
        ) masculino,
        (
        select count(p.id) from socioeduk_processos p
        inner join socioeduk_status_processos as sp on sp.id = p.socioeduk_status_processo_id
        inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = p.id
        inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
        inner join socioeduk_jovem_recepcoes as jr on jr.id = p.socioeduk_jovem_recepcao_id
        inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
        inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id
        where ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true AND j.sexo = 'F'
        AND j.deleted_at is null and jr.deleted_at is null AND p.deleted_at is null AND ms.deleted_at is null 
        AND para_unidade_socioeducativa_id = unidades_socioeducativas.id
        ) as feminino,
        (
        select count(p.id) from socioeduk_processos p
        inner join socioeduk_status_processos as sp on sp.id = p.socioeduk_status_processo_id
        inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = p.id
        inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
        inner join socioeduk_jovem_recepcoes as jr on jr.id = p.socioeduk_jovem_recepcao_id
        inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
        inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id
        where ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true 
        AND j.deleted_at is null and jr.deleted_at is null AND p.deleted_at is null AND ms.deleted_at is null 
        AND ms.socioeduk_tipo_medida_socioeducativa_id = 2 AND para_unidade_socioeducativa_id = unidades_socioeducativas.id
        ) as internacao_provisoria,
        (
        select count(p.id) from socioeduk_processos p
        inner join socioeduk_status_processos as sp on sp.id = p.socioeduk_status_processo_id
        inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = p.id
        inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
        inner join socioeduk_jovem_recepcoes as jr on jr.id = p.socioeduk_jovem_recepcao_id
        inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
        inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id
        where ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true 
        AND j.deleted_at is null and jr.deleted_at is null AND p.deleted_at is null AND ms.deleted_at is null 
        AND ms.socioeduk_tipo_medida_socioeducativa_id = 1 AND para_unidade_socioeducativa_id = unidades_socioeducativas.id
        ) as internacao,
        (
        select count(p.id) from socioeduk_processos p
        inner join socioeduk_status_processos as sp on sp.id = p.socioeduk_status_processo_id
        inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = p.id
        inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
        inner join socioeduk_jovem_recepcoes as jr on jr.id = p.socioeduk_jovem_recepcao_id
        inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
        inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id
        where ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true 
        AND j.deleted_at is null and jr.deleted_at is null AND p.deleted_at is null AND ms.deleted_at is null 
        AND ms.socioeduk_tipo_medida_socioeducativa_id = 3 AND para_unidade_socioeducativa_id = unidades_socioeducativas.id
        ) as sancao,
        (
        select count(p.id) from socioeduk_processos p
        inner join socioeduk_status_processos as sp on sp.id = p.socioeduk_status_processo_id
        inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = p.id
        inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
        inner join socioeduk_jovem_recepcoes as jr on jr.id = p.socioeduk_jovem_recepcao_id
        inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
        inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id
        where ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true 
        AND j.deleted_at is null and jr.deleted_at is null AND p.deleted_at is null AND ms.deleted_at is null 
        AND ms.socioeduk_tipo_medida_socioeducativa_id = 4 AND para_unidade_socioeducativa_id = unidades_socioeducativas.id
        ) as semiliberdade")
    .joins('INNER JOIN cidades ON cidades.id = unidades_socioeducativas.cidade_id')
    .where.not(sigla: ['CRV', 'SEAS','URLBM'])
    @unidades_socioeducativas = @unidades_socioeducativas.sort_by {|e| e[:capital].to_s}
    #raise @unidades_socioeducativas.inspect
  end

  def tempo_cumprimento_por_medidas
    if params[:frm]      
      @data_inicial = params[:frm][:data_inicial]
      @data_final = params[:frm][:data_final]
      @unidade = params[:frm][:unidade]
      @status = params[:frm][:status]
      @regiao = params[:frm][:regiao]
      @situacao_cumprimento = params[:frm][:situacao_cumprimento]
      @tipo_medida = params[:frm][:tipo_medida]

      if(!@data_inicial.blank? && !@data_final.blank?) 
        where_data = ''
        if(!@data_inicial.blank? && !@data_final.blank?)
          where_data = " AND ms.inicio >= '"+@data_inicial.to_date.strftime('%Y-%m-%d')+"'"# AND ms.fim_previsto >='"+@data_final.to_date.strftime('%Y-%m-%d')+"'"
        end
        where_unidade = ''
        if (!@unidade.blank?)
          where_unidade = ' AND gv.para_unidade_socioeducativa_id = '+@unidade
        end
        where_status = ''
        if(!@status.blank?)
          where_status = " AND socioeduk_status_processo_id = "+@status
        end
        where_regiao = ''
        if (!@regiao.blank?)
          where_regiao = ' AND us.cidade_id = '+@regiao
        end
        tipo_medida = ''
        if (!@tipo_medida.blank?)
          tipo_medida = ' AND ms.socioeduk_tipo_medida_socioeducativa_id = '+@tipo_medida
        else
          @tipo_medida = 1
          tipo_medida = ' AND ms.socioeduk_tipo_medida_socioeducativa_id = 1 '
        end
        situacao_cumprimento = ''
        if (!@situacao_cumprimento.blank?)
          situacao_cumprimento = ' AND ms.socioeduk_situacao_cumprimento_id = '+@situacao_cumprimento
        else
          @situacao_cumprimento = 3
          situacao_cumprimento = ' AND ms.socioeduk_situacao_cumprimento_id = 3 '
        end

        @lista = []
        @somar_dias = 0
        processos = Socioeduk::Processo.select('socioeduk_processos.id, j.id id_jovem, j.nome, ms.inicio, ms.fim_previsto, ms.id, sc.descricao situacao_cumprimento')
          .joins('inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
                  inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id
                  inner join socioeduk_gestao_vagas gv ON gv.socioeduk_jovem_recepcao_id = jr.id
                  inner join unidades_socioeducativas us ON us.id = gv.para_unidade_socioeducativa_id
                  inner join cidades c ON c.id = us.cidade_id
                  inner join socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = socioeduk_processos.id
                  inner join socioeduk_situacao_cumprimentos sc ON sc.id = ms.socioeduk_situacao_cumprimento_id')
          .where('socioeduk_processos.deleted_at is null AND j.deleted_at is null AND ms.deleted_at is null ' + where_unidade + where_data + where_status + where_regiao + tipo_medida + situacao_cumprimento)
          .group('socioeduk_processos.id, j.id, j.nome, ms.inicio, ms.id, sc.descricao')
          .order('j.nome')
        processos.each do |processo|
          hash = {}
          hash[:id_processo] = processo.id
          hash[:id_jovem] = processo.id_jovem
          hash[:nome] = processo.nome
          hash[:situacao_cumprimento] = processo.situacao_cumprimento
          
          valor = 0
          if !processo&.inicio.nil?
            hash[:inicial] = processo&.inicio.strftime('%d/%m/%Y')
            valor = (Date.parse(@data_final) - Date.parse(processo&.inicio.strftime('%d/%m/%Y'))).to_f
          end

          if !processo&.fim_previsto.nil?
            hash[:fim_previsto] = processo&.fim_previsto.strftime('%d/%m/%Y')
          end

          hash[:dias] = valor.to_i
          @lista.push(hash)
          @somar_dias += valor
        end
        @lista
        if @somar_dias > 0
          dias_bruto = (@somar_dias / @lista.length).round(0)
        else
          dias_bruto = 0
        end
        @meses = (dias_bruto/30).to_i
        @dias = dias_bruto - (@meses * 30)
        @meses > 1 ? @text_mes = "meses": @text_mes = "mês"
        @dias > 1 ? @text_dia = "dias": @text_dia = "dia"
      elsif
        @erro = true
        @msg = 'Informe a data inicial e final'
        #CODE
      end
    end
  end

  def qtd_infracoes_tentada_consumada
    if params[:frm]      
      @data_inicial = params[:frm][:data_inicial]
      @data_final = params[:frm][:data_final]
      @unidade = params[:frm][:unidade]
      @status = params[:frm][:status]
      @regiao = params[:frm][:regiao]
      @situacao_cumprimento = params[:frm][:situacao_cumprimento]
      @tipo_medida = params[:frm][:tipo_medida]

      if(@data_final.blank?)
        @data_final = Time.now.strftime('%d/%m/%Y')
      end
      where_data = ''
      if(!@data_inicial.blank? && !@data_final.blank?)
        dti = Date.parse @data_inicial
        dtf = Date.parse @data_final
        where_data = " AND ms.inicio BETWEEN '"+dti.strftime('%Y-%m-%d')+"' AND '"+dtf.strftime('%Y-%m-%d')+"'"
      end
      where_status = ''
      if(!@status.blank?)
        where_status = " AND p.socioeduk_status_processo_id = "+@status
      end
      where_unidade = ''
      if (!@unidade.blank?)
        where_unidade = ' AND gv.para_unidade_socioeducativa_id = '+@unidade
      end
      where_regiao = ''
      if (!@regiao.blank?)
        where_regiao = ' AND us.cidade_id = '+@regiao
      end
      tipo_medida = ''
      if (!@tipo_medida.blank?)
        tipo_medida = ' AND ms.socioeduk_tipo_medida_socioeducativa_id = '+@tipo_medida
      end
      situacao_cumprimento = ''
      if (!@situacao_cumprimento.blank?)
        situacao_cumprimento = ' AND ms.socioeduk_situacao_cumprimento_id = '+@situacao_cumprimento
      end
      @lista = []
      query = "socioeduk_artigo_infracoes.id, socioeduk_artigo_infracoes.pai_id, descricao, nome,
      (
        select count(pn.id) from socioeduk_processo_naturezas pn 
        INNER JOIN socioeduk_processos p ON p.id = pn.processo_id
        INNER JOIN socioeduk_jovem_recepcoes jr ON jr.id = p.socioeduk_jovem_recepcao_id
        INNER JOIN socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id
        INNER JOIN socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = p.id
        where pn.tipo_natureza = 'Tentada' AND pn.socioeduk_artigo_infracao_id = socioeduk_artigo_infracoes.id AND p.deleted_at is null AND j.deleted_at is null AND ms.deleted_at is null #{where_data + where_status + tipo_medida + situacao_cumprimento}
      ) tentada,
      (
        select count(pn.id) from socioeduk_processo_naturezas pn 
        INNER JOIN socioeduk_processos p ON p.id = pn.processo_id
        INNER JOIN socioeduk_jovem_recepcoes jr ON jr.id = p.socioeduk_jovem_recepcao_id
        INNER JOIN socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id
        INNER JOIN socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = p.id
        where pn.tipo_natureza = 'Consumada' AND pn.socioeduk_artigo_infracao_id = socioeduk_artigo_infracoes.id AND p.deleted_at is null AND j.deleted_at is null AND ms.deleted_at is null #{where_data + where_status + tipo_medida + situacao_cumprimento}
      ) consumada"
      
      infracoes_iguais = Socioeduk::ArtigoInfracao.select(query)
                                                  .where("descricao != 'Outros' and pai_id = id")
                                                  .order(:id)
      infracoes_diferentes = Socioeduk::ArtigoInfracao.select(query)
                                                      .where("descricao != 'Outros' and pai_id != id")
                                                      .order(:id)
      infracoes_iguais.each do |infracao_igual|
        hash = {}
        hash[:id] = infracao_igual.id
        hash[:pai_id] = infracao_igual.pai_id
        hash[:descricao] = infracao_igual.descricao
        hash[:nome] = infracao_igual.nome
        tentada = infracao_igual.tentada
        consumada = infracao_igual.consumada
        infracoes_diferentes.each do |infracao_diferente|
          if (infracao_igual.id == infracao_diferente.pai_id)
            tentada += infracao_diferente.tentada
            consumada += infracao_diferente.consumada
          end
        end
        hash[:tentada] = tentada
        hash[:consumada] = consumada
        if(tentada>0 || consumada>0)
          @lista.push(hash)
        end
      end
      @lista
    end
  end 

  def movimentacao_transferencias
    if params[:frm]      
      @data_inicial = params[:frm][:data_inicial]
      @data_final = params[:frm][:data_final]
      
      if(@data_final.blank?)
        @data_final = Time.now.strftime('%d/%m/%Y')
      end
      where_data = ''
      if(!@data_inicial.blank? or !@data_final.blank?)
        where_data = " AND socioeduk_gestao_vagas.data_movimentacao BETWEEN '"+@data_inicial.to_date.strftime('%Y-%m-%d')+"' AND '"+@data_final.to_date.strftime('%Y-%m-%d')+"'"
      end
      
      @movimentacoes = Socioeduk::GestaoVaga.select('socioeduk_gestao_vagas.id, j.id jovem_id, j.nome, socioeduk_gestao_vagas.ativo, socioeduk_gestao_vagas.data_movimentacao, usde.nome de, uspara.nome para')
      .joins('left join unidades_socioeducativas usde ON usde.id = socioeduk_gestao_vagas.de_unidade_socioeducativa_id
              left join unidades_socioeducativas uspara ON uspara.id = socioeduk_gestao_vagas.para_unidade_socioeducativa_id
              inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id
              inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id')
      .where("socioeduk_gestao_vagas.status = 'Transferido'"+where_data)
      .order("j.id,j.nome, socioeduk_gestao_vagas.data_movimentacao")
      @movimentacoes
    end
  end

  def qtd_jovens_por_sexo
    @meninos = Socioeduk::Processo.select("j.id")
    .joins("inner join socioeduk_status_processos as sp on sp.id = socioeduk_processos.socioeduk_status_processo_id
            inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = socioeduk_processos.id
            inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
            inner join socioeduk_jovem_recepcoes as jr on jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
            inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
            inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id")
    .where("ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true AND j.sexo = 'M'
            and j.deleted_at is null and jr.deleted_at is null and socioeduk_processos.deleted_at is null AND ms.deleted_at is null").count

    @meninas = Socioeduk::Processo.select("j.id")
    .joins("inner join socioeduk_status_processos as sp on sp.id = socioeduk_processos.socioeduk_status_processo_id
            inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = socioeduk_processos.id
            inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
            inner join socioeduk_jovem_recepcoes as jr on jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
            inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
            inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id")
    .where("ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true AND j.sexo = 'F'
            and j.deleted_at is null and jr.deleted_at is null and socioeduk_processos.deleted_at is null AND ms.deleted_at is null").count

    @total = @meninos + @meninas

    @lista_qtd_por_tipo_medidas = Socioeduk::Processo.select('tms.descricao medida, j.sexo, count(j.id) qtd')
    .joins('inner join socioeduk_status_processos as sp on sp.id = socioeduk_processos.socioeduk_status_processo_id
            inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = socioeduk_processos.id
            inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
            inner join socioeduk_jovem_recepcoes as jr on jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
            inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
            inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id')
    .where('ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true 
            and j.deleted_at is null and jr.deleted_at is null and socioeduk_processos.deleted_at is null AND ms.deleted_at is null')
    .group('medida, j.sexo')
    .order('medida, j.sexo')
  end

  def quantitativo_por_comarcas
    @quantitativo_por_comarcas = Socioeduk::Processo.select("c.id, c.nome, count(c.id) total,
    (
    select count(c1.id) from socioeduk_processos p1
    inner join socioeduk_numero_processos np1 on np1.socioeduk_processo_id = p1.id
    inner join cidades c1 ON c1.id = np1.cidade_id
    inner join socioeduk_medida_socioeducativas ms1 on ms1.socioeduk_processo_id = p1.id
    inner join socioeduk_jovem_recepcoes jr1 on jr1.id = p1.socioeduk_jovem_recepcao_id
    inner join socioeduk_jovens j1 on j1.id = jr1.socioeduk_jovem_id
    inner join socioeduk_gestao_vagas gv1 on gv1.socioeduk_jovem_recepcao_id = jr1.id
    where ms1.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr1.status = true and gv1.ativo = true AND principal = true AND j1.sexo = 'M' AND c1.id = c.id 
    and j1.deleted_at is null and jr1.deleted_at is null and p1.deleted_at is null AND ms1.deleted_at is null
    ) masculino,
    (
    select count(c1.id) from socioeduk_processos p1
    inner join socioeduk_numero_processos np1 on np1.socioeduk_processo_id = p1.id
    inner join cidades c1 ON c1.id = np1.cidade_id
    inner join socioeduk_medida_socioeducativas ms1 on ms1.socioeduk_processo_id = p1.id
    inner join socioeduk_jovem_recepcoes jr1 on jr1.id = p1.socioeduk_jovem_recepcao_id
    inner join socioeduk_jovens j1 on j1.id = jr1.socioeduk_jovem_id
    inner join socioeduk_gestao_vagas gv1 on gv1.socioeduk_jovem_recepcao_id = jr1.id
    where ms1.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr1.status = true and gv1.ativo = true AND principal = true AND j1.sexo = 'F' AND c1.id = c.id 
    and j1.deleted_at is null and jr1.deleted_at is null and p1.deleted_at is null AND ms1.deleted_at is null
    ) feminino")
    .joins('inner join socioeduk_numero_processos np on np.socioeduk_processo_id = socioeduk_processos.id
            inner join cidades c ON c.id = np.cidade_id
            inner join socioeduk_medida_socioeducativas ms on ms.socioeduk_processo_id = socioeduk_processos.id
            inner join socioeduk_jovem_recepcoes jr on jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
            inner join socioeduk_jovens j on j.id = jr.socioeduk_jovem_id
            inner join socioeduk_gestao_vagas gv on gv.socioeduk_jovem_recepcao_id = jr.id')
    .where('ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true AND principal = true 
            and j.deleted_at is null and jr.deleted_at is null and socioeduk_processos.deleted_at is null AND ms.deleted_at is null')
    .group('c.id, c.nome')
    .order('count(c.id) desc')
  end

  def quantitativo_por_ato_infracionais
    @lista = []
    @quantitativo_por_ato_infracionais = Socioeduk::Processo.select("ai.id, ai.pai_id, ai.nome, 
      (
      select count(p1.id) from socioeduk_processos p1
      inner join socioeduk_processo_naturezas pn1 on pn1.processo_id = p1.id
      inner join socioeduk_artigo_infracoes ai1 on ai1.id = pn1.socioeduk_artigo_infracao_id
      inner join socioeduk_status_processos as sp1 on sp1.id = p1.socioeduk_status_processo_id
      inner join socioeduk_medida_socioeducativas as ms1 on ms1.socioeduk_processo_id = p1.id
      inner join socioeduk_tipo_medida_socioeducativas as tms1 on tms1.id = ms1.socioeduk_tipo_medida_socioeducativa_id
      inner join socioeduk_jovem_recepcoes as jr1 on jr1.id = p1.socioeduk_jovem_recepcao_id
      inner join socioeduk_jovens as j1 on j1.id = jr1.socioeduk_jovem_id
      inner join socioeduk_gestao_vagas as gv1 on gv1.socioeduk_jovem_recepcao_id = jr1.id
      where ms1.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr1.status = true and gv1.ativo = true and ai1.id = ai.id and j1.sexo = 'M'
      and j1.deleted_at is null and jr1.deleted_at is null and p1.deleted_at is null AND ms1.deleted_at is null
      ) Masculino,
      (
      select count(p1.id) from socioeduk_processos p1
      inner join socioeduk_processo_naturezas pn1 on pn1.processo_id = p1.id
      inner join socioeduk_artigo_infracoes ai1 on ai1.id = pn1.socioeduk_artigo_infracao_id
      inner join socioeduk_status_processos as sp1 on sp1.id = p1.socioeduk_status_processo_id
      inner join socioeduk_medida_socioeducativas as ms1 on ms1.socioeduk_processo_id = p1.id
      inner join socioeduk_tipo_medida_socioeducativas as tms1 on tms1.id = ms1.socioeduk_tipo_medida_socioeducativa_id
      inner join socioeduk_jovem_recepcoes as jr1 on jr1.id = p1.socioeduk_jovem_recepcao_id
      inner join socioeduk_jovens as j1 on j1.id = jr1.socioeduk_jovem_id
      inner join socioeduk_gestao_vagas as gv1 on gv1.socioeduk_jovem_recepcao_id = jr1.id
      where ms1.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr1.status = true and gv1.ativo = true and ai1.id = ai.id and j1.sexo = 'F'
      and j1.deleted_at is null and jr1.deleted_at is null and p1.deleted_at is null AND ms1.deleted_at is null
      ) Feminino,
      count(socioeduk_processos.id) total")
    .joins("inner join socioeduk_processo_naturezas pn on pn.processo_id = socioeduk_processos.id
            inner join socioeduk_artigo_infracoes ai on ai.id = pn.socioeduk_artigo_infracao_id
            inner join socioeduk_status_processos as sp on sp.id = socioeduk_processos.socioeduk_status_processo_id
            inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = socioeduk_processos.id
            inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
            inner join socioeduk_jovem_recepcoes as jr on jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
            inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
            inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id")
    .where("ms.socioeduk_situacao_cumprimento_id not in (3,5,6) and jr.status = true and gv.ativo = true 
            and j.deleted_at is null and jr.deleted_at is null and socioeduk_processos.deleted_at is null AND ms.deleted_at is null")
    .group('ai.id, ai.nome')
    .order('ai.pai_id')

    pai_id_temp = 1
    pai_id = 0
    nome = ''
    masculino = 0
    feminino = 0
    total = 0
    @quantitativo_por_ato_infracionais.each do |quantitativo_por_ato_infracional|
      hash = {}
      if pai_id_temp == quantitativo_por_ato_infracional.pai_id
        pai_id = quantitativo_por_ato_infracional.pai_id
        nome = quantitativo_por_ato_infracional.nome
        masculino += quantitativo_por_ato_infracional.masculino
        feminino += quantitativo_por_ato_infracional.feminino
        total += quantitativo_por_ato_infracional.total
      else
        hash[:pai_id] = pai_id
        hash[:nome] = nome
        hash[:masculino] = masculino
        hash[:feminino] = feminino
        hash[:total] = total
        @lista.push(hash)
        pai_id = 0
        nome = ''
        masculino = 0
        feminino = 0
        total = 0
        pai_id = quantitativo_por_ato_infracional.pai_id
        nome = quantitativo_por_ato_infracional.nome
        masculino += quantitativo_por_ato_infracional.masculino
        feminino += quantitativo_por_ato_infracional.feminino
        total += quantitativo_por_ato_infracional.total
      end
      pai_id_temp = quantitativo_por_ato_infracional.pai_id
    end
    @lista
  end

  def mapeamento_atendimentos
    if params[:frm]      
      @ano = params[:frm][:ano]
      @situacao = params[:frm][:situacao]
      
      if(@ano.blank?)
        @ano = Time.now.strftime('%Y')
      end
      where_ano = ''

      tipo_script = ''
      # LISTA OS ADOLESCENTES QUE FORA ADMITIDO E RECEPCIONADO DIRETAMENTE DO INTERIOR
      if (@situacao == 'Admitido')
        where_data = " AND (socioeduk_gestao_vagas.status = 'Admitido' OR socioeduk_gestao_vagas.status = 'Admissão Direta') AND EXTRACT(year FROM socioeduk_gestao_vagas.data_movimentacao) = "+@ano+""
        tipo_script = 'simples'
      # LISTA APENAS OS RECEPCIONADOS PELA RECEPÇÃO INDEPENDENTE SE FICARAM OU NÃO NO SISTEMA SOCIOEDUCATIVO
      elsif (@situacao == 'Recepcionado')
        tipo_script = 'simples'
        where_data = " AND socioeduk_gestao_vagas.status = 'Recepcionado' AND EXTRACT(year FROM socioeduk_gestao_vagas.data_movimentacao) = '"+@ano+"'"
      elsif
        where_data = " AND (socioeduk_gestao_vagas.status = 'Admitido' OR socioeduk_gestao_vagas.status = 'Admissão Direta') AND EXTRACT(year FROM socioeduk_gestao_vagas.data_movimentacao) = "+@ano+""
        tipo_script = 'complexo'
      end
      
      # QUANDO A BUSCA FOR SIMPLES É REALIZADO O ALGORITMO A BAIXO
      if(tipo_script == 'simples')
        @movimentacoes = Socioeduk::GestaoVaga.select('socioeduk_gestao_vagas.id, j.id jovem_id, j.nome, socioeduk_gestao_vagas.ativo, socioeduk_gestao_vagas.data_movimentacao, usde.nome de, uspara.nome para')
        .joins('left join unidades_socioeducativas usde ON usde.id = socioeduk_gestao_vagas.de_unidade_socioeducativa_id
                left join unidades_socioeducativas uspara ON uspara.id = socioeduk_gestao_vagas.para_unidade_socioeducativa_id
                inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id
                inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id')
        .where("socioeduk_gestao_vagas.deleted_at is null AND jr.deleted_at is null AND j.deleted_at is null "+where_data)
        .order("socioeduk_gestao_vagas.data_movimentacao, j.id,j.nome")
      
      # QUANDO A BUSCA FOR COMPLEXA PRIMEIRO É CAPTURADO TODOS OS ADOLESCENTES QUE FORAM RECEPCIONADOS, DEPOIS LISTA OS QUE ENTROU NO SISTEMA
      # O NUMERO DE JOVENS QUE SÃO RECEPCIONADOS SEMPRE É MAIOR QUE OS QUE ENTRAM, POIS MUITOS SAO LIBERADOS, PORISSO É NECESSÁRIO
      # FAZER A DEDUÇÃO PARA EXIBIR OS QUE FORAM RECEPCIONADO PELO SISTEMA MAS NÃO CUMPRIRAM MEDIDA.
      else
        # CAPTURA OS IDS DE TODOS OS JOVENS ADMITIDOS
        jovens_admitidos = Socioeduk::GestaoVaga.select('socioeduk_gestao_vagas.id, j.id jovem_id, j.nome, socioeduk_gestao_vagas.ativo, socioeduk_gestao_vagas.data_movimentacao, usde.nome de, uspara.nome para, socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id')
        .joins('left join unidades_socioeducativas usde ON usde.id = socioeduk_gestao_vagas.de_unidade_socioeducativa_id
          left join unidades_socioeducativas uspara ON uspara.id = socioeduk_gestao_vagas.para_unidade_socioeducativa_id
          inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id
          inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id')
        .where("socioeduk_gestao_vagas.deleted_at is null AND jr.deleted_at is null AND j.deleted_at is null "+where_data)
        .order("socioeduk_gestao_vagas.data_movimentacao, j.id,j.nome")

        ids = []
        jovens_admitidos.each do |jovens_admitido|
          ids.push(jovens_admitido.socioeduk_jovem_recepcao_id)
        end
        
        # CAPTURA TODOS OS RECEPCIONADOS DESCONSIDERANDO OS IDS DOS ADMITIDOS RESTANDO APENAS OS J0VENS QUE NÃO ENTRARAM NO SISTEMA
        @movimentacoes = Socioeduk::GestaoVaga.select('socioeduk_gestao_vagas.id, j.id jovem_id, j.nome, socioeduk_gestao_vagas.ativo, socioeduk_gestao_vagas.data_movimentacao, usde.nome de, uspara.nome para, socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id')
        .joins('left join unidades_socioeducativas usde ON usde.id = socioeduk_gestao_vagas.de_unidade_socioeducativa_id
                left join unidades_socioeducativas uspara ON uspara.id = socioeduk_gestao_vagas.para_unidade_socioeducativa_id
                inner join socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id
                inner join socioeduk_jovens j ON j.id = jr.socioeduk_jovem_id')
        .where("socioeduk_gestao_vagas.deleted_at is null AND jr.deleted_at is null AND j.deleted_at is null AND
                socioeduk_gestao_vagas.status = 'Recepcionado' AND EXTRACT(year FROM socioeduk_gestao_vagas.data_movimentacao) = "+@ano+" AND
                socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id not in ("+ids.join(',')+")")
        .order("socioeduk_gestao_vagas.data_movimentacao, j.id,j.nome")
      end

      # ids1 = []
      # @movimentacoes.each do |jovens_admitido|
      #   ids1.push(jovens_admitido.socioeduk_jovem_recepcao_id)
      # end
      # raise ids1.inspect

      #SEPARA OS ITENS PELO NUMERO DO MES
      @janeiro = 0
      @fevereiro = 0
      @marco = 0
      @abril = 0
      @maio = 0
      @junho = 0
      @julho = 0
      @agosto = 0
      @setembro = 0
      @outubro = 0
      @novembro = 0
      @dezembro = 0

      @movimentacoes.each do |movimentacao|
        mes = movimentacao.data_movimentacao.strftime("%m")
        @janeiro = mes.to_s == "01" ? @janeiro + 1 : @janeiro
        @fevereiro = mes.to_s == "02" ? @fevereiro + 1 : @fevereiro
        @marco = mes.to_s == "03" ? @marco + 1 : @marco
        @abril = mes.to_s == "04" ? @abril + 1 : @abril
        @maio = mes.to_s == "05" ? @maio + 1 : @maio
        @junho = mes.to_s == "06" ? @junho + 1 : @junho
        @julho = mes.to_s == "07" ? @julho + 1 : @julho
        @agosto = mes.to_s == "08" ? @agosto + 1 : @agosto
        @setembro = mes.to_s == "09" ? @setembro + 1 : @setembro
        @outubro = mes.to_s == "10" ? @outubro + 1 : @outubro
        @novembro = mes.to_s == "11" ? @novembro + 1 : @novembro
        @dezembro = mes.to_s == "12" ? @dezembro + 1 : @dezembro
      end
      @total = @janeiro + @fevereiro + @marco + @abril + @maio + @junho + @julho + @agosto + @setembro + @outubro + @novembro + @dezembro
      @movimentacoes
    end
  end

  def relacao_adolescentes
    if params[:frm]      
      @status = params[:frm][:status]
      @tipo_medida = params[:frm][:tipo_medida]
      where_status = ''
      where_tipo_medida = ''
      if(!@status.blank?)
        where_status = " AND p.socioeduk_status_processo_id = "+@status
      end
      if(!@tipo_medida.blank?)
        where_tipo_medida = " AND tms.id = "+@tipo_medida
      end
      @lista = []
      #rua, numero, bairro, c.nome cidade,
      # .joins('INNER JOIN socioeduk_endereco_jovens ej ON ej.socioeduk_jovem_id = socioeduk_jovens.id')
      # .joins('INNER JOIN cidades c ON c.id = ej.cidade_id')
      jovens = Socioeduk::Jovem.select("socioeduk_jovens.id, socioeduk_jovens.nome, data_nascimento, rg, cpf, ai.descricao ato_infracional, tms.descricao medida, ms.inicio, ms.fim_previsto, tcms.descricao conclusao,
        (
          select concat(us.sigla, ' - ', us.nome) as nome from socioeduk_gestao_vagas gv
          inner join unidades_socioeducativas us on us.id = gv.para_unidade_socioeducativa_id
          where socioeduk_jovem_recepcao_id = jr.id and ativo = true 
          limit 1
        ) unidade,
        (
          select rua from socioeduk_endereco_jovens ej
          where ej.socioeduk_jovem_id = socioeduk_jovens.id
          order by id desc
          limit 1
        ) rua,
        (
          select bairro from socioeduk_endereco_jovens ej
          where ej.socioeduk_jovem_id = socioeduk_jovens.id
          order by id desc
          limit 1
        ) bairro,
        (
          select c.nome cidade from socioeduk_endereco_jovens ej
          INNER JOIN cidades c ON c.id = ej.cidade_id
          where ej.socioeduk_jovem_id = socioeduk_jovens.id
          order by c.id desc
          limit 1
        ) cidade")
                .joins('INNER JOIN socioeduk_jovem_recepcoes jr ON jr.socioeduk_jovem_id = socioeduk_jovens.id')
                .joins('INNER JOIN socioeduk_processos p ON p.socioeduk_jovem_recepcao_id = jr.id')
                .joins('INNER JOIN socioeduk_processo_naturezas pn ON pn.processo_id = p.id')
                .joins('INNER JOIN socioeduk_artigo_infracoes ai ON ai.id = pn.socioeduk_artigo_infracao_id')
                .joins('INNER JOIN socioeduk_medida_socioeducativas ms ON ms.socioeduk_processo_id = p.id')
                .joins('INNER JOIN socioeduk_tipo_medida_socioeducativas tms ON tms.id = ms.socioeduk_tipo_medida_socioeducativa_id')
                .joins('INNER JOIN socioeduk_medida_socioeducativa_motivo_conclusoes msmc ON msmc.id = ms.socioeduk_medida_socioeducativa_motivo_conclusao_id')
                .joins('INNER JOIN socioeduk_tipo_conclusao_medida_socioeducativas tcms ON tcms.id = msmc.socioeduk_tipo_conclusao_medida_socioeducativa_id')
                .where('socioeduk_jovens.deleted_at is null and jr.deleted_at is null and p.deleted_at is null'+where_status + where_tipo_medida)
        
        jovens.each do |jovem|
        hash = {}
        hash[:nome] = jovem.nome
        hash[:data_nascimento] = jovem.data_nascimento
        if !jovem.data_nascimento.nil?
          hash[:idade] = idade(jovem.data_nascimento)
        end
        hash[:rg] = jovem.rg
        hash[:cpf] = jovem.cpf
        hash[:unidade] = jovem.unidade
        hash[:rua] = jovem.rua
        hash[:bairro] = jovem.bairro
        hash[:cidade] = jovem.cidade
        hash[:ato_infracional] = jovem.ato_infracional
        hash[:medida] = jovem.medida
        hash[:inicio] = jovem.inicio
        if(@status == '1')
          hash[:permanencia] = intervalo_de_data_por_extenso(jovem.inicio, Time.now)
        elsif(@status == '3' && !jovem.fim_previsto.nil?)
          hash[:permanencia] = intervalo_de_data_por_extenso(jovem.inicio, jovem.fim_previsto)
        end
        hash[:fim_previsto] = jovem.fim_previsto
        hash[:conclusao] = jovem.conclusao
        
        @lista.push(hash)
      end
    end
  end

  def intervalo_de_data_por_extenso(data_inicial, data_final)
    intervalo_data = (Date.parse(data_final.strftime('%d/%m/%Y')) - Date.parse(data_inicial.strftime('%d/%m/%Y'))).to_f
    anos = (intervalo_data/(30*12)).to_i
    meses = (intervalo_data/30).to_i
    meses_restante = meses - (anos*12)
    dias = intervalo_data - (meses * 30)
    anos > 1 ? text_ano = " anos ": text_ano = " ano "
    meses_restante > 1 ? text_mes = " meses ": text_mes = " mês "
    dias > 1 ? text_dia = " dias ": text_dia = " dia "
    if anos > 0
      texto = anos.to_s + text_ano + meses_restante.to_s + text_mes + " e " + dias.round(0).to_s + text_dia
    else 
      texto = meses_restante.to_s + text_mes + " e " + dias.round(0).to_s + text_dia
    end
  end

  def idade(aniversario)
    (Time.now.to_s(:number).to_i - aniversario.to_time.to_s(:number).to_i)/10e9.to_i
  end
  # Usando função FIND BY SQL
  def quantitativo_em_espera
    @llista_de_espera_vagas_1 = Socioeduk::Processo.find_by_sql("
      select  
      sp.socioeduk_jovem_recepcao_id,
      sj.nome,
      to_char(sj.data_nascimento :: DATE, 'dd/mm/yyyy') as data_nascimento, 
      extract(year from age(sj.data_nascimento)) as idade,
      to_char(sp.data_hora_apreensao :: DATE, 'dd/mm/yyyy') as apreensao,
      sp.pontuacao_bkp,
      sp.aguardando_vaga,
      to_char(sp.data_espera :: DATE, 'dd/mm/yyyy') as data_espera
      from socioeduk_processos sp 
      inner join socioeduk_jovem_recepcoes sjr  on sp.socioeduk_jovem_recepcao_id =  sjr.id 
      inner join socioeduk_jovens sj on sjr.socioeduk_jovem_id = sj.id 
      where sp.aguardando_vaga = true 
      order by sp.pontuacao_bkp desc 
      ")

      # Usando active record
    @lista_de_espera_vagas_2 = Socioeduk::Processo.select("socioeduk_processos.socioeduk_jovem_recepcao_id, sj.nome, to_char(sj.data_nascimento :: DATE, 'dd/mm/yyyy') as data_nascimento, extract(year from age(sj.data_nascimento)) as idade, to_char(socioeduk_processos.data_hora_apreensao :: DATE, 'dd/mm/yyyy') as apreensao, socioeduk_processos.pontuacao_bkp, socioeduk_processos.aguardando_vaga, to_char(socioeduk_processos.data_espera :: DATE, 'dd/mm/yyyy') as data_espera")
      .joins('inner join socioeduk_jovem_recepcoes sjr  on sjr.id = socioeduk_processos.socioeduk_jovem_recepcao_id')
      .joins('inner join socioeduk_jovens sj on sj.id = sjr.socioeduk_jovem_id')
      .where ('socioeduk_processos.aguardando_vaga = true')
  end
end
