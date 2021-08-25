# encoding: utf-8
class Socioeduk::ComposicaoFamiliaresController < SocioedukApplicationController
  before_action :set_socioeduk_composicao_familiar, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_composicao_familiar").pluralize, :socioeduk_composicao_familiares_path
  add_breadcrumb "Detalhe", :socioeduk_composicao_familiar_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_composicao_familiar_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_composicao_familiar_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_composicao_familiares = Socioeduk::ComposicaoFamiliar.all
  end

  def show
  end

  def new
    @socioeduk_composicao_familiar = Socioeduk::ComposicaoFamiliar.new
  end

  def edit
  end

  def create
    @socioeduk_composicao_familiar = Socioeduk::ComposicaoFamiliar.new(socioeduk_composicao_familiar_params)

    respond_to do |format|
      if @socioeduk_composicao_familiar.save
        format.html { redirect_to socioeduk_composicao_familiares_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_composicao_familiar }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_composicao_familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_composicao_familiar.update(socioeduk_composicao_familiar_params)
      redirect_to socioeduk_composicao_familiares_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_composicao_familiar.destroy
        format.html { redirect_to socioeduk_composicao_familiares_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_composicao_familiar.errors.full_messages[0] if @socioeduk_composicao_familiar.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_composicao_familiar
      @socioeduk_composicao_familiar = Socioeduk::ComposicaoFamiliar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_composicao_familiar_params
        params.require(:socioeduk_composicao_familiar).permit(:descricao)
    end
end
