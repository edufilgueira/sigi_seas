# encoding: utf-8
class Socioeduk::TipoOcorrenciasController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_ocorrencia, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_ocorrencia").pluralize, :socioeduk_tipo_ocorrencias_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_ocorrencia_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_ocorrencia_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_ocorrencia_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_ocorrencias = Socioeduk::TipoOcorrencia.all
  end

  def show
  end

  def new
    @socioeduk_tipo_ocorrencia = Socioeduk::TipoOcorrencia.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_ocorrencia = Socioeduk::TipoOcorrencia.new(socioeduk_tipo_ocorrencia_params)

    respond_to do |format|
      if @socioeduk_tipo_ocorrencia.save
        format.html { redirect_to socioeduk_tipo_ocorrencias_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_ocorrencia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_ocorrencia.update(socioeduk_tipo_ocorrencia_params)
      redirect_to socioeduk_tipo_ocorrencias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_ocorrencia.destroy
        format.html { redirect_to socioeduk_tipo_ocorrencias_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_ocorrencia.errors.full_messages[0] if @socioeduk_tipo_ocorrencia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def listar_ocorrencias
    # tipo_ocorrencia = params[:socioeduk_jovem_ocorrencia][:socioeduk_tipo_ocorrencia_id]
    tipo_ocorrencia = params[:tipo_ocorrencia_id]
    @ocorrencias = Socioeduk::Ocorrencia.where(socioeduk_tipo_ocorrencia_id: tipo_ocorrencia)
    render json: @ocorrencias, adapter: :json_api
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_ocorrencia
      @socioeduk_tipo_ocorrencia = Socioeduk::TipoOcorrencia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_ocorrencia_params
        params.require(:socioeduk_tipo_ocorrencia).permit(:descricao)
    end
end
