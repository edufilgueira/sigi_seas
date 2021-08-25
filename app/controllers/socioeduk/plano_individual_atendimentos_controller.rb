# encoding: utf-8
class Socioeduk::PlanoIndividualAtendimentosController < SocioedukApplicationController
  before_action :set_socioeduk_plano_individual_atendimento, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_plano_individual_atendimento").pluralize, :socioeduk_plano_individual_atendimentos_path
  add_breadcrumb "Detalhe", :socioeduk_plano_individual_atendimento_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_plano_individual_atendimento_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_plano_individual_atendimento_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_plano_individual_atendimentos = Socioeduk::PlanoIndividualAtendimento.all
  end

  def show
  end

  def new
    @socioeduk_plano_individual_atendimento = Socioeduk::PlanoIndividualAtendimento.new
  end

  def edit
  end

  def create
    @socioeduk_plano_individual_atendimento = Socioeduk::PlanoIndividualAtendimento.new(socioeduk_plano_individual_atendimento_params)

    respond_to do |format|
      if @socioeduk_plano_individual_atendimento.save
        format.html { redirect_to socioeduk_plano_individual_atendimentos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_plano_individual_atendimento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_plano_individual_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_plano_individual_atendimento.update(socioeduk_plano_individual_atendimento_params)
      redirect_to socioeduk_plano_individual_atendimentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_plano_individual_atendimento.destroy
        format.html { redirect_to socioeduk_plano_individual_atendimentos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_plano_individual_atendimento.errors.full_messages[0] if @socioeduk_plano_individual_atendimento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_plano_individual_atendimento
      @socioeduk_plano_individual_atendimento = Socioeduk::PlanoIndividualAtendimento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_plano_individual_atendimento_params
        params.require(:socioeduk_plano_individual_atendimento).permit(:descricao)
    end
end
