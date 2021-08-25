# encoding: utf-8
class Socioeduk::SaudeJovemOcorrenciasController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovem_ocorrencia, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovem_ocorrencia").pluralize, :socioeduk_saude_jovem_ocorrencias_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovem_ocorrencia_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovem_ocorrencia_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovem_ocorrencia_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovem_ocorrencias = Socioeduk::SaudeJovemOcorrencia.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovem_ocorrencia = Socioeduk::SaudeJovemOcorrencia.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovem_ocorrencia = Socioeduk::SaudeJovemOcorrencia.new(socioeduk_saude_jovem_ocorrencia_params)

    respond_to do |format|
      if @socioeduk_saude_jovem_ocorrencia.save
        format.html { redirect_to socioeduk_saude_jovem_ocorrencias_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovem_ocorrencia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovem_ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovem_ocorrencia.update(socioeduk_saude_jovem_ocorrencia_params)
      redirect_to socioeduk_saude_jovem_ocorrencias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovem_ocorrencia.destroy
        format.html { redirect_to socioeduk_saude_jovem_ocorrencias_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovem_ocorrencia.errors.full_messages[0] if @socioeduk_saude_jovem_ocorrencia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovem_ocorrencia
      @socioeduk_saude_jovem_ocorrencia = Socioeduk::SaudeJovemOcorrencia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovem_ocorrencia_params
        params.require(:socioeduk_saude_jovem_ocorrencia).permit(:socioeduk_jovem_recepcao_id, :socioeduk_tipo_atendimento_id, :data, :observacao)
    end
end
