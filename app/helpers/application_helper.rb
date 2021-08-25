# frozen_string_literal: true

module ApplicationHelper
  def link_to_show(url, html_options = {})
    html_options.reverse_merge!(class: 'btn btn-info btn-sm', data: { tooltip: true, placement: 'top', animation: true }, title: t('helpers.links.show'))
    link_to content_tag(:i, nil, class: 'fa fa-info-circle'), url, html_options
  end

  def link_to_delete(url, html_options = {})
    html_options.reverse_merge!(method: :delete, class: 'btn btn-sm btn-danger', data: { tooltip: true, confirm: t('helpers.links.confirm'), placement: 'top', animation: true }, title: t('helpers.links.destroy'))
    link_to content_tag(:i, nil, class: 'fa fa-trash'), url, html_options
  end

  def link_to_index(url, html_options = {})
    html_options.reverse_merge!(class: 'btn btn-default btn-sm', data: { tooltip: true, placement: 'top', animation: true }, title: t('helpers.links.index'))
    link_to t('helpers.links.index'), url, html_options
  end

  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(class: 'btn btn-default btn-sm', data: { tooltip: true, placement: 'top', animation: true }, title: t('helpers.links.edit'))
    link_to content_tag(:i, nil, class: 'fa fa-edit'), url, html_options
  end

  def link_to_new(url, html_options = {})
    html_options.reverse_merge!(class: 'btn btn-success btn-sm', data: { tooltip: true, placement: 'top', animation: true }, title: t('helpers.links.new'))
    link_to t('helpers.links.new'), url, html_options
  end

  def link_to_index_new(url, html_options = {})
    html_options.reverse_merge!(class: 'btn btn-primary btn-sm', data: { tooltip: true, placement: 'top', animation: true }, title: 'helpers.links.new')
    link_to content_tag(:i, nil, class: 'fa fa-plus') << ' Novo', url, html_options
  end

  def link_to_cancel(url, html_options = {})
    html_options.reverse_merge!(class: 'btn btn-default btn-xs', data: { tooltip: true, placement: 'top', animation: true })
    link_to t('helpers.links.cancel'), url, html_options
  end

  def error_messages_for(resource)
    render 'layouts/error_messages', resource: resource
  end

  def sigla_sistema
    'SIGI'
  end

  def nome_sistema
    ".::#{sigla_sistema} - SEAS::."
  end

  def current_class?(path)
    return 'active' if request.path.eql? path
    ''
  end

  def is_active_controller(controller_name, class_name = nil)
    if params[:controller] == controller_name
      class_name.nil? ? 'active' : class_name
    end
  end

  def is_active_action(action_name)
    params[:action] == action_name ? 'active' : nil
  end

  def is_active_controller_prefix?(controller_name)
    params[:controller].split('_').first.eql?(controller_name) ? 'active' : nil
  end

  def is_active_module_prefix?(prefix_name)
    params[:controller].split('/').first.eql?(prefix_name)
  end

  def show_active(active)
    active ? 'active' : nil
  end

  def prontuario_mask(jovem_id)
    jovem_id.to_s.rjust(6, '0')
  end

  def formatar_cpf(cpf)
    cpf.gsub(/\A(\d{3})(\d{3})(\d{3})(\d{2})\Z/, "\\1.\\2.\\3-\\4") if !cpf.nil?
  end

  def time_diff_in_natural_language(from_time, to_time)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_seconds = ((to_time - from_time).abs).round
    components = []
  
    # %w(year month week day).each do |interval|
    %w(year month day).each do |interval|
      # For each interval type, if the amount of time remaining is greater than
      # one unit, calculate how many units fit into the remaining time.
      if distance_in_seconds >= 1.send(interval)
        delta = (distance_in_seconds / 1.send(interval)).floor
        distance_in_seconds -= delta.send(interval)
        interval = case interval
        when 'year'
          'ano'
        when 'month'
          'mês'
        when 'day'
          'dia'
        end
        components << pluralize(delta, interval)
        # if above line give pain. try below one
        # components <<  interval.pluralize(delta)
      end
    end
  
    components.join(", ")
  end

  def remover_acentos(str)
    str = str.gsub(/[ÀÁÂÃÄÅĀĂĄ]/, 'A')
    str = str.gsub(/[àáâãäåāăą]/, 'a')
    str = str.gsub(/[ÇĆĈĊČ]/, 'C')
    str = str.gsub(/[çćĉċč]/, 'c')
    str = str.gsub(/[ÐĎ]/, 'D')
    str = str.gsub(/[ďđ]/, 'd')
    str = str.gsub(/[ÈÉÊËĒĔĖĘĚ]/, 'E')
    str = str.gsub(/[èéêëēĕėęě]/, 'e')
    str = str.gsub(/[ĝğġģ]/, 'g')
    str = str.gsub(/[ĜĞĠĢ]/, 'G')
    str = str.gsub(/[ĥħ]/, 'h')
    str = str.gsub(/[ĤĦ]/, 'H')
    str = str.gsub(/[ìíîïĩīĭįı]/, 'i')
    str = str.gsub(/[ÌÍÎÏĨĪĬĮİ]/, 'I')
    str = str.gsub(/[Ĵ]/, 'J')
    str = str.gsub(/[ĵ]/, 'j')
    str = str.gsub(/[Ķķ]/, 'K')
    str = str.gsub(/[ĸ]/, 'k')
    str = str.gsub(/[ĺļ]/, 'l')
    str = str.gsub(/[ĹĻĽľĿŀŁł]/, 'L')
    str = str.gsub(/[ñńņňŉŋ]/, 'n')
    str = str.gsub(/[ÑŃŅŇŊ]/, 'N')
    str = str.gsub(/[ÒÓÔÕÖØŌŎŐ]/, 'O')
    str = str.gsub(/[òóôõöøōŏő]/, 'o')
    str = str.gsub(/[ŕŗř]/, 'r')
    str = str.gsub(/[ŔŖŘ]/, 'B')
    str = str.gsub(/[śŝşš]/, 's')
    str = str.gsub(/[ŚŜŞŠ]/, 'S')
    str = str.gsub(/[ſ]/, 'f')
    str = str.gsub(/[ţťŧ]/, 't')
    str = str.gsub(/[ŢŤŦ]/, 'T')
    str = str.gsub(/[ùúûüũūŭůűų]/, 'u')
    str = str.gsub(/[ÙÚÛÜŨŪŬŮŰŲ]/, 'U')
    str = str.gsub(/[Ŵ]/, 'W')
    str = str.gsub(/[ŵ]/, 'w')
    str = str.gsub(/[ýÿŷ]/, 'y')
    str = str.gsub(/[ÝŶŸ]/, 'Y')
    str = str.gsub(/[źž]/, 'z')
    str = str.gsub(/[ŹŻŽ]/, 'Z')
  end

  def link_to_download_file_csv(url, html_options = {})
    # html_options.reverse_merge!(class: 'btn btn-default btn-sm', data: { tooltip: true, placement: 'top', animation: true }, title: t('helpers.links.index'))
    link_to image_tag("csv.png", size:"42", style:"float:right"), url, html_options
  end

    # def self.intervalo_de_data_por_extenso(data_inicial, data_final)
  #   intervalo_data = (Date.parse(data_final.strftime('%d/%m/%Y')) - Date.parse(data_inicial.strftime('%d/%m/%Y'))).to_f
  #   anos = (intervalo_data/(30*12)).to_i
  #   meses = (intervalo_data/30).to_i
  #   meses_restante = meses - (anos*12)
  #   dias = intervalo_data - (meses * 30)
  #   anos > 1 ? text_ano = " anos ": text_ano = " ano "
  #   meses_restante > 1 ? text_mes = " meses ": text_mes = " mês "
  #   dias > 1 ? text_dia = " dias ": text_dia = " dia "
  #   texto = anos.to_s + text_ano + meses_restante.to_s + text_mes + " e " + dias.round(0).to_s + text_dia
  # end
  
end
