# encoding: utf-8
class Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedidasController < SocioedukApplicationController
  before_action :set_socioeduk_pedagogico_jovem_disciplina_escolaridade_medida, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_pedagogico_jovem_disciplina_escolaridade_medida").pluralize, :socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas_path
  add_breadcrumb "Detalhe", :socioeduk_pedagogico_jovem_disciplina_escolaridade_medida_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_pedagogico_jovem_disciplina_escolaridade_medida_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_pedagogico_jovem_disciplina_escolaridade_medida_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas = Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedida.all
  end

  def show
  end

  def new
    @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida = Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedida.new
  end

  def edit
  end

  def create
    @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida = Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedida.new(socioeduk_pedagogico_jovem_disciplina_escolaridade_medida_params)

    respond_to do |format|
      if @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida.save
        format.html { redirect_to socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida.update(socioeduk_pedagogico_jovem_disciplina_escolaridade_medida_params)
      redirect_to socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida.destroy
        format.html { redirect_to socioeduk_pedagogico_jovem_disciplina_escolaridade_medidas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida.errors.full_messages[0] if @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_pedagogico_jovem_disciplina_escolaridade_medida
      @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida = Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedida.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_pedagogico_jovem_disciplina_escolaridade_medida_params
        params.require(:socioeduk_pedagogico_jovem_disciplina_escolaridade_medida).permit(:socioeduk_pedagogico_jovem_escolaridade_medida_id, :socioeduk_escolaridade_id, :socioeduk_situacao_disciplina_id, :data_situacao, :observacao)
    end
end
