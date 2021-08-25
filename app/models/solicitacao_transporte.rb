# frozen_string_literal: true
class SolicitacaoTransporte < ApplicationRecord
  belongs_to :tipo_solicitacao_transporte
  belongs_to :area
  belongs_to :usuario_solicitante, class_name: 'Usuario', foreign_key: 'solicitante', required: false
  belongs_to :destinado_para, class_name: 'Pessoa', foreign_key: 'destinado_para_id'
  validates :tipo_solicitacao_transporte_id, :area_id, :destinado_para_id, :data_transporte, :data_retorno, :hora_solicitada, :hora_prevista_retorno, :destino, :justificativa, :origem, presence: true
  acts_as_paranoid
  audited
end
