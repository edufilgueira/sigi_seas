# encoding: utf-8
class Biblioteca::EmprestimosController < BibliotecaApplicationController
  before_action :set_biblioteca_emprestimo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.biblioteca_emprestimo").pluralize, :biblioteca_emprestimos_path
  add_breadcrumb "Detalhe", :biblioteca_emprestimo_path, only: [:show]
  add_breadcrumb "Novo", :new_biblioteca_emprestimo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_biblioteca_emprestimo_path, only: [:edit, :update]


  respond_to :html
  def index
    @biblioteca_emprestimos = Biblioteca::Emprestimo.all
  end

  def show
  end

  def new
    @biblioteca_emprestimo = Biblioteca::Emprestimo.new
  end

  def edit
  end

  def create
    @biblioteca_emprestimo = Biblioteca::Emprestimo.new(biblioteca_emprestimo_params)
    @biblioteca_emprestimo.usuario_id = current_usuario.id
    respond_to do |format|
      if @biblioteca_emprestimo.save
        format.html { redirect_to biblioteca_emprestimos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @biblioteca_emprestimo }
      else
        format.html { render :new }
        format.json { render json: @biblioteca_emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @biblioteca_emprestimo.update(biblioteca_emprestimo_params)
      redirect_to biblioteca_emprestimos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @biblioteca_emprestimo.destroy
        format.html { redirect_to biblioteca_emprestimos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @biblioteca_emprestimo.errors.full_messages[0] if @biblioteca_emprestimo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioteca_emprestimo
      @biblioteca_emprestimo = Biblioteca::Emprestimo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def biblioteca_emprestimo_params
        params.require(:biblioteca_emprestimo).permit(:biblioteca_livro_id, :pessoa_id, :status, :data, :data_retorno, :nota, :usuario_id)
    end
end
