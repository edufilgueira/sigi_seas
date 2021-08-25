# encoding: utf-8
class Socioeduk::JovemApreensoesController < SocioedukApplicationController
  before_action :set_socioeduk_jovem_apreensao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_jovem_apreensao").pluralize, :socioeduk_jovem_apreensoes_path
  add_breadcrumb "Detalhe", :socioeduk_jovem_apreensao_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_jovem_apreensao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_jovem_apreensao_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_jovem_apreensoes = Socioeduk::JovemApreensao.all
  end

  def show
  end

  def new
    @socioeduk_jovem_apreensao = Socioeduk::JovemApreensao.new
  end

  def edit
  end

  def create
    @socioeduk_jovem_apreensao = Socioeduk::JovemApreensao.new(socioeduk_jovem_apreensao_params)

    respond_to do |format|
      if @socioeduk_jovem_apreensao.save
        format.html { redirect_to socioeduk_jovem_apreensoes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_jovem_apreensao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem_apreensao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_jovem_apreensao.update(socioeduk_jovem_apreensao_params)
      redirect_to socioeduk_jovem_apreensoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem_apreensao.destroy
        format.html { redirect_to socioeduk_jovem_apreensoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_jovem_apreensao.errors.full_messages[0] if @socioeduk_jovem_apreensao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_jovem_apreensao
      @socioeduk_jovem_apreensao = Socioeduk::JovemApreensao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_jovem_apreensao_params
        params.require(:socioeduk_jovem_apreensao).permit(:socioeduk_jovem_id, :antecedente_criminal, :qtd_processo_anterior, :data_hora_entrada_delegacia, :dia_delegacia, :socioeduk_tipo_medida_socioeducativa_id, :socioeduk_tipo_decisao_judicial_id, :qtd_dia_internacao_medida)
    end
end
