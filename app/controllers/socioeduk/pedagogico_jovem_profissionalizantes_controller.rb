# encoding: utf-8
class Socioeduk::PedagogicoJovemProfissionalizantesController < SocioedukApplicationController
  before_action :set_socioeduk_pedagogico_jovem_profissionalizante, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_pedagogico_jovem_profissionalizante").pluralize, :socioeduk_pedagogico_jovem_profissionalizantes_path
  add_breadcrumb "Detalhe", :socioeduk_pedagogico_jovem_profissionalizante_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_pedagogico_jovem_profissionalizante_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_pedagogico_jovem_profissionalizante_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_pedagogico_jovem_profissionalizantes = Socioeduk::PedagogicoJovemProfissionalizante.all
  end

  def show
  end

  def new
    @socioeduk_pedagogico_jovem_profissionalizante = Socioeduk::PedagogicoJovemProfissionalizante.new
  end

  def edit
  end

  def create
    @socioeduk_pedagogico_jovem_profissionalizante = Socioeduk::PedagogicoJovemProfissionalizante.new(socioeduk_pedagogico_jovem_profissionalizante_params)

    respond_to do |format|
      if @socioeduk_pedagogico_jovem_profissionalizante.save
        format.html { redirect_to socioeduk_pedagogico_jovem_profissionalizantes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_pedagogico_jovem_profissionalizante }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_pedagogico_jovem_profissionalizante.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_pedagogico_jovem_profissionalizante.update(socioeduk_pedagogico_jovem_profissionalizante_params)
      redirect_to socioeduk_pedagogico_jovem_profissionalizantes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_pedagogico_jovem_profissionalizante.destroy
        format.html { redirect_to socioeduk_pedagogico_jovem_profissionalizantes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_pedagogico_jovem_profissionalizante.errors.full_messages[0] if @socioeduk_pedagogico_jovem_profissionalizante.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_pedagogico_jovem_profissionalizante
      @socioeduk_pedagogico_jovem_profissionalizante = Socioeduk::PedagogicoJovemProfissionalizante.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_pedagogico_jovem_profissionalizante_params
        params.require(:socioeduk_pedagogico_jovem_profissionalizante).permit(:socioeduk_pedagogico_jovem_id, :socioeduk_tipo_local_curso_id, :nome_programa, :socioeduk_tipo_curso_id, :nome_curso, :data_inicio, :data_fim, :carga_horaria, :observacao)
    end
end
