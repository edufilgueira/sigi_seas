# encoding: utf-8
class Socioeduk::QuartosController < SocioedukApplicationController
  before_action :set_socioeduk_quarto, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_quarto").pluralize, :socioeduk_quartos_path
  add_breadcrumb "Detalhe", :socioeduk_quarto_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_quarto_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_quarto_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_quartos = Socioeduk::Quarto.all
  end

  def show
  end

  def new
    @socioeduk_quarto = Socioeduk::Quarto.new
  end

  def edit
  end

  def create
    @socioeduk_quarto = Socioeduk::Quarto.new(socioeduk_quarto_params)
  
    respond_to do |format|
      if @socioeduk_quarto.save
        format.html { redirect_to socioeduk_quartos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_quarto }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_quarto.update(socioeduk_quarto_params)
      redirect_to socioeduk_quartos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_quarto.destroy
        format.html { redirect_to socioeduk_quartos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_quarto.errors.full_messages[0] if @socioeduk_quarto.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_quarto
      @socioeduk_quarto = Socioeduk::Quarto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_quarto_params
        params.require(:socioeduk_quarto).permit(:socioeduk_bloco_id, :descricao)
    end
end
