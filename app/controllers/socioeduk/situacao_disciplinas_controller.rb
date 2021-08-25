# encoding: utf-8
class Socioeduk::SituacaoDisciplinasController < SocioedukApplicationController
  before_action :set_socioeduk_situacao_disciplina, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_situacao_disciplina").pluralize, :socioeduk_situacao_disciplinas_path
  add_breadcrumb "Detalhe", :socioeduk_situacao_disciplina_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_situacao_disciplina_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_situacao_disciplina_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_situacao_disciplinas = Socioeduk::SituacaoDisciplina.all
  end

  def show
  end

  def new
    @socioeduk_situacao_disciplina = Socioeduk::SituacaoDisciplina.new
  end

  def edit
  end

  def create
    @socioeduk_situacao_disciplina = Socioeduk::SituacaoDisciplina.new(socioeduk_situacao_disciplina_params)

    respond_to do |format|
      if @socioeduk_situacao_disciplina.save
        format.html { redirect_to socioeduk_situacao_disciplinas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_situacao_disciplina }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_situacao_disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_situacao_disciplina.update(socioeduk_situacao_disciplina_params)
      redirect_to socioeduk_situacao_disciplinas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_situacao_disciplina.destroy
        format.html { redirect_to socioeduk_situacao_disciplinas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_situacao_disciplina.errors.full_messages[0] if @socioeduk_situacao_disciplina.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_situacao_disciplina
      @socioeduk_situacao_disciplina = Socioeduk::SituacaoDisciplina.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_situacao_disciplina_params
        params.require(:socioeduk_situacao_disciplina).permit(:descricao)
    end
end
