class Socioeduk::GestaoVaga < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :socioeduk_jovem_recepcao, class_name: 'Socioeduk::JovemRecepcao'
  belongs_to :usuario, required: false
  belongs_to :unidade_socioeducativa_origem, class_name: 'UnidadeSocioeducativa', foreign_key: 'de_unidade_socioeducativa_id', required: false
  belongs_to :unidade_socioeducativa_destino, class_name: 'UnidadeSocioeducativa', foreign_key: 'para_unidade_socioeducativa_id', required: false

  validates_presence_of :socioeduk_jovem_recepcao_id, :status

  enum status_selects: ["Admitido", "Liberado", "Recepcionado", "Transferido"]

  def self.ativos_recepcao
    Socioeduk::JovemRecepcao
    .joins(:socioeduk_jovem, :socioeduk_gestao_vagas)
    .joins('left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = socioeduk_jovem_recepcoes.socioeduk_tipo_medida_socioeducativa_id')
    .joins('left join unidades_socioeducativas us on us.id = socioeduk_gestao_vagas.para_unidade_socioeducativa_id')
    .select('socioeduk_jovens.id id_jovem', 'socioeduk_jovens.nome nome_jovem', 'socioeduk_jovens.sexo sexo_jovem', 'socioeduk_jovens.nome_mae nome_mae', 'socioeduk_jovem_recepcoes.datahora_apresentacao', 'socioeduk_jovem_recepcoes.status','tms.descricao', 'us.id unidade_id', 'us.nome unidade', 'us.sigla unidade_sigla')
    .where('socioeduk_jovens.deleted_at is null and socioeduk_jovem_recepcoes.deleted_at is null and socioeduk_gestao_vagas.ativo = ? and socioeduk_jovem_recepcoes.status = ? and socioeduk_gestao_vagas.status = ?', true, true, 'Recepcionado')
    .group('id_jovem', 'nome_jovem, socioeduk_jovem_recepcoes.status, socioeduk_jovem_recepcoes.datahora_apresentacao, tms.descricao, us.id, us.nome, us.sigla')
    .order('nome_jovem')
  end


  def self.incluir_gestao_vaga_recepcao_direta(usuario_id, jovem_recepcao_id, para_unidade_socioeducativa_id, datahora_apresentacao)
    gestao_vaga = Socioeduk::GestaoVaga.new
    gestao_vaga.para_unidade_socioeducativa_id = para_unidade_socioeducativa_id
    gestao_vaga.usuario_id = usuario_id
    gestao_vaga.status = "Admissão Direta"
    gestao_vaga.ativo = true
    gestao_vaga.socioeduk_jovem_recepcao_id = jovem_recepcao_id
    gestao_vaga.data_movimentacao = datahora_apresentacao
    gestao_vaga.save
  end

  def self.incluir_gestao_vaga_recepcionado(usuario_id, jovem_recepcao_id)
    gestao_vaga = Socioeduk::GestaoVaga.new
    gestao_vaga.para_unidade_socioeducativa_id = 10
    gestao_vaga.usuario_id = usuario_id
    gestao_vaga.status = "Recepcionado"
    gestao_vaga.ativo = true
    gestao_vaga.socioeduk_jovem_recepcao_id = jovem_recepcao_id
    gestao_vaga.data_movimentacao = Date.today
    gestao_vaga.save
  end
  
  def self.lancar_gestao_vaga_liberado(status, usuario_id, jovem_recepcao_id, de_unidade, data_liberacao)
    gestao_vaga = Socioeduk::GestaoVaga.new
    gestao_vaga.de_unidade_socioeducativa_id = de_unidade
    gestao_vaga.usuario_id = usuario_id
    gestao_vaga.status = status
    gestao_vaga.ativo = false
    gestao_vaga.socioeduk_jovem_recepcao_id = jovem_recepcao_id
    gestao_vaga.data_movimentacao = data_liberacao
    gestao_vaga.save
  end

  def origem
    if(!self.de_unidade_socioeducativa_id.nil?)
      unidade = UnidadeSocioeducativa.find(self.de_unidade_socioeducativa_id) 
      origem = unidade.sigla + " - " + unidade.nome
    else
      nil
    end
  end

  def destino
    if(!self.para_unidade_socioeducativa_id.nil?)
      unidade = UnidadeSocioeducativa.find(self.para_unidade_socioeducativa_id)
      origem =  unidade.sigla + " - " + unidade.nome
    else
      nil
    end
  end

  def self.listar_historico_transferencia(id_jovem_recepcao)
    Socioeduk::GestaoVaga.select('socioeduk_gestao_vagas.id, data_movimentacao, origem.nome as unidade_origem, origem.sigla as sigla_origem, socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id jovem_recepcao_id, destino.nome as unidade_destino, destino.id as unidade_destino_id, destino.sigla as sigla_destino, status, ativo')
              .joins('LEFT JOIN unidades_socioeducativas origem ON origem.id = socioeduk_gestao_vagas.de_unidade_socioeducativa_id
                      LEFT JOIN unidades_socioeducativas destino ON destino.id = socioeduk_gestao_vagas.para_unidade_socioeducativa_id')
              .where('socioeduk_jovem_recepcao_id = ?', id_jovem_recepcao)
              .order('socioeduk_gestao_vagas.id asc')
  end

end