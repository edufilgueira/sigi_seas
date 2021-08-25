# encoding: utf-8
class Socioeduk::CidsController < SocioedukApplicationController
  before_action :set_socioeduk_cid, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_cid").pluralize, :socioeduk_cids_path
  add_breadcrumb "Detalhe", :socioeduk_cid_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_cid_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_cid_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_cids = Socioeduk::Cid.all
  end

  def show
  end

  def new
    @socioeduk_cid = Socioeduk::Cid.new
  end

  def edit
  end

  def create
    @socioeduk_cid = Socioeduk::Cid.new(socioeduk_cid_params)

    respond_to do |format|
      if @socioeduk_cid.save
        format.html { redirect_to socioeduk_cids_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_cid }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_cid.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_cid.update(socioeduk_cid_params)
      redirect_to socioeduk_cids_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_cid.destroy
        format.html { redirect_to socioeduk_cids_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_cid.errors.full_messages[0] if @socioeduk_cid.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_cid
      @socioeduk_cid = Socioeduk::Cid.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_cid_params
        params.require(:socioeduk_cid).permit(:descricao)
    end
end
