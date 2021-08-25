# encoding: utf-8
class Socioeduk::SituacaoCumprimentosController < SocioedukApplicationController
  before_action :set_socioeduk_situacao_cumprimento, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_situacao_cumprimento").pluralize, :socioeduk_situacao_cumprimentos_path
  add_breadcrumb "Detalhe", :socioeduk_situacao_cumprimento_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_situacao_cumprimento_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_situacao_cumprimento_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_situacao_cumprimentos = Socioeduk::SituacaoCumprimento.all
  end

  def show
  end

  def new
    @socioeduk_situacao_cumprimento = Socioeduk::SituacaoCumprimento.new
  end

  def edit
  end

  def create
    @socioeduk_situacao_cumprimento = Socioeduk::SituacaoCumprimento.new(socioeduk_situacao_cumprimento_params)

    respond_to do |format|
      if @socioeduk_situacao_cumprimento.save
        format.html { redirect_to socioeduk_situacao_cumprimentos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_situacao_cumprimento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_situacao_cumprimento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_situacao_cumprimento.update(socioeduk_situacao_cumprimento_params)
      redirect_to socioeduk_situacao_cumprimentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_situacao_cumprimento.destroy
        format.html { redirect_to socioeduk_situacao_cumprimentos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_situacao_cumprimento.errors.full_messages[0] if @socioeduk_situacao_cumprimento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_situacao_cumprimento
      @socioeduk_situacao_cumprimento = Socioeduk::SituacaoCumprimento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_situacao_cumprimento_params
        params.require(:socioeduk_situacao_cumprimento).permit(:descricao)
    end
end
