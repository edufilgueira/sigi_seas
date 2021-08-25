# encoding: utf-8
class Socioeduk::TipoExamesController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_exame, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_exame").pluralize, :socioeduk_tipo_exames_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_exame_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_exame_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_exame_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_exames = Socioeduk::TipoExame.all
  end

  def show
  end

  def new
    @socioeduk_tipo_exame = Socioeduk::TipoExame.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_exame = Socioeduk::TipoExame.new(socioeduk_tipo_exame_params)

    respond_to do |format|
      if @socioeduk_tipo_exame.save
        format.html { redirect_to socioeduk_tipo_exames_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_exame }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_exame.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_exame.update(socioeduk_tipo_exame_params)
      redirect_to socioeduk_tipo_exames_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_exame.destroy
        format.html { redirect_to socioeduk_tipo_exames_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_exame.errors.full_messages[0] if @socioeduk_tipo_exame.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_exame
      @socioeduk_tipo_exame = Socioeduk::TipoExame.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_exame_params
        params.require(:socioeduk_tipo_exame).permit(:descricao)
    end
end
