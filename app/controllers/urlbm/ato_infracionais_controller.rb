# encoding: utf-8
class Urlbm::AtoInfracionaisController < SocioedukApplicationController
  before_action :set_urlbm_ato_infracional, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.urlbm_ato_infracional").pluralize, :urlbm_ato_infracionais_path
  add_breadcrumb "Detalhe", :urlbm_ato_infracional_path, only: [:show]
  add_breadcrumb "Novo", :new_urlbm_ato_infracional_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_urlbm_ato_infracional_path, only: [:edit, :update]


  respond_to :html
  def index
    @urlbm_ato_infracionais = Urlbm::AtoInfracional.all
  end

  def show
  end

  def new
    @urlbm_ato_infracional = Urlbm::AtoInfracional.new
  end

  def edit
  end

  def create
    @urlbm_ato_infracional = Urlbm::AtoInfracional.new(urlbm_ato_infracional_params)

    respond_to do |format|
      if @urlbm_ato_infracional.save
        format.html { redirect_to urlbm_ato_infracionais_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @urlbm_ato_infracional }
      else
        format.html { render :new }
        format.json { render json: @urlbm_ato_infracional.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @urlbm_ato_infracional.update(urlbm_ato_infracional_params)
      redirect_to urlbm_ato_infracionais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @urlbm_ato_infracional.destroy
        format.html { redirect_to urlbm_ato_infracionais_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @urlbm_ato_infracional.errors.full_messages[0] if @urlbm_ato_infracional.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urlbm_ato_infracional
      @urlbm_ato_infracional = Urlbm::AtoInfracional.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def urlbm_ato_infracional_params
        params.require(:urlbm_ato_infracional).permit(:tipo)
    end
end
