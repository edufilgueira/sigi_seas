# encoding: utf-8
class Socioeduk::TecnicoJovemProgramaSociaisController < SocioedukApplicationController
  before_action :set_socioeduk_tecnico_jovem_programa_social, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tecnico_jovem_programa_social").pluralize, :socioeduk_tecnico_jovem_programa_sociais_path
  add_breadcrumb "Detalhe", :socioeduk_tecnico_jovem_programa_social_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tecnico_jovem_programa_social_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tecnico_jovem_programa_social_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tecnico_jovem_programa_sociais = Socioeduk::TecnicoJovemProgramaSocial.all
  end

  def show
  end

  def new
    @socioeduk_tecnico_jovem_programa_social = Socioeduk::TecnicoJovemProgramaSocial.new
  end

  def edit
  end

  def create
    @socioeduk_tecnico_jovem_programa_social = Socioeduk::TecnicoJovemProgramaSocial.new(socioeduk_tecnico_jovem_programa_social_params)

    respond_to do |format|
      if @socioeduk_tecnico_jovem_programa_social.save
        format.html { redirect_to socioeduk_tecnico_jovem_programa_sociais_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tecnico_jovem_programa_social }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tecnico_jovem_programa_social.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tecnico_jovem_programa_social.update(socioeduk_tecnico_jovem_programa_social_params)
      redirect_to socioeduk_tecnico_jovem_programa_sociais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tecnico_jovem_programa_social.destroy
        format.html { redirect_to socioeduk_tecnico_jovem_programa_sociais_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tecnico_jovem_programa_social.errors.full_messages[0] if @socioeduk_tecnico_jovem_programa_social.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tecnico_jovem_programa_social
      @socioeduk_tecnico_jovem_programa_social = Socioeduk::TecnicoJovemProgramaSocial.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tecnico_jovem_programa_social_params
        params.require(:socioeduk_tecnico_jovem_programa_social).permit(:socioeduk_tecnico_jovem_id, :socioeduk_programa_social_id)
    end
end
