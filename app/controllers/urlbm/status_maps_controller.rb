# encoding: utf-8
class Urlbm::StatusMapsController < SocioedukApplicationController
  before_action :set_urlbm_status_map, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.urlbm_status_map").pluralize, :urlbm_status_maps_path
  add_breadcrumb "Detalhe", :urlbm_status_map_path, only: [:show]
  add_breadcrumb "Novo", :new_urlbm_status_map_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_urlbm_status_map_path, only: [:edit, :update]


  respond_to :html
  def index
    @urlbm_status_maps = Urlbm::StatusMap.all
  end

  def show
  end

  def new
    @urlbm_status_map = Urlbm::StatusMap.new
  end

  def edit
  end

  def create
    @urlbm_status_map = Urlbm::StatusMap.new(urlbm_status_map_params)

    respond_to do |format|
      if @urlbm_status_map.save
        format.html { redirect_to urlbm_status_maps_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @urlbm_status_map }
      else
        format.html { render :new }
        format.json { render json: @urlbm_status_map.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @urlbm_status_map.update(urlbm_status_map_params)
      redirect_to urlbm_status_maps_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @urlbm_status_map.destroy
        format.html { redirect_to urlbm_status_maps_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @urlbm_status_map.errors.full_messages[0] if @urlbm_status_map.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urlbm_status_map
      @urlbm_status_map = Urlbm::StatusMap.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def urlbm_status_map_params
        params.require(:urlbm_status_map).permit(:nome_status)
    end
end
