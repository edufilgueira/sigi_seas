# encoding: utf-8
class Socioeduk::MetodoContraceptivosController < SocioedukApplicationController
  before_action :set_socioeduk_metodo_contraceptivo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_metodo_contraceptivo").pluralize, :socioeduk_metodo_contraceptivos_path
  add_breadcrumb "Detalhe", :socioeduk_metodo_contraceptivo_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_metodo_contraceptivo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_metodo_contraceptivo_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_metodo_contraceptivos = Socioeduk::MetodoContraceptivo.all
  end

  def show
  end

  def new
    @socioeduk_metodo_contraceptivo = Socioeduk::MetodoContraceptivo.new
  end

  def edit
  end

  def create
    @socioeduk_metodo_contraceptivo = Socioeduk::MetodoContraceptivo.new(socioeduk_metodo_contraceptivo_params)

    respond_to do |format|
      if @socioeduk_metodo_contraceptivo.save
        format.html { redirect_to socioeduk_metodo_contraceptivos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_metodo_contraceptivo }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_metodo_contraceptivo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_metodo_contraceptivo.update(socioeduk_metodo_contraceptivo_params)
      redirect_to socioeduk_metodo_contraceptivos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_metodo_contraceptivo.destroy
        format.html { redirect_to socioeduk_metodo_contraceptivos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_metodo_contraceptivo.errors.full_messages[0] if @socioeduk_metodo_contraceptivo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_metodo_contraceptivo
      @socioeduk_metodo_contraceptivo = Socioeduk::MetodoContraceptivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_metodo_contraceptivo_params
        params.require(:socioeduk_metodo_contraceptivo).permit(:descricao, :ativo)
    end
end
