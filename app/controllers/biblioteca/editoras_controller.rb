# encoding: utf-8
class Biblioteca::EditorasController < BibliotecaApplicationController
  before_action :set_biblioteca_editora, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.biblioteca_editora").pluralize, :biblioteca_editoras_path
  add_breadcrumb "Detalhe", :biblioteca_editora_path, only: [:show]
  add_breadcrumb "Novo", :new_biblioteca_editora_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_biblioteca_editora_path, only: [:edit, :update]


  respond_to :html
  def index
    @biblioteca_editoras = Biblioteca::Editora.all
  end

  def show
  end

  def new
    @biblioteca_editora = Biblioteca::Editora.new
  end

  def edit
  end

  def create
    @biblioteca_editora = Biblioteca::Editora.new(biblioteca_editora_params)

    respond_to do |format|
      if @biblioteca_editora.save
        format.html { redirect_to biblioteca_editoras_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @biblioteca_editora }
      else
        format.html { render :new }
        format.json { render json: @biblioteca_editora.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @biblioteca_editora.update(biblioteca_editora_params)
      redirect_to biblioteca_editoras_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @biblioteca_editora.destroy
        format.html { redirect_to biblioteca_editoras_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @biblioteca_editora.errors.full_messages[0] if @biblioteca_editora.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioteca_editora
      @biblioteca_editora = Biblioteca::Editora.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def biblioteca_editora_params
        params.require(:biblioteca_editora).permit(:descricao)
    end
end
