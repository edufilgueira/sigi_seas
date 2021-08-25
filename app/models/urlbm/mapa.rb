class Urlbm::Mapa < ApplicationRecord
  acts_as_paranoid
  belongs_to :socioeduk_jovem_recepcao, class_name: 'Socioeduk::JovemRecepcao'
  # belongs_to :socioeduk_jovem, class_name: 'Socioeduk::Jovem'
  belongs_to :urlbm_ato_infracional, class_name: 'Urlbm::AtoInfracional'
  belongs_to :urlbm_status_map, class_name: 'Urlbm::StatusMap'
  belongs_to :cidade, class_name: 'Cidade'

  validates  :cidade_id, :presence => false#{:message => "Unidade é obrigatório !"}
  
end
