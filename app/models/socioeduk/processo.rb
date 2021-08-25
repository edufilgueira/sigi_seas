class Socioeduk::Processo < ApplicationRecord
  acts_as_paranoid
  audited

  belongs_to :socioeduk_jovem_recepcao, class_name: 'Socioeduk::JovemRecepcao'
  belongs_to :socioeduk_tipo_processo, class_name: 'Socioeduk::TipoProcesso', required: false
  belongs_to :socioeduk_situacao_processo, class_name: 'Socioeduk::SituacaoProcesso', required: false
  belongs_to :comarca, class_name: "Cidade", foreign_key: "cidade_comarca", required: false
  belongs_to :socioeduk_municipio, class_name: 'Socioeduk::Municipio', required: false
  belongs_to :cidade, class_name: "Cidade", foreign_key: "cidade_cumprimento_medida", required: false
  belongs_to :socioeduk_status_processo, class_name: "Socioeduk::StatusProcesso", required: false
  
  has_many :socioeduk_processo_naturezas, class_name: 'Socioeduk::ProcessoNatureza'
  has_many :socioeduk_processo_recepcao_jovens, class_name: 'Socioeduk::ProcessoRecepcaoJovem', :foreign_key => "socioeduk_processo_id"
  has_many :socioeduk_medida_socioeducativas, class_name: 'Socioeduk::MedidaSocioeducativa', foreign_key: "socioeduk_processo_id"
  has_many :socioeduk_audiencias, class_name: 'Socioeduk::Audiencia', foreign_key: "socioeduk_processo_id"
  has_many :socioeduk_numero_processos, class_name: 'Socioeduk::NumeroProcesso', foreign_key: "socioeduk_processo_id"
  has_many :socioeduk_processo_observacoes, class_name: 'Socioeduk::ProcessoObservacao', foreign_key: "socioeduk_processo_id"
  
  accepts_nested_attributes_for :socioeduk_processo_naturezas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_processo_recepcao_jovens, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_medida_socioeducativas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_audiencias, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_numero_processos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :socioeduk_processo_observacoes, reject_if: :all_blank, allow_destroy: true
  
  validates_presence_of :socioeduk_jovem_recepcao_id, :cidade_comarca
  validates_uniqueness_of :socioeduk_jovem_recepcao, message: "Não pode existir mais de um processo"

  def pontuacao
    natureza_processos = Socioeduk::ProcessoNatureza
                        .joins(:socioeduk_artigo_infracao)
                        .select('pontuacao_reinteracao','pontuacao_quantidade_reinteracao','tipo_natureza','pontuacao_continuado','estupro_vulneravel','socioeduk_numero_processo_id','socioeduk_artigo_infracoes.*')
                        .where("processo_id = ?", self.id)
    calc = 0
    # Constante
    c = 0.05; # Ponderação Certidão Positiva (5%)
    a = 10; # Ponderação Apreendido
    o = 10; # Organização Criminosa
    # Variaveis
    calc_descumprimento_medida = 0
    calc_organizacao_criminosa = 0;
    calc_tipo_natureza = 0
    calc_continuado = 0
    calc_vulneravel = 0
    calc_reiteracao = 0
    certidao_positiva = 0
    apreendido = 0

    # PERCORRE A NATUREZA PARA REALIZAR O CALCULO
    natureza_processos.each do |natureza_processo|
      # TIPO DE MEDIDA
      case natureza_processo.tipo_natureza
        when 'Consumada'
          calc_tipo_natureza += natureza_processo.ponderacao
        when 'Tentada'
          calc_tipo_natureza += natureza_processo.ponderacao - (natureza_processo.ponderacao * 0.3)
      end
      # CRIME CONTINUADO
      if (natureza_processo.pontuacao_continuado)
        calc_continuado += natureza_processo.ponderacao * 0.3
      end
      # ESTUPRO DE VINERÁVEL
      if (natureza_processo.estupro_vulneravel)
        calc_vulneravel += natureza_processo.ponderacao * 0.5
      end
      # REINTERAÇÃO
      if (natureza_processo.pontuacao_reinteracao)
        calc_reiteracao += natureza_processo.ponderacao * 0.1 * natureza_processo.pontuacao_quantidade_reinteracao
      end

    end  

    # CALCULO BASE DO ATO
    calc += calc_tipo_natureza + calc_continuado + calc_reiteracao
    calc -= calc_vulneravel;

    # CERTIDAO POSITIVA
    if (self.pontuacao_certidao_positiva)
      if self.pontuacao_quantidade_certidao_positiva.nil?
        self.pontuacao_quantidade_certidao_positiva = 10
      end
      if self.pontuacao_quantidade_certidao_positiva > 0
        total = 0
        quantidade = self.pontuacao_quantidade_certidao_positiva
        (1..self.pontuacao_quantidade_certidao_positiva).each{ |i|
          total += calc * c;
        }
        certidao_positiva += total
      end
    end

    # APREENDIDO
    if (self.pontuacao_apreendido)
      apreendido += a
    end

    # PERCORRE A NATUREZA PARA REALIZAR O CALCULO
    numero_processos = Socioeduk::NumeroProcesso.where(socioeduk_processo_id: self.id)
    numero_processos.each do |numero_processo|
      if(numero_processo.status)
        # DESCUMPRIMENTO MEDIDA
        if (numero_processo.pontuacao_descumprimento_medida)
          calc_descumprimento_medida += calc * 0.1
        end
        # ORGANZAÇÃO CRIMINOSA
        if (numero_processo.pontuacao_organizacao_criminosa)
          calc_organizacao_criminosa += o
        end
      end

    end 

    # # PERCORRE A NATUREZA PARA REALIZAR O CALCULO
    # natureza_processos.each do |natureza_processo|
    #   # DESCUMPRIMENTO MEDIDA
    #   if !natureza_processo.socioeduk_numero_processo_id.nil?
    #     numero_processo = Socioeduk::NumeroProcesso.find(natureza_processo.socioeduk_numero_processo_id)
    #     if(numero_processo.status)
    #       if (numero_processo.pontuacao_descumprimento_medida)
    #         calc_descumprimento_medida += natureza_processo.ponderacao * 0.1
    #       end
    #     end
    #   end
    #   # ORGANZAÇÃO CRIMINOSA
    #   if !natureza_processo.socioeduk_numero_processo_id.nil?
    #     numero_processo = Socioeduk::NumeroProcesso.find(natureza_processo.socioeduk_numero_processo_id)
    #     if(numero_processo.status)
    #       if (numero_processo.pontuacao_organizacao_criminosa)
    #         calc_organizacao_criminosa += o
    #       end
    #     end
    #   end
    # end
    calc += certidao_positiva + calc_descumprimento_medida;
    calc += calc_organizacao_criminosa;
    calc += apreendido;
    calc = calc.round(2)
  end

  def self.buscar_processo_por_recepcao(id_recepcao)
    processo_por_recepcao = Socioeduk::Processo.select('socioeduk_processos.*, cid_medida.nome as cidade_medida, cid_comarca.nome as cidade_comarca')
    .joins('left join cidades cid_medida ON cid_medida.id = socioeduk_processos.cidade_cumprimento_medida')
    .joins('left join cidades cid_comarca ON cid_comarca.id = socioeduk_processos.cidade_comarca')
    .where(socioeduk_jovem_recepcao_id: id_recepcao)
  end

  def ultima_medida_socioeducativa_ativa
    medida_socioeducativa = Socioeduk::MedidaSocioeducativa.where(socioeduk_processo_id: self.id).last
    medida_socioeducativa&.socioeduk_tipo_medida_socioeducativa&.descricao
  end

  def self.to_csv(parametros)
    attributes = %w{id nome apelido nome_mae sexo}
    raise attributes.inspect
    CSV.generate(headers: true) do |csv|
      csv << parametros
      
      all.each do |processo|
        raise processo.inspect
        #csv << jovem.attributes.values_at(*attributes)
        csv << parametros.map{ |attr| processo.send(attr) }
      end
    end
  end

  def self.relatorio_vagas(query_dinamica)
    query = "ms.socioeduk_situacao_cumprimento_id not in (3,5,6) AND jr.status = true AND gv.ativo = true 
            AND j.deleted_at is null AND jr.deleted_at is null AND socioeduk_processos.deleted_at is null AND ms.deleted_at is null "
    query = if query_dinamica.blank?
      query
    else
      query << query_dinamica
    end
    Socioeduk::Processo.select("socioeduk_processos.id processo_id, socioeduk_processos.pontuacao_certidao_positiva, socioeduk_processos.pontuacao_apreendido, j.nome_mae, j.id, j.nome as nome_jovem, j.sexo as sexo, us.sigla as sigla_unidade, us.nome as nome_unidade, socioeduk_processos.data_hora_apreensao as data_hora_apreensao, tms.descricao as ultima_medida_socioeducativa, sp.descricao status_processo, extract(year from age(j.data_nascimento)) idade")
    .joins("inner join socioeduk_status_processos as sp on sp.id = socioeduk_processos.socioeduk_status_processo_id
            inner join socioeduk_medida_socioeducativas as ms on ms.socioeduk_processo_id = socioeduk_processos.id
            inner join socioeduk_tipo_medida_socioeducativas as tms on tms.id = ms.socioeduk_tipo_medida_socioeducativa_id
            inner join socioeduk_jovem_recepcoes as jr on jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
            inner join socioeduk_jovens as j on j.id = jr.socioeduk_jovem_id
            inner join socioeduk_gestao_vagas as gv on gv.socioeduk_jovem_recepcao_id = jr.id
            inner join unidades_socioeducativas as us on us.id = gv.para_unidade_socioeducativa_id
            inner join cidades c on c.id = us.cidade_id")
    .where(query)
    .order("j.nome")
  end

  def self.listar_conclusoes_por_medida(id)
    medidas = Socioeduk::MedidaSocioeducativaMotivoConclusao.select('socioeduk_medida_socioeducativa_motivo_conclusoes.id, tcms.descricao')
    .joins('INNER JOIN socioeduk_tipo_conclusao_medida_socioeducativas tcms ON tcms.id = socioeduk_medida_socioeducativa_motivo_conclusoes.socioeduk_tipo_conclusao_medida_socioeducativa_id')
    .where(socioeduk_tipo_medida_socioeducativa_id: id)
    .order("tcms.descricao")
  end

  def self.renomear_img_jovens

    puts "Iniciando ....."
    url = "#{Rails.root}/app/assets/images/arquivos/socioeduk/jovens/fotos"

    # LISTAR TODOS OS DIRETÓRIOS
    diretorios = []
    Dir["#{url}/*"].each do |file|
      #require file
      diretorios.push(file);
    end

    # PERCORRENDO TODOS OS DIRETÓRIOS E PARA CADA DIRETÓTIO PERCORRER OS ARQUIVOS
    diretorios.each do |diretorio|
      id = 0
      # IDENTIFICANDO TODOS OS ARQUIVOS
      Dir["#{diretorio}/*"].each do |file_path|
        path_file_name = file_path.split("/")
        old_file_name =  path_file_name[path_file_name.length - 1]
        new_file_name = remover_caracteres_especiais_file(remover_acentos_file(old_file_name))
        
        # IDENTIFICANDO O ID DO JOVEM PARA REALIZAR A ALTERAÇÃO NO BANCO
        id =  path_file_name[path_file_name.length - 2]

        # RENOMEANDO ARQUIVOS
        old_file = "#{url}/#{id}/#{old_file_name}"
        new_file = "#{url}/#{id}/#{new_file_name}"
        File.rename(old_file, new_file)

        # RENOMEANDO NO BANCO
        jovens = Socioeduk::Jovem.with_deleted.where(id: id);
        
        index = new_file_name.index("original_")
        if !index.nil?
          if !jovens.blank?
            new_file_name = new_file_name.gsub("original_","")
            jovens[0].update(foto_file_name: new_file_name)
          end
        end
      end
      puts "Diretório #{id} concluído"
    end
  end

  def self.remover_acentos_file(str)
    str = str.gsub(/[ÀÁÂÃÄÅĀĂĄ]/, 'A')
    str = str.gsub(/[àáâãäåāăą]/, 'a')
    str = str.gsub(/[ÇĆĈĊČ]/, 'C')
    str = str.gsub(/[çćĉċč]/, 'c')
    str = str.gsub(/[ÐĎ]/, 'D')
    str = str.gsub(/[ďđ]/, 'd')
    str = str.gsub(/[ÈÉÊËĒĔĖĘĚ]/, 'E')
    str = str.gsub(/[èéêëēĕėęě]/, 'e')
    str = str.gsub(/[ĝğġģ]/, 'g')
    str = str.gsub(/[ĜĞĠĢ]/, 'G')
    str = str.gsub(/[ĥħ]/, 'h')
    str = str.gsub(/[ĤĦ]/, 'H')
    str = str.gsub(/[ìíîïĩīĭįı]/, 'i')
    str = str.gsub(/[ÌÍÎÏĨĪĬĮİ]/, 'I')
    str = str.gsub(/[Ĵ]/, 'J')
    str = str.gsub(/[ĵ]/, 'j')
    str = str.gsub(/[Ķķ]/, 'K')
    str = str.gsub(/[ĸ]/, 'k')
    str = str.gsub(/[ĺļ]/, 'l')
    str = str.gsub(/[ĹĻĽľĿŀŁł]/, 'L')
    str = str.gsub(/[ñńņňŉŋ]/, 'n')
    str = str.gsub(/[ÑŃŅŇŊ]/, 'N')
    str = str.gsub(/[ÒÓÔÕÖØŌŎŐ]/, 'O')
    str = str.gsub(/[òóôõöøōŏő]/, 'o')
    str = str.gsub(/[ŕŗř]/, 'r')
    str = str.gsub(/[ŔŖŘ]/, 'B')
    str = str.gsub(/[śŝşš]/, 's')
    str = str.gsub(/[ŚŜŞŠ]/, 'S')
    str = str.gsub(/[ſ]/, 'f')
    str = str.gsub(/[ţťŧ]/, 't')
    str = str.gsub(/[ŢŤŦ]/, 'T')
    str = str.gsub(/[ùúûüũūŭůűų]/, 'u')
    str = str.gsub(/[ÙÚÛÜŨŪŬŮŰŲ]/, 'U')
    str = str.gsub(/[Ŵ]/, 'W')
    str = str.gsub(/[ŵ]/, 'w')
    str = str.gsub(/[ýÿŷ]/, 'y')
    str = str.gsub(/[ÝŶŸ]/, 'Y')
    str = str.gsub(/[źž]/, 'z')
    str = str.gsub(/[ŹŻŽ]/, 'Z')
  end
  
  def self.remover_caracteres_especiais_file(str)
    str = str.gsub(/^a-zA-Z0-9_/, '')
    str = str.gsub(/[(){}<>?,;:~^´`]/, '')
    str = str.gsub(/['"!@#$%¨&*+=§°º]/, '')
    str = str.gsub(/[ -]/, '_')
    str = str.gsub("[", '')
    str = str.gsub("]", '')
    str = str.gsub("__", '_')
    str = str.gsub("___", '_')
    str = str.gsub("____", '_')
    str = str.gsub("_____", '_')
  end
end