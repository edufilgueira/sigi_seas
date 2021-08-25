# encoding: utf-8
class Socioeduk::TipoAlfabetizadosController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_alfabetizado, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_alfabetizado").pluralize, :socioeduk_tipo_alfabetizados_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_alfabetizado_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_alfabetizado_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_alfabetizado_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_alfabetizados = Socioeduk::TipoAlfabetizado.all
  end

  def show
  end

  def new
    @socioeduk_tipo_alfabetizado = Socioeduk::TipoAlfabetizado.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_alfabetizado = Socioeduk::TipoAlfabetizado.new(socioeduk_tipo_alfabetizado_params)

    respond_to do |format|
      if @socioeduk_tipo_alfabetizado.save
        format.html { redirect_to socioeduk_tipo_alfabetizados_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_alfabetizado }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_alfabetizado.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_alfabetizado.update(socioeduk_tipo_alfabetizado_params)
      redirect_to socioeduk_tipo_alfabetizados_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_alfabetizado.destroy
        format.html { redirect_to socioeduk_tipo_alfabetizados_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_alfabetizado.errors.full_messages[0] if @socioeduk_tipo_alfabetizado.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_alfabetizado
      @socioeduk_tipo_alfabetizado = Socioeduk::TipoAlfabetizado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_alfabetizado_params
        params.require(:socioeduk_tipo_alfabetizado).permit(:descricao)
    end
end
