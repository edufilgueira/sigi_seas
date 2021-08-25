# encoding: utf-8
class Socioeduk::ArtigoInfracoesController < SocioedukApplicationController
  before_action :set_socioeduk_artigo_infracao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_artigo_infracao").pluralize, :socioeduk_artigo_infracoes_path
  add_breadcrumb "Detalhe", :socioeduk_artigo_infracao_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_artigo_infracao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_artigo_infracao_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_artigo_infracoes = Socioeduk::ArtigoInfracao.order(:descricao)
  end

  def show
  end

  def new
    @socioeduk_artigo_infracao = Socioeduk::ArtigoInfracao.new
  end

  def edit
  end

  def create
    @socioeduk_artigo_infracao = Socioeduk::ArtigoInfracao.new(socioeduk_artigo_infracao_params)

    respond_to do |format|
      if @socioeduk_artigo_infracao.save
        format.html { redirect_to socioeduk_artigo_infracoes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_artigo_infracao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_artigo_infracao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_artigo_infracao.update(socioeduk_artigo_infracao_params)
      redirect_to socioeduk_artigo_infracoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_artigo_infracao.destroy
        format.html { redirect_to socioeduk_artigo_infracoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_artigo_infracao.errors.full_messages[0] if @socioeduk_artigo_infracao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def buscar_por_id
    @socioeduk_artigo_infracao = Socioeduk::ArtigoInfracao.find(params[:id])
    render json: @socioeduk_artigo_infracao
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_artigo_infracao
      @socioeduk_artigo_infracao = Socioeduk::ArtigoInfracao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_artigo_infracao_params
        params.require(:socioeduk_artigo_infracao).permit(:descricao, :ponderacao)
    end
end
