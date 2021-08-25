# encoding: utf-8
class Socioeduk::PedagogicoJovensController < SocioedukApplicationController
  before_action :set_socioeduk_pedagogico_jovem, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_pedagogico_jovem").pluralize, :socioeduk_pedagogico_jovens_path
  add_breadcrumb "Detalhe", :socioeduk_pedagogico_jovem_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_pedagogico_jovem_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_pedagogico_jovem_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_pedagogico_jovens = Socioeduk::PedagogicoJovem.joins(:socioeduk_jovem, :socioeduk_tipo_alfabetizado, :socioeduk_situacao_escolar, :socioeduk_escolaridade).select('socioeduk_jovens.*', 'socioeduk_jovens.nome AS nome', 'socioeduk_tipo_alfabetizados.descricao AS descricao_alfabetizacao', 'socioeduk_situacao_escolares.descricao AS descricao_escolar', 'socioeduk_escolaridades.descricao AS descricao_escolaridade')
    @q = @socioeduk_pedagogico_jovens.ransack(params[:q])
    @socioeduk_pedagogico_jovens = @q.result
        
  end

  def show
  end

  def new
    @socioeduk_pedagogico_jovem = Socioeduk::PedagogicoJovem.new
    # @socioeduk_pedagogico_jovem.socioeduk_pedagogico_jovem_disciplina_escolaridades.build
    # @socioeduk_pedagogico_jovem.socioeduk_pedagogico_jovem_escolaridade_medidas.build
    # @socioeduk_pedagogico_jovem.socioeduk_pedagogico_jovem_oficinas.build
    # @socioeduk_pedagogico_jovem.socioeduk_pedagogico_jovem_profissionalizantes.build
  end

  def edit
  end

  def create
    #raise socioeduk_pedagogico_jovem_params.inspect
    @socioeduk_pedagogico_jovem = Socioeduk::PedagogicoJovem.new(socioeduk_pedagogico_jovem_params)

    respond_to do |format|
      if @socioeduk_pedagogico_jovem.save
        format.html { redirect_to socioeduk_pedagogico_jovens_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_pedagogico_jovem }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_pedagogico_jovem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #raise socioeduk_pedagogico_jovem_params.inspect
    if @socioeduk_pedagogico_jovem.update(socioeduk_pedagogico_jovem_params)
      redirect_to socioeduk_pedagogico_jovens_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|s
      if @socioeduk_pedagogico_jovem.destroy
        format.html { redirect_to socioeduk_pedagogico_jovens_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_pedagogico_jovem.errors.full_messages[0] if @socioeduk_pedagogico_jovem.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_pedagogico_jovem
      @socioeduk_pedagogico_jovem = Socioeduk::PedagogicoJovem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_pedagogico_jovem_params
        params.require(:socioeduk_pedagogico_jovem).permit(:socioeduk_jovem_id, :socioeduk_tipo_alfabetizado_id, 
          :socioeduk_situacao_escolar_id, :socioeduk_escolaridade_id, :ultima_escola_frequentada, :ultimo_ano_escolar, 
          :cgm, :socioeduk_situacao_ocupacional_anterior, :socioeduk_situacao_ocupacional_atual, 
          socioeduk_pedagogico_jovem_disciplina_escolaridades_attributes: %i[pedagogico_jovem_id socioeduk_disciplina_escolaridade_id
            socioeduk_situacao_disciplina_id data_conclusao observacao id _destroy],
          socioeduk_pedagogico_jovem_escolaridade_medidas_attributes: %i[pedagogico_jovem_id socioeduk_escolaridade_id 
            socioeduk_tipo_local_curso_id escola ano id _destroy],
          socioeduk_pedagogico_jovem_oficinas_attributes: %i[socioeduk_pedagogico_jovem_id socioeduk_tipo_oficina_id nome data_inicia data_final 
            carga_horaria id _destroy], socioeduk_pedagogico_jovem_profissionalizantes_attributes: %i[socioeduk_pedagogico_jovem_id socioeduk_tipo_local_curso_id nome_programa socioeduk_tipo_curso_id nome_curso data_inicio data_fim carga_horaria observacao id _destroy])  
    end
end