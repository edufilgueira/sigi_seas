# encoding: utf-8
class Socioeduk::LocalTratamentosController < SocioedukApplicationController
  before_action :set_socioeduk_local_tratamento, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_local_tratamento").pluralize, :socioeduk_local_tratamentos_path
  add_breadcrumb "Detalhe", :socioeduk_local_tratamento_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_local_tratamento_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_local_tratamento_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_local_tratamentos = Socioeduk::LocalTratamento.all
  end

  def show
  end

  def new
    @socioeduk_local_tratamento = Socioeduk::LocalTratamento.new
  end

  def edit
  end

  def create
    @socioeduk_local_tratamento = Socioeduk::LocalTratamento.new(socioeduk_local_tratamento_params)

    respond_to do |format|
      if @socioeduk_local_tratamento.save
        format.html { redirect_to socioeduk_local_tratamentos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_local_tratamento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_local_tratamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_local_tratamento.update(socioeduk_local_tratamento_params)
      redirect_to socioeduk_local_tratamentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_local_tratamento.destroy
        format.html { redirect_to socioeduk_local_tratamentos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_local_tratamento.errors.full_messages[0] if @socioeduk_local_tratamento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_local_tratamento
      @socioeduk_local_tratamento = Socioeduk::LocalTratamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_local_tratamento_params
        params.require(:socioeduk_local_tratamento).permit(:descricao, :status)
    end
end
