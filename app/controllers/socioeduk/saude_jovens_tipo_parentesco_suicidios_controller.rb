# encoding: utf-8
class Socioeduk::SaudeJovensTipoParentescoSuicidiosController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovens_tipo_parentesco_suicidio, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovens_tipo_parentesco_suicidio").pluralize, :socioeduk_saude_jovens_tipo_parentesco_suicidios_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovens_tipo_parentesco_suicidio_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovens_tipo_parentesco_suicidio_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovens_tipo_parentesco_suicidio_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovens_tipo_parentesco_suicidios = Socioeduk::SaudeJovensTipoParentescoSuicidio.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovens_tipo_parentesco_suicidio = Socioeduk::SaudeJovensTipoParentescoSuicidio.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovens_tipo_parentesco_suicidio = Socioeduk::SaudeJovensTipoParentescoSuicidio.new(socioeduk_saude_jovens_tipo_parentesco_suicidio_params)

    respond_to do |format|
      if @socioeduk_saude_jovens_tipo_parentesco_suicidio.save
        format.html { redirect_to socioeduk_saude_jovens_tipo_parentesco_suicidios_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovens_tipo_parentesco_suicidio }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovens_tipo_parentesco_suicidio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovens_tipo_parentesco_suicidio.update(socioeduk_saude_jovens_tipo_parentesco_suicidio_params)
      redirect_to socioeduk_saude_jovens_tipo_parentesco_suicidios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovens_tipo_parentesco_suicidio.destroy
        format.html { redirect_to socioeduk_saude_jovens_tipo_parentesco_suicidios_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovens_tipo_parentesco_suicidio.errors.full_messages[0] if @socioeduk_saude_jovens_tipo_parentesco_suicidio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovens_tipo_parentesco_suicidio
      @socioeduk_saude_jovens_tipo_parentesco_suicidio = Socioeduk::SaudeJovensTipoParentescoSuicidio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovens_tipo_parentesco_suicidio_params
        params.require(:socioeduk_saude_jovens_tipo_parentesco_suicidio).permit(:socioeduk_saude_jovens_id, :socioeduk_tipo_parentesco_id)
    end
end
