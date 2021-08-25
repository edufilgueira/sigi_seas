# encoding: utf-8
class Socioeduk::ProcessoAdvogadosController < SocioedukApplicationController
  before_action :set_socioeduk_processo_advogado, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_processo_advogado").pluralize, :socioeduk_processo_advogados_path
  add_breadcrumb "Detalhe", :socioeduk_processo_advogado_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_processo_advogado_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_processo_advogado_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_processo_advogados = Socioeduk::ProcessoAdvogado.all
  end

  def show
  end

  def new
    @socioeduk_processo_advogado = Socioeduk::ProcessoAdvogado.new
  end

  def edit
  end

  def create
    @socioeduk_processo_advogado = Socioeduk::ProcessoAdvogado.new(socioeduk_processo_advogado_params)

    respond_to do |format|
      if @socioeduk_processo_advogado.save
        format.html { redirect_to socioeduk_processo_advogados_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_processo_advogado }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_processo_advogado.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_processo_advogado.update(socioeduk_processo_advogado_params)
      redirect_to socioeduk_processo_advogados_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_processo_advogado.destroy
        format.html { redirect_to socioeduk_processo_advogados_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_processo_advogado.errors.full_messages[0] if @socioeduk_processo_advogado.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_processo_advogado
      @socioeduk_processo_advogado = Socioeduk::ProcessoAdvogado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_processo_advogado_params
        params.require(:socioeduk_processo_advogado).permit(:socioeduk_processo_id, :nome, :numero, :uf_oab, :defensor_publico, :unidade_socioeducativa_id)
    end
end
