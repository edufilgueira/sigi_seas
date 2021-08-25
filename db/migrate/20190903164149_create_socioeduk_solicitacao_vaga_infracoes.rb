class CreateSocioedukSolicitacaoVagaInfracoes < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_solicitacao_vaga_infracoes do |t|
      t.references :solicitacao_vaga, index: { name: 'solicitacao_vaga_infracao_solicitacao_vaga' }
      t.string :tipo_natureza
      t.references :artigo_infracao, index: { name: 'solicitacao_vaga_infracao_artigo_infracao' }
      t.boolean :pontuacao_continuado
      t.boolean :estupro_vulneravel

      t.timestamps
    end
  end
end
