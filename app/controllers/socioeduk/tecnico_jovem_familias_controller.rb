# encoding: utf-8
class Socioeduk::TecnicoJovemFamiliasController < SocioedukApplicationController
  before_action :set_socioeduk_tecnico_jovem_familia, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tecnico_jovem_familia").pluralize, :socioeduk_tecnico_jovem_familias_path
  add_breadcrumb "Detalhe", :socioeduk_tecnico_jovem_familia_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tecnico_jovem_familia_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tecnico_jovem_familia_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tecnico_jovem_familias = Socioeduk::TecnicoJovemFamilia.all
  end

  def show
  end

  def new
    @socioeduk_tecnico_jovem_familia = Socioeduk::TecnicoJovemFamilia.new
  end

  def edit
  end

  def create
    @socioeduk_tecnico_jovem_familia = Socioeduk::TecnicoJovemFamilia.new(socioeduk_tecnico_jovem_familia_params)

    respond_to do |format|
      if @socioeduk_tecnico_jovem_familia.save
        format.html { redirect_to socioeduk_tecnico_jovem_familias_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tecnico_jovem_familia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tecnico_jovem_familia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tecnico_jovem_familia.update(socioeduk_tecnico_jovem_familia_params)
      redirect_to socioeduk_tecnico_jovem_familias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tecnico_jovem_familia.destroy
        format.html { redirect_to socioeduk_tecnico_jovem_familias_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tecnico_jovem_familia.errors.full_messages[0] if @socioeduk_tecnico_jovem_familia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tecnico_jovem_familia
      @socioeduk_tecnico_jovem_familia = Socioeduk::TecnicoJovemFamilia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tecnico_jovem_familia_params
        params.require(:socioeduk_tecnico_jovem_familia).permit(:socioeduk_tecnico_jovem_id, :nome, :socioeduk_escolaridade_id, :profissao, :socioeduk_tipo_parentesco_id)
    end
end
