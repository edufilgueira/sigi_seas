# encoding: utf-8
class Socioeduk::SaudeJovensSubstanciasUtilizadasController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovens_substancias_utilizada, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovens_substancias_utilizada").pluralize, :socioeduk_saude_jovens_substancias_utilizadas_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovens_substancias_utilizada_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovens_substancias_utilizada_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovens_substancias_utilizada_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovens_substancias_utilizadas = Socioeduk::SaudeJovensSubstanciasUtilizada.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovens_substancias_utilizada = Socioeduk::SaudeJovensSubstanciasUtilizada.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovens_substancias_utilizada = Socioeduk::SaudeJovensSubstanciasUtilizada.new(socioeduk_saude_jovens_substancias_utilizada_params)

    respond_to do |format|
      if @socioeduk_saude_jovens_substancias_utilizada.save
        format.html { redirect_to socioeduk_saude_jovens_substancias_utilizadas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovens_substancias_utilizada }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovens_substancias_utilizada.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovens_substancias_utilizada.update(socioeduk_saude_jovens_substancias_utilizada_params)
      redirect_to socioeduk_saude_jovens_substancias_utilizadas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovens_substancias_utilizada.destroy
        format.html { redirect_to socioeduk_saude_jovens_substancias_utilizadas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovens_substancias_utilizada.errors.full_messages[0] if @socioeduk_saude_jovens_substancias_utilizada.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovens_substancias_utilizada
      @socioeduk_saude_jovens_substancias_utilizada = Socioeduk::SaudeJovensSubstanciasUtilizada.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovens_substancias_utilizada_params
        params.require(:socioeduk_saude_jovens_substancias_utilizada).permit(:socioeduk_saude_jovens_id, :socioeduk_entorpecente_id, :iniciou_com_idade, :parou_com_idade, :frequencia, :socioeduk_tipo_auto_consideracao_id, :realizou_tratamento, :socioeduk_tipo_tratamento_id)
    end
end
