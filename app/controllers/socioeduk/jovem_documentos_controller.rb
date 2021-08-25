# encoding: utf-8
class Socioeduk::JovemDocumentosController < SocioedukApplicationController
  before_action :set_socioeduk_jovem_documento, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_jovem_documento").pluralize, :socioeduk_jovem_documentos_path
  add_breadcrumb "Detalhe", :socioeduk_jovem_documento_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_jovem_documento_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_jovem_documento_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_jovem_documentos = Socioeduk::JovemDocumento.all
  end

  def show
  end

  def new
    @socioeduk_jovem_documento = Socioeduk::JovemDocumento.new
  end

  def edit
  end

  def create
    @socioeduk_jovem_documento = Socioeduk::JovemDocumento.new(socioeduk_jovem_documento_params)

    respond_to do |format|
      if @socioeduk_jovem_documento.save
        format.html { redirect_to socioeduk_jovem_documentos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_jovem_documento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_jovem_documento.update(socioeduk_jovem_documento_params)
      redirect_to socioeduk_jovem_documentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem_documento.destroy
        format.html { redirect_to socioeduk_jovem_documentos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_jovem_documento.errors.full_messages[0] if @socioeduk_jovem_documento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_jovem_documento
      @socioeduk_jovem_documento = Socioeduk::JovemDocumento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_jovem_documento_params
        params.require(:socioeduk_jovem_documento).permit(:socioeduk_jovem_id, :socioeduk_tipo_documento_id, :numero, :data_emissao, :origem_documento, :destino_documento, :unidade_socioeducativa_id)
    end
end
