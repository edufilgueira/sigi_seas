# encoding: utf-8
class Socioeduk::TecnicoJovemVisitaFamiliaresController < SocioedukApplicationController
  before_action :set_socioeduk_tecnico_jovem_visita_familiar, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tecnico_jovem_visita_familiar").pluralize, :socioeduk_tecnico_jovem_visita_familiares_path
  add_breadcrumb "Detalhe", :socioeduk_tecnico_jovem_visita_familiar_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tecnico_jovem_visita_familiar_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tecnico_jovem_visita_familiar_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tecnico_jovem_visita_familiares = Socioeduk::TecnicoJovemVisitaFamiliar.all
  end

  def show
  end

  def new
    @socioeduk_tecnico_jovem_visita_familiar = Socioeduk::TecnicoJovemVisitaFamiliar.new
  end

  def edit
  end

  def create
    @socioeduk_tecnico_jovem_visita_familiar = Socioeduk::TecnicoJovemVisitaFamiliar.new(socioeduk_tecnico_jovem_visita_familiar_params)

    respond_to do |format|
      if @socioeduk_tecnico_jovem_visita_familiar.save
        format.html { redirect_to socioeduk_tecnico_jovem_visita_familiares_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tecnico_jovem_visita_familiar }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tecnico_jovem_visita_familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tecnico_jovem_visita_familiar.update(socioeduk_tecnico_jovem_visita_familiar_params)
      redirect_to socioeduk_tecnico_jovem_visita_familiares_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tecnico_jovem_visita_familiar.destroy
        format.html { redirect_to socioeduk_tecnico_jovem_visita_familiares_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tecnico_jovem_visita_familiar.errors.full_messages[0] if @socioeduk_tecnico_jovem_visita_familiar.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tecnico_jovem_visita_familiar
      @socioeduk_tecnico_jovem_visita_familiar = Socioeduk::TecnicoJovemVisitaFamiliar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tecnico_jovem_visita_familiar_params
        params.require(:socioeduk_tecnico_jovem_visita_familiar).permit(:socioeduk_tecnico_jovem_id, :data_visita, :pessoa_visitada, :finalidade_visita, :responsavel_realizacao)
    end
end
