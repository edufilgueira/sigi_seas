# encoding: utf-8
class Socioeduk::RendaFamiliaresController < SocioedukApplicationController
  before_action :set_socioeduk_renda_familiar, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_renda_familiar").pluralize, :socioeduk_renda_familiares_path
  add_breadcrumb "Detalhe", :socioeduk_renda_familiar_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_renda_familiar_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_renda_familiar_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_renda_familiares = Socioeduk::RendaFamiliar.all
  end

  def show
  end

  def new
    @socioeduk_renda_familiar = Socioeduk::RendaFamiliar.new
  end

  def edit
  end

  def create
    @socioeduk_renda_familiar = Socioeduk::RendaFamiliar.new(socioeduk_renda_familiar_params)

    respond_to do |format|
      if @socioeduk_renda_familiar.save
        format.html { redirect_to socioeduk_renda_familiares_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_renda_familiar }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_renda_familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_renda_familiar.update(socioeduk_renda_familiar_params)
      redirect_to socioeduk_renda_familiares_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_renda_familiar.destroy
        format.html { redirect_to socioeduk_renda_familiares_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_renda_familiar.errors.full_messages[0] if @socioeduk_renda_familiar.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_renda_familiar
      @socioeduk_renda_familiar = Socioeduk::RendaFamiliar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_renda_familiar_params
        params.require(:socioeduk_renda_familiar).permit(:descricao)
    end
end
