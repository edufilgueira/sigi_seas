# encoding: utf-8
class Biblioteca::AutoresController < BibliotecaApplicationController
  before_action :set_biblioteca_autor, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.biblioteca_autor").pluralize, :biblioteca_autores_path
  add_breadcrumb "Detalhe", :biblioteca_autor_path, only: [:show]
  add_breadcrumb "Novo", :new_biblioteca_autor_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_biblioteca_autor_path, only: [:edit, :update]


  respond_to :html
  def index
    @biblioteca_autores = Biblioteca::Autor.all
  end

  def show
  end

  def new
    @biblioteca_autor = Biblioteca::Autor.new
  end

  def edit
  end

  def create
    @biblioteca_autor = Biblioteca::Autor.new(biblioteca_autor_params)

    respond_to do |format|
      if @biblioteca_autor.save
        format.html { redirect_to biblioteca_autores_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @biblioteca_autor }
      else
        format.html { render :new }
        format.json { render json: @biblioteca_autor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @biblioteca_autor.update(biblioteca_autor_params)
      redirect_to biblioteca_autores_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @biblioteca_autor.destroy
        format.html { redirect_to biblioteca_autores_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @biblioteca_autor.errors.full_messages[0] if @biblioteca_autor.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioteca_autor
      @biblioteca_autor = Biblioteca::Autor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def biblioteca_autor_params
        params.require(:biblioteca_autor).permit(:nome)
    end
end
