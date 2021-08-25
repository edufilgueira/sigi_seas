# encoding: utf-8
class Socioeduk::VisitantesController < SocioedukApplicationController
  before_action :set_socioeduk_visitante, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_visitante").pluralize, :socioeduk_visitantes_path
  add_breadcrumb "Detalhe", :socioeduk_visitante_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_visitante_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_visitante_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_visitantes = Socioeduk::Visitante.joins(:socioeduk_jovem).select('socioeduk_jovens.*', 'socioeduk_jovens.nome AS nome', 'socioeduk_visitantes.numero', 'socioeduk_visitantes.uf_documento', 'socioeduk_visitantes.observacao', 'socioeduk_visitantes.nome AS visitante' )

    @q = @socioeduk_visitantes.ransack(params[:q])
    @socioeduk_visitantes = @q.result
  end

  def show
  end

  def new
    @socioeduk_visitante = Socioeduk::Visitante.new
    @socioeduk_visitante.socioeduk_visitante_jovens.build
  end

  def edit
  end

  def create
    @socioeduk_visitante = Socioeduk::Visitante.new(socioeduk_visitante_params)

    respond_to do |format|
      if @socioeduk_visitante.save
        format.html { redirect_to socioeduk_visitantes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_visitante }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_visitante.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_visitante.update(socioeduk_visitante_params)
      redirect_to socioeduk_visitantes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_visitante.destroy
        format.html { redirect_to socioeduk_visitantes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_visitante.errors.full_messages[0] if @socioeduk_visitante.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_visitante
      @socioeduk_visitante = Socioeduk::Visitante.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_visitante_params
        params.require(:socioeduk_visitante).permit(:nome, :socioeduk_jovem_id, :socioeduk_tipo_documento_id, :numero, :uf_documento, :foto, :observacao, :anexo,
        socioeduk_visitante_jovens_attributes: %i[socioeduk_visitante_id socioeduk_jovem_id socioeduk_tipo_parentesco_id id _destroy])
    end
end
