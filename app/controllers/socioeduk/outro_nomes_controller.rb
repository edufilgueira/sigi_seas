# encoding: utf-8
class Socioeduk::OutroNomesController < SocioedukApplicationController
  before_action :set_socioeduk_outro_nome, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_outro_nome").pluralize, :socioeduk_outro_nomes_path
  add_breadcrumb "Detalhe", :socioeduk_outro_nome_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_outro_nome_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_outro_nome_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_outro_nomes = Socioeduk::OutroNome.all
  end

  def show
  end

  def new
    @socioeduk_outro_nome = Socioeduk::OutroNome.new
  end

  def edit
  end

  def create
    @socioeduk_outro_nome = Socioeduk::OutroNome.new(socioeduk_outro_nome_params)

    respond_to do |format|
      if @socioeduk_outro_nome.save
        format.html { redirect_to socioeduk_outro_nomes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_outro_nome }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_outro_nome.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_outro_nome.update(socioeduk_outro_nome_params)
      redirect_to socioeduk_outro_nomes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_outro_nome.destroy
        format.html { redirect_to socioeduk_outro_nomes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_outro_nome.errors.full_messages[0] if @socioeduk_outro_nome.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_outro_nome
      @socioeduk_outro_nome = Socioeduk::OutroNome.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_outro_nome_params
        params.require(:socioeduk_outro_nome).permit(:socioeduk_jovem_id, :descricao)
    end
end
