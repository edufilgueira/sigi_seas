# encoding: utf-8
class BairrosController < SocioedukApplicationController
  before_action :set_bairro, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.bairro").pluralize, :bairros_path
  add_breadcrumb "Detalhe", :bairro_path, only: [:show]
  add_breadcrumb "Novo", :new_bairro_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_bairro_path, only: [:edit, :update]


  respond_to :html
  def index
    @bairros = Bairro.all
  end

  def show
  end

  def new
    @bairro = Bairro.new
  end

  def edit
  end

  def create
    @bairro = Bairro.new(bairro_params)

    respond_to do |format|
      if @bairro.save
        format.html { redirect_to bairros_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @bairro }
      else
        format.html { render :new }
        format.json { render json: @bairro.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @bairro.update(bairro_params)
      redirect_to bairros_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @bairro.destroy
        format.html { redirect_to bairros_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @bairro.errors.full_messages[0] if @bairro.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bairro
      @bairro = Bairro.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bairro_params
        params.require(:bairro).permit(:cidade_id, :nome)
    end
end
