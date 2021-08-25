# encoding: utf-8
class Socioeduk::PedagogicoJovemOficinasController < SocioedukApplicationController
  before_action :set_socioeduk_pedagogico_jovem_oficina, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_pedagogico_jovem_oficina").pluralize, :socioeduk_pedagogico_jovem_oficinas_path
  add_breadcrumb "Detalhe", :socioeduk_pedagogico_jovem_oficina_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_pedagogico_jovem_oficina_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_pedagogico_jovem_oficina_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_pedagogico_jovem_oficinas = Socioeduk::PedagogicoJovemOficina.all
  end

  def show
  end

  def new
    @socioeduk_pedagogico_jovem_oficina = Socioeduk::PedagogicoJovemOficina.new
  end

  def edit
  end

  def create
    @socioeduk_pedagogico_jovem_oficina = Socioeduk::PedagogicoJovemOficina.new(socioeduk_pedagogico_jovem_oficina_params)

    respond_to do |format|
      if @socioeduk_pedagogico_jovem_oficina.save
        format.html { redirect_to socioeduk_pedagogico_jovem_oficinas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_pedagogico_jovem_oficina }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_pedagogico_jovem_oficina.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_pedagogico_jovem_oficina.update(socioeduk_pedagogico_jovem_oficina_params)
      redirect_to socioeduk_pedagogico_jovem_oficinas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_pedagogico_jovem_oficina.destroy
        format.html { redirect_to socioeduk_pedagogico_jovem_oficinas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_pedagogico_jovem_oficina.errors.full_messages[0] if @socioeduk_pedagogico_jovem_oficina.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_pedagogico_jovem_oficina
      @socioeduk_pedagogico_jovem_oficina = Socioeduk::PedagogicoJovemOficina.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_pedagogico_jovem_oficina_params
        params.require(:socioeduk_pedagogico_jovem_oficina).permit(:pedagogico_jovem_id, :socioeduk_tipo_oficina_id, :nome, :data_inicia, :data_fim, :carga_horaria)
    end
end
