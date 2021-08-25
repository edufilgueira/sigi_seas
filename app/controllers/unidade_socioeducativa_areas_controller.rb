# encoding: utf-8
class UnidadeSocioeducativaAreasController < AdminApplicationController
  before_action :set_unidade_socioeducativa_area, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.unidade_socioeducativa_area").pluralize, :unidade_socioeducativa_areas_path
  add_breadcrumb "Detalhe", :unidade_socioeducativa_area_path, only: [:show]
  add_breadcrumb "Novo", :new_unidade_socioeducativa_area_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_unidade_socioeducativa_area_path, only: [:edit, :update]


  respond_to :html
  def index
    if params[:commit] == 'Buscar'
      @unidade_socioeducativa_areas = UnidadeSocioeducativaArea.where(unidade_socioeducativa_id: params[:unidades_socioeducativas_id])
    else
      @unidade_socioeducativa_areas = UnidadeSocioeducativaArea.all
    end
  end

  def show
  end

  def new
    @unidade_socioeducativa_area = UnidadeSocioeducativaArea.new
  end

  def edit
  end

  def create
    @unidade_socioeducativa_area = UnidadeSocioeducativaArea.new(unidade_socioeducativa_area_params)

    respond_to do |format|
      if @unidade_socioeducativa_area.save
        format.html { redirect_to unidade_socioeducativa_areas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @unidade_socioeducativa_area }
      else
        format.html { render :new }
        format.json { render json: @unidade_socioeducativa_area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @unidade_socioeducativa_area.update(unidade_socioeducativa_area_params)
      redirect_to unidade_socioeducativa_areas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @unidade_socioeducativa_area.destroy
        format.html { redirect_to unidade_socioeducativa_areas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @unidade_socioeducativa_area.errors.full_messages[0] if @unidade_socioeducativa_area.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade_socioeducativa_area
      @unidade_socioeducativa_area = UnidadeSocioeducativaArea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def unidade_socioeducativa_area_params
        params.require(:unidade_socioeducativa_area).permit(:unidade_socioeducativa_id, :area_id, :email)
    end
end
