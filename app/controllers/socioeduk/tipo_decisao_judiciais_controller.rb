# encoding: utf-8
class Socioeduk::TipoDecisaoJudiciaisController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_decisao_judicial, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_decisao_judicial").pluralize, :socioeduk_tipo_decisao_judiciais_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_decisao_judicial_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_decisao_judicial_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_decisao_judicial_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_decisao_judiciais = Socioeduk::TipoDecisaoJudicial.all
  end

  def show
  end

  def new
    @socioeduk_tipo_decisao_judicial = Socioeduk::TipoDecisaoJudicial.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_decisao_judicial = Socioeduk::TipoDecisaoJudicial.new(socioeduk_tipo_decisao_judicial_params)

    respond_to do |format|
      if @socioeduk_tipo_decisao_judicial.save
        format.html { redirect_to socioeduk_tipo_decisao_judiciais_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_decisao_judicial }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_decisao_judicial.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_decisao_judicial.update(socioeduk_tipo_decisao_judicial_params)
      redirect_to socioeduk_tipo_decisao_judiciais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_decisao_judicial.destroy
        format.html { redirect_to socioeduk_tipo_decisao_judiciais_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_decisao_judicial.errors.full_messages[0] if @socioeduk_tipo_decisao_judicial.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_decisao_judicial
      @socioeduk_tipo_decisao_judicial = Socioeduk::TipoDecisaoJudicial.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_decisao_judicial_params
        params.require(:socioeduk_tipo_decisao_judicial).permit(:descricao)
    end
end
