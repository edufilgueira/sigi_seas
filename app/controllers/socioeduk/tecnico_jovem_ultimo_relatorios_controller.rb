# encoding: utf-8
class Socioeduk::TecnicoJovemUltimoRelatoriosController < SocioedukApplicationController
  before_action :set_socioeduk_tecnico_jovem_ultimo_relatorio, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tecnico_jovem_ultimo_relatorio").pluralize, :socioeduk_tecnico_jovem_ultimo_relatorios_path
  add_breadcrumb "Detalhe", :socioeduk_tecnico_jovem_ultimo_relatorio_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tecnico_jovem_ultimo_relatorio_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tecnico_jovem_ultimo_relatorio_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tecnico_jovem_ultimo_relatorios = Socioeduk::TecnicoJovemUltimoRelatorio.all
  end

  def show
  end

  def new
    @socioeduk_tecnico_jovem_ultimo_relatorio = Socioeduk::TecnicoJovemUltimoRelatorio.new
  end

  def edit
  end

  def create
    @socioeduk_tecnico_jovem_ultimo_relatorio = Socioeduk::TecnicoJovemUltimoRelatorio.new(socioeduk_tecnico_jovem_ultimo_relatorio_params)

    respond_to do |format|
      if @socioeduk_tecnico_jovem_ultimo_relatorio.save
        format.html { redirect_to socioeduk_tecnico_jovem_ultimo_relatorios_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tecnico_jovem_ultimo_relatorio }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tecnico_jovem_ultimo_relatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tecnico_jovem_ultimo_relatorio.update(socioeduk_tecnico_jovem_ultimo_relatorio_params)
      redirect_to socioeduk_tecnico_jovem_ultimo_relatorios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tecnico_jovem_ultimo_relatorio.destroy
        format.html { redirect_to socioeduk_tecnico_jovem_ultimo_relatorios_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tecnico_jovem_ultimo_relatorio.errors.full_messages[0] if @socioeduk_tecnico_jovem_ultimo_relatorio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tecnico_jovem_ultimo_relatorio
      @socioeduk_tecnico_jovem_ultimo_relatorio = Socioeduk::TecnicoJovemUltimoRelatorio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tecnico_jovem_ultimo_relatorio_params
        params.require(:socioeduk_tecnico_jovem_ultimo_relatorio).permit(:socioeduk_tecnico_jovem_id, :socioeduk_sugestao_relatorio_id, :data_inclusao, :socioeduk_tipo_retorno_id, :unidade_socioeducativa_inclusao_id, :foto, :anexo)
    end
end
