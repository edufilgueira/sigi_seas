class UnidadeBlocoDormitorio < ApplicationRecord
  belongs_to :unidade_socioeducativa_bloco
  has_many :unidade_bloco_dormitorio_capacidades, :dependent => :destroy

  validates_presence_of :descricao, :capacidade_base

  accepts_nested_attributes_for :unidade_bloco_dormitorio_capacidades, reject_if: :all_blank, allow_destroy: true

  acts_as_paranoid

  def capacidade_real
    @real = UnidadeBlocoDormitorioCapacidade.where("unidade_bloco_dormitorio_id = ?", self.id).sum(:quantidade_alteracao)
  end
end
