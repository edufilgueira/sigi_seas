# encoding: utf-8
class Socioeduk::JovemSuicidiosController < SocioedukApplicationController
  before_action :set_socioeduk_jovem_suicidio, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_jovem_suicidio").pluralize, :socioeduk_jovem_suicidios_path
  add_breadcrumb "Detalhe", :socioeduk_jovem_suicidio_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_jovem_suicidio_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_jovem_suicidio_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_jovem_suicidios = Socioeduk::JovemSuicidio.all
  end

  def show
  end

  def new
    @socioeduk_jovem_suicidio = Socioeduk::JovemSuicidio.new
  end

  def edit
  end

  def create
    @socioeduk_jovem_suicidio = Socioeduk::JovemSuicidio.new(socioeduk_jovem_suicidio_params)

    respond_to do |format|
      if @socioeduk_jovem_suicidio.save
        format.html { redirect_to socioeduk_jovem_suicidios_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_jovem_suicidio }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem_suicidio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_jovem_suicidio.update(socioeduk_jovem_suicidio_params)
      redirect_to socioeduk_jovem_suicidios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem_suicidio.destroy
        format.html { redirect_to socioeduk_jovem_suicidios_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_jovem_suicidio.errors.full_messages[0] if @socioeduk_jovem_suicidio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_jovem_suicidio
      @socioeduk_jovem_suicidio = Socioeduk::JovemSuicidio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_jovem_suicidio_params
        params.require(:socioeduk_jovem_suicidio).permit(:jovem_id, :unidade_socioeducativa_id, :idade, :filiacao, :data_entrada_unidade, :municipio, :data_evento, :dia_semana, :metodo, :foi_planejado, :descricao_planejamento, :ouve_aviso, :descricao_aviso, :deixou_mensagem, :descricao_mensagem, :estava_acompanhado, :descricao_acompanhamento, :onde_ocorreu, :tempo_socorro_suicidio, :quem_socorreu, :procedimento_socorro, :depressao, :apatia, :insonia, :drogas, :impulsividade, :relacionamento, :isolamento, :outros, :descrever_outros)
    end
end
