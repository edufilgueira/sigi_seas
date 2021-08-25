# encoding: utf-8
class UnidadeSocioeducativaBlocosController < AdminApplicationController
  before_action :set_unidade_socioeducativa_bloco, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.unidade_socioeducativa_bloco").pluralize, :unidade_socioeducativa_blocos_path
  add_breadcrumb "Detalhe", :unidade_socioeducativa_bloco_path, only: [:show]
  add_breadcrumb "Novo", :new_unidade_socioeducativa_bloco_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_unidade_socioeducativa_bloco_path, only: [:edit, :update]


  respond_to :html
  def index
    @unidade_socioeducativa_blocos = UnidadeSocioeducativaBloco.all
  end

  def show; end

  def new
    @unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.new
  end

  def edit; end

  def create
    @unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.new(unidade_socioeducativa_bloco_params)

    respond_to do |format|
      if @unidade_socioeducativa_bloco.save
        format.html { redirecto_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: params[:id]), notice: t('messages.cadastro_sucesso') }
      else
        format.html { render redirecto_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: params[:id]), notice: t('messages.erro') }
      end
    end
  end

  def update
    if @unidade_socioeducativa_bloco.update(unidade_socioeducativa_bloco_params)
      redirecto_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: params[:id]), notice: t('messages.atualizado_sucesso')
    else
      redirecto_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: params[:id]), notice: t('messages.erro')
    end
  end

  def destroy
    respond_to do |format|
      if @unidade_socioeducativa_bloco.destroy
        format.html { redirect_to unidade_socioeducativa_blocos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @unidade_socioeducativa_bloco.errors.full_messages[0] if @unidade_socioeducativa_bloco.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade_socioeducativa_bloco
      @unidade_socioeducativa_bloco = UnidadeSocioeducativaBloco.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def unidade_socioeducativa_bloco_params
        params.require(:unidade_socioeducativa_bloco).permit(:descricao, :unidades_socioeducativas_id, :socioeduk_tipo_medida_socioeducativa_id)
    end
end
