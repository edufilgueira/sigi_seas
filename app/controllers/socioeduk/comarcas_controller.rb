# encoding: utf-8
class Socioeduk::ComarcasController < SocioedukApplicationController
  before_action :set_socioeduk_comarca, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_comarca").pluralize, :socioeduk_comarcas_path
  add_breadcrumb "Detalhe", :socioeduk_comarca_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_comarca_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_comarca_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_comarcas = Socioeduk::Comarca.all
  end

  def show
  end

  def new
    @socioeduk_comarca = Socioeduk::Comarca.new
  end

  def edit
  end

  def create
    @socioeduk_comarca = Socioeduk::Comarca.new(socioeduk_comarca_params)

    respond_to do |format|
      if @socioeduk_comarca.save
        format.html { redirect_to socioeduk_comarcas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_comarca }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_comarca.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_comarca.update(socioeduk_comarca_params)
      redirect_to socioeduk_comarcas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_comarca.destroy
        format.html { redirect_to socioeduk_comarcas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_comarca.errors.full_messages[0] if @socioeduk_comarca.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_comarca
      @socioeduk_comarca = Socioeduk::Comarca.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_comarca_params
        params.require(:socioeduk_comarca).permit(:nome)
    end
end
