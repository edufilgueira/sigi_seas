# encoding: utf-8
class Socioeduk::AlojamentoJovensController < SocioedukApplicationController
  before_action :set_socioeduk_alojamento_jovem, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_alojamento_jovem").pluralize, :socioeduk_alojamento_jovens_path
  add_breadcrumb "Detalhe", :socioeduk_alojamento_jovem_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_alojamento_jovem_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_alojamento_jovem_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_alojamento_jovens = Socioeduk::AlojamentoJovem.joins(:socioeduk_jovem, :unidade_socioeducativa, :socioeduk_bloco).select('socioeduk_jovens.*', 'socioeduk_jovens.nome AS nome', 'socioeduk_alojamento_jovens.unidade_socioeducativa_id', 'socioeduk_alojamento_jovens.socioeduk_bloco_id', 'socioeduk_alojamento_jovens.socioeduk_quarto_id')

    @q = @socioeduk_alojamento_jovens.ransack(params[:q])
    @socioeduk_alojamento_jovens = @q.result
  end

  def show
  end

  def new
    @socioeduk_alojamento_jovem = Socioeduk::AlojamentoJovem.new
  end

  def edit
  end

  def create
    @socioeduk_alojamento_jovem = Socioeduk::AlojamentoJovem.new(socioeduk_alojamento_jovem_params)

    respond_to do |format|
      if @socioeduk_alojamento_jovem.save
        format.html { redirect_to socioeduk_alojamento_jovens_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_alojamento_jovem }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_alojamento_jovem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_alojamento_jovem.update(socioeduk_alojamento_jovem_params)
      redirect_to socioeduk_alojamento_jovens_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_alojamento_jovem.destroy
        format.html { redirect_to socioeduk_alojamento_jovens_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_alojamento_jovem.errors.full_messages[0] if @socioeduk_alojamento_jovem.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_alojamento_jovem
      @socioeduk_alojamento_jovem = Socioeduk::AlojamentoJovem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_alojamento_jovem_params
        params.require(:socioeduk_alojamento_jovem).permit(:socioeduk_jovem_id, :unidade_socioeducativa_id, :socioeduk_bloco_id, :socioeduk_quarto_id, 
          :tamanho_roupa, :tamanho_cacaldo, :numero_kit, :justifica, :utilizar_exedente_vaga)
    end
end