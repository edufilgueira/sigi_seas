# encoding: utf-8
class Socioeduk::EntorpecentesController < SocioedukApplicationController
  before_action :set_socioeduk_entorpecente, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_entorpecente").pluralize, :socioeduk_entorpecentes_path
  add_breadcrumb "Detalhe", :socioeduk_entorpecente_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_entorpecente_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_entorpecente_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_entorpecentes = Socioeduk::Entorpecente.all
  end

  def show
  end

  def new
    @socioeduk_entorpecente = Socioeduk::Entorpecente.new
  end

  def edit
  end

  def create
    @socioeduk_entorpecente = Socioeduk::Entorpecente.new(socioeduk_entorpecente_params)

    respond_to do |format|
      if @socioeduk_entorpecente.save
        format.html { redirect_to socioeduk_entorpecentes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_entorpecente }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_entorpecente.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_entorpecente.update(socioeduk_entorpecente_params)
      redirect_to socioeduk_entorpecentes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_entorpecente.destroy
        format.html { redirect_to socioeduk_entorpecentes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_entorpecente.errors.full_messages[0] if @socioeduk_entorpecente.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_entorpecente
      @socioeduk_entorpecente = Socioeduk::Entorpecente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_entorpecente_params
        params.require(:socioeduk_entorpecente).permit(:descricao, :unidades_medida_id, :status)
    end
end
