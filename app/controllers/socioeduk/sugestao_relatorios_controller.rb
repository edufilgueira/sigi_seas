# encoding: utf-8
class Socioeduk::SugestaoRelatoriosController < SocioedukApplicationController
  before_action :set_socioeduk_sugestao_relatorio, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_sugestao_relatorio").pluralize, :socioeduk_sugestao_relatorios_path
  add_breadcrumb "Detalhe", :socioeduk_sugestao_relatorio_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_sugestao_relatorio_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_sugestao_relatorio_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_sugestao_relatorios = Socioeduk::SugestaoRelatorio.all
  end

  def show
  end

  def new
    @socioeduk_sugestao_relatorio = Socioeduk::SugestaoRelatorio.new
  end

  def edit
  end

  def create
    @socioeduk_sugestao_relatorio = Socioeduk::SugestaoRelatorio.new(socioeduk_sugestao_relatorio_params)

    respond_to do |format|
      if @socioeduk_sugestao_relatorio.save
        format.html { redirect_to socioeduk_sugestao_relatorios_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_sugestao_relatorio }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_sugestao_relatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_sugestao_relatorio.update(socioeduk_sugestao_relatorio_params)
      redirect_to socioeduk_sugestao_relatorios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_sugestao_relatorio.destroy
        format.html { redirect_to socioeduk_sugestao_relatorios_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_sugestao_relatorio.errors.full_messages[0] if @socioeduk_sugestao_relatorio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_sugestao_relatorio
      @socioeduk_sugestao_relatorio = Socioeduk::SugestaoRelatorio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_sugestao_relatorio_params
        params.require(:socioeduk_sugestao_relatorio).permit(:descricao)
    end
end
