# encoding: utf-8
class Socioeduk::BlocosController < SocioedukApplicationController
  before_action :set_socioeduk_bloco, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_bloco").pluralize, :socioeduk_blocos_path
  add_breadcrumb "Detalhe", :socioeduk_bloco_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_bloco_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_bloco_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_blocos = Socioeduk::Bloco.all
  end

  def show
  end

  def new
    @socioeduk_bloco = Socioeduk::Bloco.new
  end

  def edit
  end

  def create
    @socioeduk_bloco = Socioeduk::Bloco.new(socioeduk_bloco_params)

    respond_to do |format|
      if @socioeduk_bloco.save

        format.html { redirect_to socioeduk_blocos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_bloco }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_bloco.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_bloco.update(socioeduk_bloco_params)
      redirect_to socioeduk_blocos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_bloco.destroy
        format.html { redirect_to socioeduk_blocos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_bloco.errors.full_messages[0] if @socioeduk_bloco.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_bloco
      @socioeduk_bloco = Socioeduk::Bloco.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_bloco_params
        params.require(:socioeduk_bloco).permit(:unidade_socioeducativa_id, :descricao)
    end
end
