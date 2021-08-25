# encoding: utf-8
class Socioeduk::SaudeJovemAtendimentosController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovem_atendimento, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovem_atendimento").pluralize, :socioeduk_saude_jovem_atendimentos_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovem_atendimento_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovem_atendimento_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovem_atendimento_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovem_atendimentos = Socioeduk::SaudeJovemAtendimento.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovem_atendimento = Socioeduk::SaudeJovemAtendimento.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovem_atendimento = Socioeduk::SaudeJovemAtendimento.new(socioeduk_saude_jovem_atendimento_params)

    respond_to do |format|
      if @socioeduk_saude_jovem_atendimento.save
        format.html { redirect_to socioeduk_saude_jovem_atendimentos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovem_atendimento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovem_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovem_atendimento.update(socioeduk_saude_jovem_atendimento_params)
      redirect_to socioeduk_saude_jovem_atendimentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovem_atendimento.destroy
        format.html { redirect_to socioeduk_saude_jovem_atendimentos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovem_atendimento.errors.full_messages[0] if @socioeduk_saude_jovem_atendimento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovem_atendimento
      @socioeduk_saude_jovem_atendimento = Socioeduk::SaudeJovemAtendimento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovem_atendimento_params
        params.require(:socioeduk_saude_jovem_atendimento).permit(:socioeduk_saude_jovem_id, :socioeduk_tipo_atendimento_id, :data_atendimento, :local_atendimento, :outro_local_atendimento, :socioeduk_cid_id, :diagnostico, :nome_profissional, :descricao_atendimento)
    end
end
