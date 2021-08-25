# encoding: utf-8
class Socioeduk::TecnicoJovensController < SocioedukApplicationController
  before_action :set_socioeduk_tecnico_jovem, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tecnico_jovem").pluralize, :socioeduk_tecnico_jovens_path
  add_breadcrumb "Detalhe", :socioeduk_tecnico_jovem_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tecnico_jovem_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tecnico_jovem_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tecnico_jovens = Socioeduk::TecnicoJovem.all
  end

  def show
  end

  def new
    @socioeduk_tecnico_jovem = Socioeduk::TecnicoJovem.new
    @socioeduk_tecnico_jovem.socioeduk_tecnico_jovem_programa_sociais.build
    @socioeduk_tecnico_jovem.socioeduk_tecnico_jovem_plano_atendimentos.build
    @socioeduk_tecnico_jovem.socioeduk_tecnico_jovem_ultimo_relatorios.build
    @socioeduk_tecnico_jovem.socioeduk_tecnico_jovem_visita_familiares.build
    @socioeduk_tecnico_jovem.socioeduk_tecnico_jovem_familias.build
    
  end

  def edit
  end

  def create
    #raise socioeduk_tecnico_jovem_params.inspect
    @socioeduk_tecnico_jovem = Socioeduk::TecnicoJovem.new(socioeduk_tecnico_jovem_params)

    respond_to do |format|
      if @socioeduk_tecnico_jovem.save
        format.html { redirect_to socioeduk_tecnico_jovens_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tecnico_jovem }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tecnico_jovem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tecnico_jovem.update(socioeduk_tecnico_jovem_params)
      redirect_to socioeduk_tecnico_jovens_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tecnico_jovem.destroy
        format.html { redirect_to socioeduk_tecnico_jovens_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tecnico_jovem.errors.full_messages[0] if @socioeduk_tecnico_jovem.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tecnico_jovem
      @socioeduk_tecnico_jovem = Socioeduk::TecnicoJovem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tecnico_jovem_params
        params.require(:socioeduk_tecnico_jovem).permit(:socioeduk_jovem_id, :tem_filhos, :quantos_filhos, :socioeduk_convivio_familiar_id, :codigo_familiar, :cnis, :programas_sociais, 
          :socioeduk_renda_familiar_id, :socioeduk_composicao_familiar_id, :socioeduk_plano_individual_atendimento_id, :nome_tecnico, :profissional_referencia, 
          socioeduk_tecnico_jovem_programa_sociais_attributes: %i[tecnico_jovem_id socioeduk_programa_social_id id _destroy], 
          socioeduk_tecnico_jovem_visita_familiares_attributes: %i[socioeduk_tecnico_jovem_id data_visita pessoa_visitada finalidade_visita responsavel_realizacao id _destroy], 
          socioeduk_tecnico_jovem_plano_atendimentos_attributes: %i[tecnico_jovem_id data_inclusao unidade_socioeducativa_inclusao_id id _destroy], 
          socioeduk_tecnico_jovem_ultimo_relatorios_attributes: %i[tecnico_jovem_id socioeduk_sugestao_relatorio_id data_inclusao socioeduk_tipo_retorno_id 
            unidade_socioeducativa_inclusao_id id _destroy],
          socioeduk_tecnico_jovem_familias_attributes: %i[socioeduk_tecnico_jovem_id nome socioeduk_escolaridade_id profissao socioeduk_tipo_parentesco_id id _destroy])
    end
end
