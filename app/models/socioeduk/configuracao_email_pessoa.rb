class Socioeduk::ConfiguracaoEmailPessoa < ApplicationRecord
  belongs_to :socioeduk_configuracao_email, class_name: 'Socioeduk::ConfiguracaoEmail', foreign_key: 'socioeduk_configuracao_email_id', required: false
end
