# encoding: utf-8
class Socioeduk::MedidaSocioeducativasController < ApplicationController
  before_action :set_socioeduk_medida_socioeducativa, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_medida_socioeducativa").pluralize, :socioeduk_medida_socioeducativas_path
  add_breadcrumb "Detalhe", :socioeduk_medida_socioeducativa_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_medida_socioeducativa_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_medida_socioeducativa_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_medida_socioeducativas = Socioeduk::MedidaSocioeducativa.all
  end

  def show
  end

  def new
    @socioeduk_medida_socioeducativa = Socioeduk::MedidaSocioeducativa.new
  end

  def edit
  end

  def create
    @socioeduk_medida_socioeducativa = Socioeduk::MedidaSocioeducativa.new(socioeduk_medida_socioeducativa_params)

    respond_to do |format|
      if @socioeduk_medida_socioeducativa.save
        #salvar_medida_socioeducativa_historico(@socioeduk_medida_socioeducativa)
        format.html { redirect_to edit_socioeduk_processo_path(@socioeduk_medida_socioeducativa.socioeduk_processo_id), notice: I18n.t("messages.cadastro_sucesso") }
        # format.html { redirect_to socioeduk_medida_socioeducativas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_medida_socioeducativa }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_medida_socioeducativa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #raise params[:id].inspect
    # APAGAR OS CAMPOS DE CONCLUSÃO DE MEDIDA QUANDO A MEDIDA NÃO FOR "CONCLUÍDA" OU "EVADIDA"
    medida_socioeducativa = Socioeduk::MedidaSocioeducativa.find(params[:id])
    salvar_medida_socioeducativa_historico(medida_socioeducativa)
    if @socioeduk_medida_socioeducativa.update(socioeduk_medida_socioeducativa_params)
      unless [3,5].include?(@socioeduk_medida_socioeducativa.socioeduk_situacao_cumprimento_id.to_i)
        # raise Socioeduk::MedidaSocioeducativa.find(@socioeduk_medida_socioeducativa.socioeduk_situacao_cumprimento_id.to_i).inspect
        @socioeduk_medida_socioeducativa.data_conclusao = ""
        @socioeduk_medida_socioeducativa.socioeduk_tipo_conclusao_medida_socioeducativas_id = ""
        @socioeduk_medida_socioeducativa.socioeduk_encaminhamento_conclusao_medida_socioeducativas_id = ""
        @socioeduk_medida_socioeducativa.data_sentenca_conclusao = ""
        @socioeduk_medida_socioeducativa.observacao_conclusao = ""
        @socioeduk_medida_socioeducativa.save
      end

      redirect_to edit_socioeduk_processo_path(@socioeduk_medida_socioeducativa.socioeduk_processo_id), notice: I18n.t("messages.atualizado_sucesso")
      # redirect_to socioeduk_medida_socioeducativas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_medida_socioeducativa.destroy
        redirect_to edit_socioeduk_processo_path(@socioeduk_medida_socioeducativa.socioeduk_processo_id), notice: I18n.t("messages.delecao_sucesso")
        # format.html { redirect_to socioeduk_medida_socioeducativas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_medida_socioeducativa.errors.full_messages[0] if @socioeduk_medida_socioeducativa.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

    def salvar_medida_socioeducativa_historico(socioeduk_medida_socioeducativa)
      
      medida_socioeducativa_historico = Socioeduk::MedidaSocioeducativaHistorico.new;
      medida_socioeducativa_historico.socioeduk_medida_socioeducativa_id = socioeduk_medida_socioeducativa.id
      medida_socioeducativa_historico.socioeduk_processo_id = socioeduk_medida_socioeducativa.socioeduk_processo_id
      medida_socioeducativa_historico.socioeduk_tipo_medida_socioeducativa_id = socioeduk_medida_socioeducativa.socioeduk_tipo_medida_socioeducativa_id
      medida_socioeducativa_historico.socioeduk_situacao_cumprimento_id = socioeduk_medida_socioeducativa.socioeduk_situacao_cumprimento_id
      medida_socioeducativa_historico.socioeduk_circunstancia_id = socioeduk_medida_socioeducativa.socioeduk_circunstancia_id
      medida_socioeducativa_historico.inicio = socioeduk_medida_socioeducativa.inicio
      medida_socioeducativa_historico.fim_previsto = socioeduk_medida_socioeducativa.fim_previsto
      medida_socioeducativa_historico.periodo_dias = socioeduk_medida_socioeducativa.periodo_dias
      medida_socioeducativa_historico.socioeduk_medida_socioeducativa_motivo_conclusao_id = socioeduk_medida_socioeducativa.socioeduk_medida_socioeducativa_motivo_conclusao_id
      medida_socioeducativa_historico.socioeduk_encaminhamento_conclusao_medida_socioeducativas_id = socioeduk_medida_socioeducativa.socioeduk_encaminhamento_conclusao_medida_socioeducativas_id
      medida_socioeducativa_historico.data_conclusao = socioeduk_medida_socioeducativa.data_conclusao
      medida_socioeducativa_historico.observacao_conclusao = socioeduk_medida_socioeducativa.observacao_conclusao
      medida_socioeducativa_historico.socioeduk_numero_processo_id = socioeduk_medida_socioeducativa.socioeduk_numero_processo_id
      medida_socioeducativa_historico.data_sentenca_conclusao = socioeduk_medida_socioeducativa.data_sentenca_conclusao
      medida_socioeducativa_historico.data_sentenca = socioeduk_medida_socioeducativa.data_sentenca
      medida_socioeducativa_historico.data_decisao = socioeduk_medida_socioeducativa.data_decisao
      medida_socioeducativa_historico.save
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_medida_socioeducativa
      @socioeduk_medida_socioeducativa = Socioeduk::MedidaSocioeducativa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_medida_socioeducativa_params
        params.require(:socioeduk_medida_socioeducativa).permit(:socioeduk_processo_id, :socioeduk_medida_socioeducativa_motivo_conclusao_id, :socioeduk_tipo_medida_socioeducativa_id, :socioeduk_situacao_cumprimento_id, :socioeduk_circunstancia_id, :inicio, :fim_previsto, :periodo_dias, :socioeduk_tipo_conclusao_medida_socioeducativas_id, :socioeduk_encaminhamento_conclusao_medida_socioeducativas_id, :data_conclusao, :observacao_conclusao, :socioeduk_numero_processo_id, :data_sentenca_conclusao, :data_sentenca, :data_decisao)
    end
end
