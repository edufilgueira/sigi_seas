# encoding: utf-8
class Socioeduk::ArtigoParagrafosController < SocioedukApplicationController
  before_action :set_socioeduk_artigo_paragrafo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_artigo_paragrafo").pluralize, :socioeduk_artigo_paragrafos_path
  add_breadcrumb "Detalhe", :socioeduk_artigo_paragrafo_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_artigo_paragrafo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_artigo_paragrafo_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_artigo_paragrafos = Socioeduk::ArtigoParagrafo.all
  end

  def show
  end

  def new
    @socioeduk_artigo_paragrafo = Socioeduk::ArtigoParagrafo.new
  end

  def edit
  end

  def create
    @socioeduk_artigo_paragrafo = Socioeduk::ArtigoParagrafo.new(socioeduk_artigo_paragrafo_params)

    respond_to do |format|
      if @socioeduk_artigo_paragrafo.save
        format.html { redirect_to socioeduk_artigo_paragrafos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_artigo_paragrafo }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_artigo_paragrafo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_artigo_paragrafo.update(socioeduk_artigo_paragrafo_params)
      redirect_to socioeduk_artigo_paragrafos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_artigo_paragrafo.destroy
        format.html { redirect_to socioeduk_artigo_paragrafos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_artigo_paragrafo.errors.full_messages[0] if @socioeduk_artigo_paragrafo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_artigo_paragrafo
      @socioeduk_artigo_paragrafo = Socioeduk::ArtigoParagrafo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_artigo_paragrafo_params
        params.require(:socioeduk_artigo_paragrafo).permit(:socioeduk_artigo_infracao_id, :descricao)
    end
end
