# encoding: utf-8
class Socioeduk::EscolaridadesController < SocioedukApplicationController
  before_action :set_socioeduk_escolaridade, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_escolaridade").pluralize, :socioeduk_escolaridades_path
  add_breadcrumb "Detalhe", :socioeduk_escolaridade_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_escolaridade_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_escolaridade_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_escolaridades = Socioeduk::Escolaridade.all
  end

  def show
  end

  def new
    @socioeduk_escolaridade = Socioeduk::Escolaridade.new
  end

  def edit
  end

  def create
    @socioeduk_escolaridade = Socioeduk::Escolaridade.new(socioeduk_escolaridade_params)

    respond_to do |format|
      if @socioeduk_escolaridade.save
        format.html { redirect_to socioeduk_escolaridades_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_escolaridade }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_escolaridade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_escolaridade.update(socioeduk_escolaridade_params)
      redirect_to socioeduk_escolaridades_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_escolaridade.destroy
        format.html { redirect_to socioeduk_escolaridades_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_escolaridade.errors.full_messages[0] if @socioeduk_escolaridade.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_escolaridade
      @socioeduk_escolaridade = Socioeduk::Escolaridade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_escolaridade_params
        params.require(:socioeduk_escolaridade).permit(:descricao)
    end
end
