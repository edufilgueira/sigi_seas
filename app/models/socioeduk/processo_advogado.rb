class Socioeduk::ProcessoAdvogado < ApplicationRecord
  belongs_to :processo, class_name: 'Socioeduk::Processo', :foreign_key => "socioeduk_processo_id"
  belongs_to :unidade_socioeducativa
end