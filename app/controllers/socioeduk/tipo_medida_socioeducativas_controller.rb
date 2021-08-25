# encoding: utf-8
class Socioeduk::TipoMedidaSocioeducativasController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_medida_socioeducativa, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_medida_socioeducativa").pluralize, :socioeduk_tipo_medida_socioeducativas_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_medida_socioeducativa_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_medida_socioeducativa_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_medida_socioeducativa_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_medida_socioeducativas = Socioeduk::TipoMedidaSocioeducativa.all
  end

  def show
  end

  def new
    @socioeduk_tipo_medida_socioeducativa = Socioeduk::TipoMedidaSocioeducativa.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_medida_socioeducativa = Socioeduk::TipoMedidaSocioeducativa.new(socioeduk_tipo_medida_socioeducativa_params)

    respond_to do |format|
      if @socioeduk_tipo_medida_socioeducativa.save
        format.html { redirect_to socioeduk_tipo_medida_socioeducativas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_medida_socioeducativa }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_medida_socioeducativa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_medida_socioeducativa.update(socioeduk_tipo_medida_socioeducativa_params)
      redirect_to socioeduk_tipo_medida_socioeducativas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_medida_socioeducativa.destroy
        format.html { redirect_to socioeduk_tipo_medida_socioeducativas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_medida_socioeducativa.errors.full_messages[0] if @socioeduk_tipo_medida_socioeducativa.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_medida_socioeducativa
      @socioeduk_tipo_medida_socioeducativa = Socioeduk::TipoMedidaSocioeducativa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_medida_socioeducativa_params
        params.require(:socioeduk_tipo_medida_socioeducativa).permit(:descricao)
    end
end
