# encoding: utf-8
class Biblioteca::LivrosController < BibliotecaApplicationController
  before_action :set_biblioteca_livro, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.biblioteca_livro").pluralize, :biblioteca_livros_path
  add_breadcrumb "Detalhe", :biblioteca_livro_path, only: [:show]
  add_breadcrumb "Novo", :new_biblioteca_livro_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_biblioteca_livro_path, only: [:edit, :update]


  respond_to :html
  def index
    @biblioteca_livros = Biblioteca::Livro.all
  end

  def show
  end

  def new
    @biblioteca_livro = Biblioteca::Livro.new
  end

  def edit
  end

  def create
    @biblioteca_livro = Biblioteca::Livro.new(biblioteca_livro_params)
    respond_to do |format|
      if @biblioteca_livro.save
        format.html { redirect_to biblioteca_livros_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @biblioteca_livro }
      else
        format.html { render :new }
        format.json { render json: @biblioteca_livro.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @biblioteca_livro.update(biblioteca_livro_params)
      redirect_to biblioteca_livros_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @biblioteca_livro.destroy
        format.html { redirect_to biblioteca_livros_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @biblioteca_livro.errors.full_messages[0] if @biblioteca_livro.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioteca_livro
      @biblioteca_livro = Biblioteca::Livro.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def biblioteca_livro_params
        params.require(:biblioteca_livro).permit(:titulo, :sinopse, :biblioteca_autor_id, :biblioteca_local_id, :status, :biblioteca_local_publicacao_id,
          :biblioteca_editora_id, :data_publicacao, :paginacao, :assunto1, :assunto2, :css_cdu, :isbn, :cutter)
    end
end
