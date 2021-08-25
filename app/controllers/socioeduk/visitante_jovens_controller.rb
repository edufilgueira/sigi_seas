# encoding: utf-8
class Socioeduk::VisitanteJovensController < SocioedukApplicationController
  before_action :set_socioeduk_visitante_jovem, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_visitante_jovem").pluralize, :socioeduk_visitante_jovens_path
  add_breadcrumb "Detalhe", :socioeduk_visitante_jovem_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_visitante_jovem_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_visitante_jovem_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_visitante_jovens = Socioeduk::VisitanteJovem.all
  end

  def show
  end

  def new
    @socioeduk_visitante_jovem = Socioeduk::VisitanteJovem.new
  end

  def edit
  end

  def create
    @socioeduk_visitante_jovem = Socioeduk::VisitanteJovem.new(socioeduk_visitante_jovem_params)

    respond_to do |format|
      if @socioeduk_visitante_jovem.save
        format.html { redirect_to socioeduk_visitante_jovens_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_visitante_jovem }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_visitante_jovem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_visitante_jovem.update(socioeduk_visitante_jovem_params)
      redirect_to socioeduk_visitante_jovens_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_visitante_jovem.destroy
        format.html { redirect_to socioeduk_visitante_jovens_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_visitante_jovem.errors.full_messages[0] if @socioeduk_visitante_jovem.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_visitante_jovem
      @socioeduk_visitante_jovem = Socioeduk::VisitanteJovem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_visitante_jovem_params
        params.require(:socioeduk_visitante_jovem).permit(:socioeduk_visitante_id, :socioeduk_jovem_id, :socioeduk_tipo_parentesco_id)
    end
end
