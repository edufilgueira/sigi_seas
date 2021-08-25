# encoding: utf-8
class Socioeduk::CondicaoFisicasController < SocioedukApplicationController
  before_action :set_socioeduk_condicao_fisica, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_condicao_fisica").pluralize, :socioeduk_condicao_fisicas_path
  add_breadcrumb "Detalhe", :socioeduk_condicao_fisica_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_condicao_fisica_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_condicao_fisica_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_condicao_fisicas = Socioeduk::CondicaoFisica.all
  end

  def show
  end

  def new
    @socioeduk_condicao_fisica = Socioeduk::CondicaoFisica.new
  end

  def edit
  end

  def create
    @socioeduk_condicao_fisica = Socioeduk::CondicaoFisica.new(socioeduk_condicao_fisica_params)

    respond_to do |format|
      if @socioeduk_condicao_fisica.save
        format.html { redirect_to socioeduk_condicao_fisicas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_condicao_fisica }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_condicao_fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_condicao_fisica.update(socioeduk_condicao_fisica_params)
      redirect_to socioeduk_condicao_fisicas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_condicao_fisica.destroy
        format.html { redirect_to socioeduk_condicao_fisicas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_condicao_fisica.errors.full_messages[0] if @socioeduk_condicao_fisica.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_condicao_fisica
      @socioeduk_condicao_fisica = Socioeduk::CondicaoFisica.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_condicao_fisica_params
        params.require(:socioeduk_condicao_fisica).permit(:descricao)
    end
end
