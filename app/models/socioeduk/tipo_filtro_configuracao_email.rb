class Socioeduk::TipoFiltroConfiguracaoEmail < ApplicationRecord
  belongs_to :socioeduk_tipo_acao_configuracao_email, class_name: 'Socioeduk::TipoAcaoConfiguracaoEmail', foreign_key: 'socioeduk_tipo_acao_configuracao_email_id', required: false
end
