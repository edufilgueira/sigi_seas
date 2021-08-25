# encoding: utf-8
class Socioeduk::ProcessoRecepcaoJovemInfracoesController < SocioedukApplicationController
  before_action :set_socioeduk_processo_recepcao_jovem_infracao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_processo_recepcao_jovem_infracao").pluralize, :socioeduk_processo_recepcao_jovem_infracoes_path
  add_breadcrumb "Detalhe", :socioeduk_processo_recepcao_jovem_infracao_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_processo_recepcao_jovem_infracao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_processo_recepcao_jovem_infracao_path, only: [:edit, :update]


  respond_to :html

  def infracao
    @processo_recepcao_jovem_id = params[:processo_recepcao_jovem_id]
    infracao = Socioeduk::ProcessoRecepcaoJovemInfracao.where(socioeduk_processo_recepcao_jovem_id: @processo_recepcao_jovem_id)

    @gestao_vagas = Socioeduk::GestaoVaga.joins('
              INNER JOIN socioeduk_jovem_recepcoes jr ON jr.id = socioeduk_gestao_vagas.socioeduk_jovem_recepcao_id
              INNER JOIN socioeduk_processo_recepcao_jovens prj ON prj.socioeduk_jovem_recepcao_id = jr.id
              INNER JOIN socioeduk_processo_recepcao_jovem_infracoes prji ON prji.socioeduk_processo_recepcao_jovem_id = prj.id')
              .where('prj.id = ?', @processo_recepcao_jovem_id)
              .order('socioeduk_gestao_vagas.id asc')

    if(infracao.blank?)
      @socioeduk_processo_recepcao_jovem_infracao = Socioeduk::ProcessoRecepcaoJovemInfracao.new
    else
      @socioeduk_processo_recepcao_jovem_infracao = infracao[0]
    end
  end 

  def index
    @socioeduk_processo_recepcao_jovem_infracoes = Socioeduk::ProcessoRecepcaoJovemInfracao.all
  end

  def show
  end

  def new
    @socioeduk_processo_recepcao_jovem_infracao = Socioeduk::ProcessoRecepcaoJovemInfracao.new
  end

  def edit
  end

  def create
    @socioeduk_processo_recepcao_jovem_infracao = Socioeduk::ProcessoRecepcaoJovemInfracao.new(socioeduk_processo_recepcao_jovem_infracao_params)
    respond_to do |format|
      if @socioeduk_processo_recepcao_jovem_infracao.save
        infracao_id = @socioeduk_processo_recepcao_jovem_infracao.socioeduk_processo_recepcao_jovem_id
        format.html { redirect_to infracao_socioeduk_processo_recepcao_jovem_infracoes_path(processo_recepcao_jovem_id: infracao_id), notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_processo_recepcao_jovem_infracao }
      else
        format.html { render :infracao }
        format.json { render json: @socioeduk_processo_recepcao_jovem_infracao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #raise socioeduk_processo_recepcao_jovem_infracao_params.inspect
    if @socioeduk_processo_recepcao_jovem_infracao.update(socioeduk_processo_recepcao_jovem_infracao_params)
      infracao_id =  socioeduk_processo_recepcao_jovem_infracao_params[:socioeduk_processo_recepcao_jovem_id]
      redirect_to infracao_socioeduk_processo_recepcao_jovem_infracoes_path(processo_recepcao_jovem_id: infracao_id), notice: t('messages.atualizado_sucesso')
    else
      render :infracao
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_processo_recepcao_jovem_infracao.destroy
        format.html { redirect_to socioeduk_processo_recepcao_jovem_infracoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_processo_recepcao_jovem_infracao.errors.full_messages[0] if @socioeduk_processo_recepcao_jovem_infracao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_processo_recepcao_jovem_infracao
      @socioeduk_processo_recepcao_jovem_infracao = Socioeduk::ProcessoRecepcaoJovemInfracao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_processo_recepcao_jovem_infracao_params
        params.require(:socioeduk_processo_recepcao_jovem_infracao).permit(:socioeduk_processo_recepcao_jovem_id, :reincidente, :cumpre_medida, :mandato_apreencao,
          socioeduk_medida_socioeducativas_attributes: %i[socioeduk_processo_recepcao_jovem_infracao_id socioeduk_tipo_medida_socioeducativa_id socioeduk_situacao_cumprimento_id socioeduk_circunstancia_id inicio fim_previsto periodo_dias id _destroy],
          socioeduk_audiencias_attributes: %i[socioeduk_processo_recepcao_jovem_infracao_id socioeduk_comarca_id numero_processo datahora observacao id _destroy] )
    end
end
