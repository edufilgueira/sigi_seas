# encoding: utf-8
class Socioeduk::TipoGuiaExecucoesController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_guia_execucao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_guia_execucao").pluralize, :socioeduk_tipo_guia_execucoes_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_guia_execucao_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_guia_execucao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_guia_execucao_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_guia_execucoes = Socioeduk::TipoGuiaExecucao.all
  end

  def show
  end

  def new
    @socioeduk_tipo_guia_execucao = Socioeduk::TipoGuiaExecucao.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_guia_execucao = Socioeduk::TipoGuiaExecucao.new(socioeduk_tipo_guia_execucao_params)

    respond_to do |format|
      if @socioeduk_tipo_guia_execucao.save
        format.html { redirect_to socioeduk_tipo_guia_execucoes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_guia_execucao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_guia_execucao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_guia_execucao.update(socioeduk_tipo_guia_execucao_params)
      redirect_to socioeduk_tipo_guia_execucoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_guia_execucao.destroy
        format.html { redirect_to socioeduk_tipo_guia_execucoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_guia_execucao.errors.full_messages[0] if @socioeduk_tipo_guia_execucao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_guia_execucao
      @socioeduk_tipo_guia_execucao = Socioeduk::TipoGuiaExecucao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_guia_execucao_params
        params.require(:socioeduk_tipo_guia_execucao).permit(:descricao)
    end
end
