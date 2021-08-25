# encoding: utf-8
class Socioeduk::JovemOcorrenciasController < SocioedukApplicationController
  before_action :set_socioeduk_jovem_ocorrencia, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_jovem_ocorrencia").pluralize, :socioeduk_jovem_ocorrencias_path
  add_breadcrumb "Detalhe", :socioeduk_jovem_ocorrencia_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_jovem_ocorrencia_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_jovem_ocorrencia_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_jovem_ocorrencias = Socioeduk::JovemOcorrencia.joins(:socioeduk_jovem, :socioeduk_tipo_ocorrencia ).select('socioeduk_jovens.*', 'socioeduk_jovens.nome AS nome', 'socioeduk_jovem_ocorrencias.data_hora', 'socioeduk_jovem_ocorrencias.descricao', 'socioeduk_tipo_ocorrencias.id AS tipo_ocorrencia' )


    @q = @socioeduk_jovem_ocorrencias.ransack(params[:q])
    @socioeduk_jovem_ocorrencias = @q.result
  
  end

  def show
  end

  def new
    @socioeduk_jovem_ocorrencia = Socioeduk::JovemOcorrencia.new
  end

  def edit
  end

  def create
    @socioeduk_jovem_ocorrencia = Socioeduk::JovemOcorrencia.new(socioeduk_jovem_ocorrencia_params)

    respond_to do |format|
      if @socioeduk_jovem_ocorrencia.save
        format.html { redirect_to socioeduk_jovem_ocorrencias_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_jovem_ocorrencia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem_ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_jovem_ocorrencia.update(socioeduk_jovem_ocorrencia_params)
      redirect_to socioeduk_jovem_ocorrencias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem_ocorrencia.destroy
        format.html { redirect_to socioeduk_jovem_ocorrencias_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_jovem_ocorrencia.errors.full_messages[0] if @socioeduk_jovem_ocorrencia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_jovem_ocorrencia
      @socioeduk_jovem_ocorrencia = Socioeduk::JovemOcorrencia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_jovem_ocorrencia_params
        params.require(:socioeduk_jovem_ocorrencia).permit(:socioeduk_jovem_id, :socioeduk_tipo_ocorrencia_id, :data_hora, :descricao)
    end
end
