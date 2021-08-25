# encoding: utf-8
class UnidadeBlocoDormitoriosController < AdminApplicationController
  before_action :set_unidade_bloco_dormitorio, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.unidade_bloco_dormitorio").pluralize, :unidade_bloco_dormitorios_path
  add_breadcrumb "Detalhe", :unidade_bloco_dormitorio_path, only: [:show]
  add_breadcrumb "Novo", :new_unidade_bloco_dormitorio_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_unidade_bloco_dormitorio_path, only: [:edit, :update]


  respond_to :html
  def index
    @unidade_bloco_dormitorios = UnidadeBlocoDormitorio.all
  end

  def show
  end

  def new
    @id_bloco = params[:id_bloco]
    @unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.find(@id_bloco)
    @unidade_bloco_dormitorio = UnidadeBlocoDormitorio.new
  end

  def edit
    @id_bloco = params[:id_bloco]
    @unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.find(@id_bloco)
  end

  def create
    @unidade_bloco_dormitorio = UnidadeBlocoDormitorio.new(unidade_bloco_dormitorio_params)
    respond_to do |format|
      if @unidade_bloco_dormitorio.save
        unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.find(unidade_bloco_dormitorio_params[:unidade_socioeducativa_bloco_id])
        format.html { redirect_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: unidade_socioeducativa_bloco.unidade_socioeducativa_id), notice: I18n.t("messages.cadastro_sucesso") }
      else
        format.html { redirect_to controller: :unidade_bloco_dormitorios, action: :new, id_bloco: params[:id_bloco] }
      end
    end
  end
  
  def update
    unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.find(params[:id_bloco]).unidade_socioeducativa
    if @unidade_bloco_dormitorio.update(unidade_bloco_dormitorio_params)
      redirect_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: unidade_socioeducativa_bloco), notice: I18n.t("messages.cadastro_sucesso")
    else
      render :edit
    end
  end

  def destroy
    if @unidade_bloco_dormitorio.destroy
      unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.find(@unidade_bloco_dormitorio.unidade_socioeducativa_bloco_id)
      redirect_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: unidade_socioeducativa_bloco.unidade_socioeducativa_id), notice: t('messages.atualizado_sucesso')
    else
      flash[:error] = @unidade_bloco_dormitorio.errors.full_messages[0] if @unidade_bloco_dormitorio.errors.present?
      redirect_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: unidade_socioeducativa_bloco.unidade_socioeducativa_id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade_bloco_dormitorio
      @unidade_bloco_dormitorio = UnidadeBlocoDormitorio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def unidade_bloco_dormitorio_params
        params.require(:unidade_bloco_dormitorio).permit(:unidade_socioeducativa_bloco_id, :descricao, :capacidade_base, :status,
        unidade_bloco_dormitorio_capacidades_attributes: %i[unidade_bloco_dormitorio_id quantidade_alteracao tipo_alteracao responsavel usuario_id id _destroy])
    end
end
