# encoding: utf-8
class Socioeduk::OcorrenciasController < SocioedukApplicationController
  before_action :set_socioeduk_ocorrencia, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_ocorrencia").pluralize, :socioeduk_ocorrencias_path
  add_breadcrumb "Detalhe", :socioeduk_ocorrencia_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_ocorrencia_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_ocorrencia_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_ocorrencias = Socioeduk::Ocorrencia.all
  end

  def show
  end

  def new
    @socioeduk_ocorrencia = Socioeduk::Ocorrencia.new
  end

  def edit
  end

  def create
    @socioeduk_ocorrencia = Socioeduk::Ocorrencia.new(socioeduk_ocorrencia_params)

    respond_to do |format|
      if @socioeduk_ocorrencia.save
        format.html { redirect_to socioeduk_ocorrencias_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_ocorrencia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_ocorrencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_ocorrencia.update(socioeduk_ocorrencia_params)
      redirect_to socioeduk_ocorrencias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_ocorrencia.destroy
        format.html { redirect_to socioeduk_ocorrencias_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_ocorrencia.errors.full_messages[0] if @socioeduk_ocorrencia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_ocorrencia
      @socioeduk_ocorrencia = Socioeduk::Ocorrencia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_ocorrencia_params
        params.require(:socioeduk_ocorrencia).permit(:nome, :descricao, :tipo_ocorrencia_id)
    end
end
