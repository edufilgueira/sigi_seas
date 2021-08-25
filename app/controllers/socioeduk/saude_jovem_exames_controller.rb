# encoding: utf-8
class Socioeduk::SaudeJovemExamesController < SocioedukApplicationController
  before_action :set_socioeduk_saude_jovem_exame, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_saude_jovem_exame").pluralize, :socioeduk_saude_jovem_exames_path
  add_breadcrumb "Detalhe", :socioeduk_saude_jovem_exame_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_saude_jovem_exame_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_saude_jovem_exame_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_saude_jovem_exames = Socioeduk::SaudeJovemExame.all
  end

  def show
  end

  def new
    @socioeduk_saude_jovem_exame = Socioeduk::SaudeJovemExame.new
  end

  def edit
  end

  def create
    @socioeduk_saude_jovem_exame = Socioeduk::SaudeJovemExame.new(socioeduk_saude_jovem_exame_params)

    respond_to do |format|
      if @socioeduk_saude_jovem_exame.save
        format.html { redirect_to socioeduk_saude_jovem_exames_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_saude_jovem_exame }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_saude_jovem_exame.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_saude_jovem_exame.update(socioeduk_saude_jovem_exame_params)
      redirect_to socioeduk_saude_jovem_exames_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_saude_jovem_exame.destroy
        format.html { redirect_to socioeduk_saude_jovem_exames_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_saude_jovem_exame.errors.full_messages[0] if @socioeduk_saude_jovem_exame.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_saude_jovem_exame
      @socioeduk_saude_jovem_exame = Socioeduk::SaudeJovemExame.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_saude_jovem_exame_params
        params.require(:socioeduk_saude_jovem_exame).permit(:socioeduk_saude_jovem_id, :socioeduk_tipo_exame_id, :data_exame)
    end
end
