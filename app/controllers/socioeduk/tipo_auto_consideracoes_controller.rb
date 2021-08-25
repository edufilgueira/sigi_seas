# encoding: utf-8
class Socioeduk::TipoAutoConsideracoesController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_auto_consideracao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_auto_consideracao").pluralize, :socioeduk_tipo_auto_consideracoes_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_auto_consideracao_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_auto_consideracao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_auto_consideracao_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_auto_consideracoes = Socioeduk::TipoAutoConsideracao.all
  end

  def show
  end

  def new
    @socioeduk_tipo_auto_consideracao = Socioeduk::TipoAutoConsideracao.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_auto_consideracao = Socioeduk::TipoAutoConsideracao.new(socioeduk_tipo_auto_consideracao_params)

    respond_to do |format|
      if @socioeduk_tipo_auto_consideracao.save
        format.html { redirect_to socioeduk_tipo_auto_consideracoes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_auto_consideracao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_auto_consideracao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_auto_consideracao.update(socioeduk_tipo_auto_consideracao_params)
      redirect_to socioeduk_tipo_auto_consideracoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_auto_consideracao.destroy
        format.html { redirect_to socioeduk_tipo_auto_consideracoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_auto_consideracao.errors.full_messages[0] if @socioeduk_tipo_auto_consideracao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_auto_consideracao
      @socioeduk_tipo_auto_consideracao = Socioeduk::TipoAutoConsideracao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_auto_consideracao_params
        params.require(:socioeduk_tipo_auto_consideracao).permit(:descricao)
    end
end
