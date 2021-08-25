class Socioeduk::JovemControlePertence < ApplicationRecord
  belongs_to :socioeduk_jovem_recepcao, class_name: 'Socioeduk::JovemRecepcao', foreign_key: 'socioeduk_jovem_recepcao_id'

  has_many :jovem_item_pertences, class_name: 'Socioeduk::JovemItemPertence', foreign_key: "socioeduk_jovem_controle_pertence_id", :dependent => :destroy

  accepts_nested_attributes_for :jovem_item_pertences, reject_if: :all_blank, allow_destroy: true


  def self.jovens_do_controle_pertence(id)
    Socioeduk::Jovem.select('jre.id, socioeduk_jovens.nome, socioeduk_jovens.id jovem_id')
        .joins('INNER JOIN socioeduk_jovem_recepcoes jre ON jre.socioeduk_jovem_id = socioeduk_jovens.id
                INNER JOIN socioeduk_jovem_controle_pertences jcp ON jcp.socioeduk_jovem_recepcao_id = jre.id')
        .where('jcp.socioeduk_jovem_recepcao_id = ?', id)
  end

end