# encoding: utf-8
class Socioeduk::CircunstanciasController < SocioedukApplicationController
  before_action :set_socioeduk_circunstancia, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_circunstancia").pluralize, :socioeduk_circunstancias_path
  add_breadcrumb "Detalhe", :socioeduk_circunstancia_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_circunstancia_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_circunstancia_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_circunstancias = Socioeduk::Circunstancia.all
  end

  def shows
  end

  def new
    @socioeduk_circunstancia = Socioeduk::Circunstancia.new
  end

  def edit
  end

  def create
    @socioeduk_circunstancia = Socioeduk::Circunstancia.new(socioeduk_circunstancia_params)

    respond_to do |format|
      if @socioeduk_circunstancia.save
        format.html { redirect_to socioeduk_circunstancias_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_circunstancia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_circunstancia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_circunstancia.update(socioeduk_circunstancia_params)
      redirect_to socioeduk_circunstancias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_circunstancia.destroy
        format.html { redirect_to socioeduk_circunstancias_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_circunstancia.errors.full_messages[0] if @socioeduk_circunstancia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_circunstancia
      @socioeduk_circunstancia = Socioeduk::Circunstancia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_circunstancia_params
        params.require(:socioeduk_circunstancia).permit(:descricao)
    end
end
