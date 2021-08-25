# encoding: utf-8
class Socioeduk::RelatorioDiariosController < SocioedukApplicationController
  before_action :set_socioeduk_relatorio_diario, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_relatorio_diario").pluralize, :socioeduk_relatorio_diarios_path
  add_breadcrumb "Detalhe", :socioeduk_relatorio_diario_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_relatorio_diario_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_relatorio_diario_path, only: [:edit, :update]


  respond_to :html
  def index
    # raise current_usuario&.pessoa&.funcao_pessoa.inspect
    # raise current_usuario&.pessoa&.funcao_pessoa&.last&.funcao&.area&.unidade_socioeducativa.inspect
    # funcoes = current_usuario&.pessoa&.funcoes.pluck('UPPER(nome)')
    path = "#{params[:controller].split('/').last}|#{params[:action]}"
    permissoes = current_usuario&.permissao
    perfil_permissao = current_usuario&.permissao&.perfil
    if permissoes&.recursos.include?(path) and perfil_permissao&.upcase&.eql?('DIRETOR') == false
      @socioeduk_relatorio_diarios = Socioeduk::RelatorioDiario.where(usuario_id: current_usuario.id).order(data: :desc)
    elsif permissoes&.recursos.include?(path) and perfil_permissao&.upcase&.eql?('DIRETOR')
      # @socioeduk_relatorio_diarios = Socioeduk::RelatorioDiario.where(unidade_socioeducativa_id: current_usuario&.pessoa&.funcao_pessoa&.last&.funcao&.area&.unidade_socioeducativa&.id).order(data: :desc)
      @socioeduk_relatorio_diarios = Socioeduk::RelatorioDiario.where(unidade_socioeducativa_id: current_usuario.pessoa&.recursoshumanos_vinculo&.unidade_socioeducativa_area&.unidade_socioeducativa&.id).order(data: :desc)#.page(params[:page]).per(25)
      
    else
      @socioeduk_relatorio_diarios = Socioeduk::RelatorioDiario.all.order(data: :desc)#.page(params[:page]).per(25)
    end
  end

  def show
  end

  def new
    @socioeduk_relatorio_diario = Socioeduk::RelatorioDiario.new
  end

  def edit
  end

  def create
    @socioeduk_relatorio_diario = Socioeduk::RelatorioDiario.new(socioeduk_relatorio_diario_params)
    @socioeduk_relatorio_diario.usuario_id = current_usuario.id

    respond_to do |format|
      if @socioeduk_relatorio_diario.save
        format.html { redirect_to socioeduk_relatorio_diarios_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_relatorio_diario }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_relatorio_diario.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_relatorio_diario.update(socioeduk_relatorio_diario_params)
      redirect_to socioeduk_relatorio_diarios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_relatorio_diario.destroy
        format.html { redirect_to socioeduk_relatorio_diarios_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_relatorio_diario.errors.full_messages[0] if @socioeduk_relatorio_diario.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def monitoramento
    #0 - int_mas, #1 - int_fem, #2 - ip_mas, #3 - ip_fem, #4 - sl_mas, #5 - sl_fem, #6 - capacidade_nominal, #7 - capacidade_real, #8 - socioeducador_homem, #9 - socioeducador_mulher, #10 - capacidade_por_adolescente, #11 - evasao, #12 - fuga, #13 - descumprimento, #14 - capacidade_por_adolescente_percentual, #15 - capacidade_socioeducador_por_adolescente_percentual, #16 - situacao_crise_simples, #17 - situacao_crise_critica, #18 - situacao_crise_complexa, #19 - san_mas, #20 - san_fem
    @data_referencia = if params[:frm]
      params.dig(:frm, :data).to_date
    else
      # Date.today #dia atual
      (Date.today-1) #dia anterior
    end
    @raltorio_capital = Socioeduk::RelatorioDiario.joins(unidade_socioeducativa: :cidade).select('socioeduk_relatorio_diarios.*', 'unidades_socioeducativas.*', 'cidades.nome').where('cidades.nome = ? and data = ?', 'Fortaleza', @data_referencia)
    @raltorio_interior = Socioeduk::RelatorioDiario.joins(unidade_socioeducativa: :cidade).select('socioeduk_relatorio_diarios.*', 'unidades_socioeducativas.*', 'cidades.nome').where('cidades.nome != ? and data = ?', 'Fortaleza', @data_referencia)
    @socioeduk_relatorio_diarios = @raltorio_capital + @raltorio_interior
    @total_capital = @raltorio_capital.pluck('SUM(socioeduk_relatorio_diarios.int_mas)','SUM(socioeduk_relatorio_diarios.int_fem)','SUM(socioeduk_relatorio_diarios.ip_mas)','SUM(socioeduk_relatorio_diarios.ip_fem)','SUM(socioeduk_relatorio_diarios.sl_mas)','SUM(socioeduk_relatorio_diarios.sl_fem)','SUM(socioeduk_relatorio_diarios.capacidade_nominal)','SUM(socioeduk_relatorio_diarios.capacidade_real)','SUM(socioeduk_relatorio_diarios.socioeducador_homem)','SUM(socioeduk_relatorio_diarios.socioeducador_mulher)','SUM(socioeduk_relatorio_diarios.capacidade_por_adolescente)','SUM(socioeduk_relatorio_diarios.evasao)','SUM(socioeduk_relatorio_diarios.fuga)','SUM(socioeduk_relatorio_diarios.descumprimento)','SUM(CAST(socioeduk_relatorio_diarios.capacidade_por_adolescente_percentual AS DECIMAL(17,2)))','SUM(CAST(socioeduk_relatorio_diarios.capacidade_socioeducador_por_adolescente_percentual AS DECIMAL(17,2)))','SUM(socioeduk_relatorio_diarios.situacao_crise_simples)','SUM(socioeduk_relatorio_diarios.situacao_crise_critica)','SUM(socioeduk_relatorio_diarios.situacao_crise_complexa)','SUM(socioeduk_relatorio_diarios.san_mas)','SUM(socioeduk_relatorio_diarios.san_fem)').flatten
    @total_interior = @raltorio_interior.pluck('SUM(socioeduk_relatorio_diarios.int_mas)','SUM(socioeduk_relatorio_diarios.int_fem)','SUM(socioeduk_relatorio_diarios.ip_mas)','SUM(socioeduk_relatorio_diarios.ip_fem)','SUM(socioeduk_relatorio_diarios.sl_mas)','SUM(socioeduk_relatorio_diarios.sl_fem)','SUM(socioeduk_relatorio_diarios.capacidade_nominal)','SUM(socioeduk_relatorio_diarios.capacidade_real)','SUM(socioeduk_relatorio_diarios.socioeducador_homem)','SUM(socioeduk_relatorio_diarios.socioeducador_mulher)','SUM(socioeduk_relatorio_diarios.capacidade_por_adolescente)','SUM(socioeduk_relatorio_diarios.evasao)','SUM(socioeduk_relatorio_diarios.fuga)','SUM(socioeduk_relatorio_diarios.descumprimento)','SUM(CAST(socioeduk_relatorio_diarios.capacidade_por_adolescente_percentual AS DECIMAL(17,2)))','SUM(CAST(socioeduk_relatorio_diarios.capacidade_socioeducador_por_adolescente_percentual AS DECIMAL(17,2)))','SUM(socioeduk_relatorio_diarios.situacao_crise_simples)','SUM(socioeduk_relatorio_diarios.situacao_crise_critica)','SUM(socioeduk_relatorio_diarios.situacao_crise_complexa)','SUM(socioeduk_relatorio_diarios.san_mas)','SUM(socioeduk_relatorio_diarios.san_fem)').flatten
    @resumos = @raltorio_capital.pluck('unidades_socioeducativas.sigla', :resumo) + @raltorio_interior.pluck('unidades_socioeducativas.sigla', :resumo)
  end

  def monitoramento_unidade
    @data_referencia = if params[:frm]
      params.dig(:frm, :data).to_date
    else
      Date.today-1
    end
    # @relatorio_unidade = UnidadeSocioeducativa.centros_socioeducativos.joins('LEFT JOIN socioeduk_relatorio_diarios ON unidades_socioeducativas.id = socioeduk_relatorio_diarios.unidade_socioeducativa_id').select(:nome, :sigla, 'COUNT(socioeduk_relatorio_diarios.id) AS quantidade').where('socioeduk_relatorio_diarios.data = ?', @data_referencia).group(:nome, :sigla).order(:nome)
    # @relatorio_unidade = UnidadeSocioeducativa.centros_socioeducativos.joins('LEFT JOIN socioeduk_relatorio_diarios ON unidades_socioeducativas.id = socioeduk_relatorio_diarios.unidade_socioeducativa_id').select(:nome, :sigla, 'COUNT(socioeduk_relatorio_diarios.id) AS quantidade').group(:nome, :sigla).order(:nome)
    @relatorio_unidade = UnidadeSocioeducativa.centros_socioeducativos.joins('LEFT JOIN socioeduk_relatorio_diarios ON unidades_socioeducativas.id = socioeduk_relatorio_diarios.unidade_socioeducativa_id').select(:nome, :sigla, 'CASE WHEN COUNT(socioeduk_relatorio_diarios.id) IS NOT NULL THEN COUNT(socioeduk_relatorio_diarios.id) ELSE 0 END AS quantidade').where('socioeduk_relatorio_diarios.data = ?', @data_referencia).group(:nome, :sigla).order(:nome)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_relatorio_diario
      @socioeduk_relatorio_diario = Socioeduk::RelatorioDiario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_relatorio_diario_params
        params.require(:socioeduk_relatorio_diario).permit(:unidade_socioeducativa_id, :int_mas, :int_fem, :ip_mas, :ip_fem, :sl_mas, :sl_fem, :san_mas, :san_fem, :capacidade_nominal, :capacidade_real, :socioeducador_homem, :socioeducador_mulher, :capacidade_por_adolescente, :evasao, :fuga, :descumprimento, :data, :resumo, :capacidade_por_adolescente_percentual, :capacidade_socioeducador_por_adolescente_percentual, :preenchido_por, :situacao_crise_simples, :situacao_crise_critica, :situacao_crise_complexa)
    end
end
