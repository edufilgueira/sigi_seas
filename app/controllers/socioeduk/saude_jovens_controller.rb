# encoding: utf-8
class Socioeduk::SaudeJovensController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovem, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovem").pluralize, :socioeduk_saude_jovens_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovem_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovem_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovem_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovens = Socioeduk::SaudeJovem.joins(socioeduk_jovem_recepcao: :socioeduk_jovem).select('socioeduk_jovens.*', 'socioeduk_jovens.nome AS nome','socioeduk_saude_jovens.cartao_sus', 'socioeduk_saude_jovens.altura_estimada', 'socioeduk_saude_jovens.peso_estimado')

    @q = @socioeduk_saude_jovens.ransack(params[:q])
    @socioeduk_saude_jovens = @q.result
  end

  def show
  end

  def new
    @socioeduk_saude_jovem = Socioeduk::SaudeJovem.new
    # @socioeduk_saude_jovem.socioeduk_saude_jovens_substancias_utilizadas.build
    # @socioeduk_saude_jovem.socioeduk_saude_jovens_tipo_parentescos.build
    # @socioeduk_saude_jovem.socioeduk_saude_jovens_tipo_medicamento_controlados.build
    # @socioeduk_saude_jovem.socioeduk_saude_jovens_tipo_parentesco_suicidios.build
    # @socioeduk_saude_jovem.socioeduk_saude_jovens_tipo_parentesco_doenca_mentais.build
    # @socioeduk_saude_jovem.socioeduk_saude_jovem_saude_clinicas.build
    # @socioeduk_saude_jovem.socioeduk_saude_jovem_vacinas.build
    # @socioeduk_saude_jovem.socioeduk_saude_jovem_exames.build
    # @socioeduk_saude_jovem.socioeduk_saude_jovem_atendimentos.build

  end
  
  def edit
  end

  def create
    #raise socioeduk_saude_jovem_params.inspect
    @socioeduk_saude_jovem = Socioeduk::SaudeJovem.new(socioeduk_saude_jovem_params)
    respond_to do |format|
      if @socioeduk_saude_jovem.save
        format.html { redirect_to socioeduk_saude_jovens_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovem }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovem.update(socioeduk_saude_jovem_params)
      redirect_to socioeduk_saude_jovens_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovem.destroy
        format.html { redirect_to socioeduk_saude_jovens_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovem.errors.full_messages[0] if @socioeduk_saude_jovem.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovem
      @socioeduk_saude_jovem = Socioeduk::SaudeJovem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovem_params
        params.require(:socioeduk_saude_jovem).permit(:socioeduk_jovem_recepcao_id, :qtd_tentativas_suicidio, :datas_tentativas_tentativas_suicidio, 
        :cartao_sus, :altura_estimada, :peso_estimado, :socioeduk_condicao_fisica_id, :gravida, :data_ultima_menstruacao, 
        :data_provavel_parto, :qtd_gestacoes, :qtd_parto_normal, :qtd_cesariana, :qtd_aborto, :qtd_filhos_vivos, :filhos_deficiente_fisico, 
        :metodo_contraceptivo, :usou_drogas, :historico_tratamento_psiquiatrico, :local_tratamento_psiquiatrico_id, 
        :outro_local_psiquiatrico, :tempo_psiquiatrico, :hipotese_diagnostica_transtorno_mental, :local_tratamento_transtorno_mental_id, 
        :outro_local_transtorno_mental, :tempo_transtorno_mental, :medicamento_controlado, :tentativa_suicidio, :tentativa_suicidio_familiar, 
        :doenca_mental_familiar, :cid_mental_id, :diagnostico_mental, :historico_doenca_tratamento, :medicamento_doenca_cronica, :uso_protese, 
        :uso_ortese, :fez_cirurgia, :tem_fratura, :tem_alergia_alimentar, :descricao_alergia, :tem_alergia_medicamentosa, 
        :descricao_alergia_medicamentosa, :outras_vacinas_recebidas, :outros_exames, :integrante_familia_usa_drogas,
        socioeduk_saude_jovens_substancias_utilizadas_attributes:  %i[socioeduk_saude_jovem_id socioeduk_entorpecente_id 
          iniciou_com_idade parou_com_idade frequencia socioeduk_tipo_auto_consideracao_id realizou_tratamento 
          socioeduk_tipo_tratamento_id id _destroy],
        socioeduk_saude_jovens_tipo_parentescos_attributes:  %i[saude_jovem_id socioeduk_tipo_parentesco_id id _destroy],
        socioeduk_saude_jovens_tipo_medicamento_controlados_attributes: %i[saude_jovem_id socioeduk_tipo_medicamento_controlado_id id _destroy],
        socioeduk_saude_jovens_tipo_parentesco_suicidios_attributes: %i[saude_jovem_id socioeduk_tipo_parentesco_id id _destroy],
        socioeduk_saude_jovens_tipo_parentesco_doenca_mentais_attributes: %i[saude_jovem_id socioeduk_tipo_parentesco_id id _destroy],
        socioeduk_saude_jovem_saude_clinicas_attributes: %i[saude_jovem_id odontologico_clinico socioeduk_cid_id diagnostico socioeduk_local_tratamento_id
          outro_local_tratamento id _destroy],
        socioeduk_saude_jovem_vacinas_attributes: %i[saude_jovem_id socioeduk_tipo_vacina_id data_vacinacao id _destroy],
        socioeduk_saude_jovem_exames_attributes: %i[saude_jovem_id socioeduk_tipo_exame_id data_exame id _destroy],
        socioeduk_saude_jovem_atendimentos_attributes: %i[saude_jovem_id socioeduk_tipo_atendimento_id data_atendimento local_atendimento outro_local_atendimento
          socioeduk_cid_id diagnostico nome_profissional descricao_atendimento id _destroy],
        socioeduk_saude_jovens_metodos_contraceptivos_attributes: %i[ saude_jovem_id socioeduk_metodo_contraceptivo_id outros_metodos id _destroy])
    end
end
