# encoding: utf-8
class Socioeduk::SaudeJovensMetodosContraceptivosController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovens_metodos_contraceptivo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovens_metodos_contraceptivo").pluralize, :socioeduk_saude_jovens_metodos_contraceptivos_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovens_metodos_contraceptivo_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovens_metodos_contraceptivo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovens_metodos_contraceptivo_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovens_metodos_contraceptivos = Socioeduk::SaudeJovensMetodosContraceptivo.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovens_metodos_contraceptivo = Socioeduk::SaudeJovensMetodosContraceptivo.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovens_metodos_contraceptivo = Socioeduk::SaudeJovensMetodosContraceptivo.new(socioeduk_saude_jovens_metodos_contraceptivo_params)

    respond_to do |format|
      if @socioeduk_saude_jovens_metodos_contraceptivo.save
        format.html { redirect_to socioeduk_saude_jovens_metodos_contraceptivos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovens_metodos_contraceptivo }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovens_metodos_contraceptivo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovens_metodos_contraceptivo.update(socioeduk_saude_jovens_metodos_contraceptivo_params)
      redirect_to socioeduk_saude_jovens_metodos_contraceptivos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovens_metodos_contraceptivo.destroy
        format.html { redirect_to socioeduk_saude_jovens_metodos_contraceptivos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovens_metodos_contraceptivo.errors.full_messages[0] if @socioeduk_saude_jovens_metodos_contraceptivo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovens_metodos_contraceptivo
      @socioeduk_saude_jovens_metodos_contraceptivo = Socioeduk::SaudeJovensMetodosContraceptivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovens_metodos_contraceptivo_params
        params.require(:socioeduk_saude_jovens_metodos_contraceptivo).permit(:saude_jovem_id, :socioeduk_metodo_contraceptivo_id, :outros_metodos)
    end
end
