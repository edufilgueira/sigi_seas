class AddTipoEnderecoToSolicitacaoVagas < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_solicitacao_vagas, :socioeduk_tipo_endereco, foreign_key: true
  end
end
