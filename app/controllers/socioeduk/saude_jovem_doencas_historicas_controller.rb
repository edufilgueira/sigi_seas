# encoding: utf-8
class Socioeduk::SaudeJovemDoencasHistoricasController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovem_doencas_historica, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovem_doencas_historica").pluralize, :socioeduk_saude_jovem_doencas_historicas_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovem_doencas_historica_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovem_doencas_historica_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovem_doencas_historica_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovem_doencas_historicas = Socioeduk::SaudeJovemDoencasHistorica.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovem_doencas_historica = Socioeduk::SaudeJovemDoencasHistorica.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovem_doencas_historica = Socioeduk::SaudeJovemDoencasHistorica.new(socioeduk_saude_jovem_doencas_historica_params)

    respond_to do |format|
      if @socioeduk_saude_jovem_doencas_historica.save
        format.html { redirect_to socioeduk_saude_jovem_doencas_historicas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovem_doencas_historica }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovem_doencas_historica.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovem_doencas_historica.update(socioeduk_saude_jovem_doencas_historica_params)
      redirect_to socioeduk_saude_jovem_doencas_historicas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovem_doencas_historica.destroy
        format.html { redirect_to socioeduk_saude_jovem_doencas_historicas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovem_doencas_historica.errors.full_messages[0] if @socioeduk_saude_jovem_doencas_historica.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovem_doencas_historica
      @socioeduk_saude_jovem_doencas_historica = Socioeduk::SaudeJovemDoencasHistorica.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovem_doencas_historica_params
        params.require(:socioeduk_saude_jovem_doencas_historica).permit(:socioeduk_saude_jovem_id, :socioeduk_cid_id, :diagnostico)
    end
end
