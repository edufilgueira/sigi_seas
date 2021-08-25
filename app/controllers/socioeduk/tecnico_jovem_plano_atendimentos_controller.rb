# encoding: utf-8
class Socioeduk::TecnicoJovemPlanoAtendimentosController < SocioedukApplicationController
  before_action :set_socioeduk_tecnico_jovem_plano_atendimento, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tecnico_jovem_plano_atendimento").pluralize, :socioeduk_tecnico_jovem_plano_atendimentos_path
  add_breadcrumb "Detalhe", :socioeduk_tecnico_jovem_plano_atendimento_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tecnico_jovem_plano_atendimento_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tecnico_jovem_plano_atendimento_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tecnico_jovem_plano_atendimentos = Socioeduk::TecnicoJovemPlanoAtendimento.all
  end

  def show
  end

  def new
    @socioeduk_tecnico_jovem_plano_atendimento = Socioeduk::TecnicoJovemPlanoAtendimento.new
  end

  def edit
  end

  def create
    @socioeduk_tecnico_jovem_plano_atendimento = Socioeduk::TecnicoJovemPlanoAtendimento.new(socioeduk_tecnico_jovem_plano_atendimento_params)

    respond_to do |format|
      if @socioeduk_tecnico_jovem_plano_atendimento.save
        format.html { redirect_to socioeduk_tecnico_jovem_plano_atendimentos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tecnico_jovem_plano_atendimento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tecnico_jovem_plano_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tecnico_jovem_plano_atendimento.update(socioeduk_tecnico_jovem_plano_atendimento_params)
      redirect_to socioeduk_tecnico_jovem_plano_atendimentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tecnico_jovem_plano_atendimento.destroy
        format.html { redirect_to socioeduk_tecnico_jovem_plano_atendimentos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tecnico_jovem_plano_atendimento.errors.full_messages[0] if @socioeduk_tecnico_jovem_plano_atendimento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tecnico_jovem_plano_atendimento
      @socioeduk_tecnico_jovem_plano_atendimento = Socioeduk::TecnicoJovemPlanoAtendimento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tecnico_jovem_plano_atendimento_params
        params.require(:socioeduk_tecnico_jovem_plano_atendimento).permit(:tecnico_jovem_id, :data_inclusao, :unidade_socioeducativa_inclusao_id, :anexo)
    end
end
