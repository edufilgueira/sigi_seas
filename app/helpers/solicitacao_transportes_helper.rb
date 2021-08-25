# frozen_string_literal: true

module SolicitacaoTransportesHelper
  def boolean_convert(params)
    'Urgente' if params
  end

  def translater_datetime(params)
    if !params.nil?
      params.gsub("Year", "Ano").gsub("Month", "Mese").gsub("Week", "Semana").gsub("Day", "Dia").gsub("Hour", "Hora").gsub("Minute", "Minuto").gsub("Second", "Segundo").gsub("and", "e")
    end
  end
end
