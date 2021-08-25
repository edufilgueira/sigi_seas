# encoding: utf-8
class Socioeduk::SaudeJovemSaudeClinicasController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovem_saude_clinica, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovem_saude_clinica").pluralize, :socioeduk_saude_jovem_saude_clinicas_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovem_saude_clinica_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovem_saude_clinica_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovem_saude_clinica_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovem_saude_clinicas = Socioeduk::SaudeJovemSaudeClinica.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovem_saude_clinica = Socioeduk::SaudeJovemSaudeClinica.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovem_saude_clinica = Socioeduk::SaudeJovemSaudeClinica.new(socioeduk_saude_jovem_saude_clinica_params)

    respond_to do |format|
      if @socioeduk_saude_jovem_saude_clinica.save
        format.html { redirect_to socioeduk_saude_jovem_saude_clinicas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovem_saude_clinica }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovem_saude_clinica.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovem_saude_clinica.update(socioeduk_saude_jovem_saude_clinica_params)
      redirect_to socioeduk_saude_jovem_saude_clinicas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovem_saude_clinica.destroy
        format.html { redirect_to socioeduk_saude_jovem_saude_clinicas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovem_saude_clinica.errors.full_messages[0] if @socioeduk_saude_jovem_saude_clinica.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovem_saude_clinica
      @socioeduk_saude_jovem_saude_clinica = Socioeduk::SaudeJovemSaudeClinica.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovem_saude_clinica_params
        params.require(:socioeduk_saude_jovem_saude_clinica).permit(:socioeduk_saude_jovem_id, :odontologico_clinico, :socioeduk_cid_id, :diagnostico, :socioeduk_local_tratamento_id, :outro_local_tratamento)
    end
end
