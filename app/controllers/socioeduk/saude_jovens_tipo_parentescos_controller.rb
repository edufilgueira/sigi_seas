# encoding: utf-8
class Socioeduk::SaudeJovensTipoParentescosController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovens_tipo_parentesco, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovens_tipo_parentesco").pluralize, :socioeduk_saude_jovens_tipo_parentescos_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovens_tipo_parentesco_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovens_tipo_parentesco_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovens_tipo_parentesco_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovens_tipo_parentescos = Socioeduk::SaudeJovensTipoParentesco.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovens_tipo_parentesco = Socioeduk::SaudeJovensTipoParentesco.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovens_tipo_parentesco = Socioeduk::SaudeJovensTipoParentesco.new(socioeduk_saude_jovens_tipo_parentesco_params)

    respond_to do |format|
      if @socioeduk_saude_jovens_tipo_parentesco.save
        format.html { redirect_to socioeduk_saude_jovens_tipo_parentescos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovens_tipo_parentesco }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovens_tipo_parentesco.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovens_tipo_parentesco.update(socioeduk_saude_jovens_tipo_parentesco_params)
      redirect_to socioeduk_saude_jovens_tipo_parentescos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovens_tipo_parentesco.destroy
        format.html { redirect_to socioeduk_saude_jovens_tipo_parentescos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovens_tipo_parentesco.errors.full_messages[0] if @socioeduk_saude_jovens_tipo_parentesco.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovens_tipo_parentesco
      @socioeduk_saude_jovens_tipo_parentesco = Socioeduk::SaudeJovensTipoParentesco.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovens_tipo_parentesco_params
        params.require(:socioeduk_saude_jovens_tipo_parentesco).permit(:socioeduk_saude_jovem_id, :socioeduk_tipo_parentesco_id)
    end
end
