# encoding: utf-8
class Socioeduk::SaudeJovensParentesViciadosController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovens_parentes_viciado, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovens_parentes_viciado").pluralize, :socioeduk_saude_jovens_parentes_viciados_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovens_parentes_viciado_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovens_parentes_viciado_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovens_parentes_viciado_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovens_parentes_viciados = Socioeduk::SaudeJovensParentesViciado.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovens_parentes_viciado = Socioeduk::SaudeJovensParentesViciado.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovens_parentes_viciado = Socioeduk::SaudeJovensParentesViciado.new(socioeduk_saude_jovens_parentes_viciado_params)

    respond_to do |format|
      if @socioeduk_saude_jovens_parentes_viciado.save
        format.html { redirect_to socioeduk_saude_jovens_parentes_viciados_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovens_parentes_viciado }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovens_parentes_viciado.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovens_parentes_viciado.update(socioeduk_saude_jovens_parentes_viciado_params)
      redirect_to socioeduk_saude_jovens_parentes_viciados_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovens_parentes_viciado.destroy
        format.html { redirect_to socioeduk_saude_jovens_parentes_viciados_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovens_parentes_viciado.errors.full_messages[0] if @socioeduk_saude_jovens_parentes_viciado.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovens_parentes_viciado
      @socioeduk_saude_jovens_parentes_viciado = Socioeduk::SaudeJovensParentesViciado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovens_parentes_viciado_params
        params.require(:socioeduk_saude_jovens_parentes_viciado).permit(:socioeduk_saude_jovens_id, :socioeduk_tipo_parentesco_id, :socioeduk_entorpecente_id)
    end
end
