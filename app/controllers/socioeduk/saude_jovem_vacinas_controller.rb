# encoding: utf-8
class Socioeduk::SaudeJovemVacinasController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovem_vacina, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovem_vacina").pluralize, :socioeduk_saude_jovem_vacinas_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovem_vacina_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovem_vacina_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovem_vacina_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovem_vacinas = Socioeduk::SaudeJovemVacina.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovem_vacina = Socioeduk::SaudeJovemVacina.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovem_vacina = Socioeduk::SaudeJovemVacina.new(socioeduk_saude_jovem_vacina_params)

    respond_to do |format|
      if @socioeduk_saude_jovem_vacina.save
        format.html { redirect_to socioeduk_saude_jovem_vacinas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovem_vacina }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovem_vacina.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovem_vacina.update(socioeduk_saude_jovem_vacina_params)
      redirect_to socioeduk_saude_jovem_vacinas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovem_vacina.destroy
        format.html { redirect_to socioeduk_saude_jovem_vacinas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovem_vacina.errors.full_messages[0] if @socioeduk_saude_jovem_vacina.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovem_vacina
      @socioeduk_saude_jovem_vacina = Socioeduk::SaudeJovemVacina.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovem_vacina_params
        params.require(:socioeduk_saude_jovem_vacina).permit(:socioeduk_saude_jovem_id, :socioeduk_tipo_vacina_id, :data_vacinacao)
    end
end
