class Socioeduk::ProcessoObservacao < ApplicationRecord
  belongs_to :socioeduk_processo, class_name: 'Socioeduk::Processo'

end
