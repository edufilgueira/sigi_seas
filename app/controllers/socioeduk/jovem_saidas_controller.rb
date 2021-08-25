# encoding: utf-8
class Socioeduk::JovemSaidasController < SocioedukApplicationController
  before_action :set_socioeduk_jovem_saida, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_jovem_saida").pluralize, :socioeduk_jovem_saidas_path
  add_breadcrumb "Detalhe", :socioeduk_jovem_saida_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_jovem_saida_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_jovem_saida_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_jovem_saidas = Socioeduk::JovemSaida.joins(:socioeduk_jovem).select('socioeduk_jovens.*', 'socioeduk_jovens.nome AS nome', 'socioeduk_jovem_saidas.destino', 'socioeduk_jovem_saidas.data_hora', 'socioeduk_jovem_saidas.observacao', 'socioeduk_jovem_saidas.observacao')


    @q = @socioeduk_jovem_saidas.ransack(params[:q])
    @socioeduk_jovem_saidas = @q.result
  end

  def show
  end

  def new
    @socioeduk_jovem_saida = Socioeduk::JovemSaida.new
  end

  def edit
  end

  def create
    @socioeduk_jovem_saida = Socioeduk::JovemSaida.new(socioeduk_jovem_saida_params)

    respond_to do |format|
      if @socioeduk_jovem_saida.save
        format.html { redirect_to socioeduk_jovem_saidas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_jovem_saida }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem_saida.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_jovem_saida.update(socioeduk_jovem_saida_params)
      redirect_to socioeduk_jovem_saidas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem_saida.destroy
        format.html { redirect_to socioeduk_jovem_saidas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_jovem_saida.errors.full_messages[0] if @socioeduk_jovem_saida.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_jovem_saida
      @socioeduk_jovem_saida = Socioeduk::JovemSaida.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_jovem_saida_params
        params.require(:socioeduk_jovem_saida).permit(:socioeduk_jovem_id, :data_hora, :destino, :observacao, :text)
    end
end
