# encoding: utf-8
class Socioeduk::PedagogicoJovemDisciplinaEscolaridadesController < SocioedukApplicationController
  before_action :set_socioeduk_pedagogico_jovem_disciplina_escolaridade, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_pedagogico_jovem_disciplina_escolaridade").pluralize, :socioeduk_pedagogico_jovem_disciplina_escolaridades_path
  add_breadcrumb "Detalhe", :socioeduk_pedagogico_jovem_disciplina_escolaridade_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_pedagogico_jovem_disciplina_escolaridade_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_pedagogico_jovem_disciplina_escolaridade_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_pedagogico_jovem_disciplina_escolaridades = Socioeduk::PedagogicoJovemDisciplinaEscolaridade.all
  end

  def show
  end

  def new
    @socioeduk_pedagogico_jovem_disciplina_escolaridade = Socioeduk::PedagogicoJovemDisciplinaEscolaridade.new
  end

  def edit
  end

  def create
    @socioeduk_pedagogico_jovem_disciplina_escolaridade = Socioeduk::PedagogicoJovemDisciplinaEscolaridade.new(socioeduk_pedagogico_jovem_disciplina_escolaridade_params)

    respond_to do |format|
      if @socioeduk_pedagogico_jovem_disciplina_escolaridade.save
        format.html { redirect_to socioeduk_pedagogico_jovem_disciplina_escolaridades_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_pedagogico_jovem_disciplina_escolaridade }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_pedagogico_jovem_disciplina_escolaridade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_pedagogico_jovem_disciplina_escolaridade.update(socioeduk_pedagogico_jovem_disciplina_escolaridade_params)
      redirect_to socioeduk_pedagogico_jovem_disciplina_escolaridades_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_pedagogico_jovem_disciplina_escolaridade.destroy
        format.html { redirect_to socioeduk_pedagogico_jovem_disciplina_escolaridades_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_pedagogico_jovem_disciplina_escolaridade.errors.full_messages[0] if @socioeduk_pedagogico_jovem_disciplina_escolaridade.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_pedagogico_jovem_disciplina_escolaridade
      @socioeduk_pedagogico_jovem_disciplina_escolaridade = Socioeduk::PedagogicoJovemDisciplinaEscolaridade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_pedagogico_jovem_disciplina_escolaridade_params
        params.require(:socioeduk_pedagogico_jovem_disciplina_escolaridade).permit(:pedagogico_jovem_id, :socioeduk_disciplina_escolaridade_id, :socioeduk_situacao_disciplina_id, :data_conclusao, :observacao)
    end
end
