# encoding: utf-8
class Biblioteca::LocalPublicacoesController < BibliotecaApplicationController
  before_action :set_biblioteca_local_publicacao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.biblioteca_local_publicacao").pluralize, :biblioteca_local_publicacoes_path
  add_breadcrumb "Detalhe", :biblioteca_local_publicacao_path, only: [:show]
  add_breadcrumb "Novo", :new_biblioteca_local_publicacao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_biblioteca_local_publicacao_path, only: [:edit, :update]


  respond_to :html
  def index
    @biblioteca_local_publicacoes = Biblioteca::LocalPublicacao.all
  end

  def show
  end

  def new
    @biblioteca_local_publicacao = Biblioteca::LocalPublicacao.new
  end

  def edit
  end

  def create
    @biblioteca_local_publicacao = Biblioteca::LocalPublicacao.new(biblioteca_local_publicacao_params)

    respond_to do |format|
      if @biblioteca_local_publicacao.save
        format.html { redirect_to biblioteca_local_publicacoes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @biblioteca_local_publicacao }
      else
        format.html { render :new }
        format.json { render json: @biblioteca_local_publicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @biblioteca_local_publicacao.update(biblioteca_local_publicacao_params)
      redirect_to biblioteca_local_publicacoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @biblioteca_local_publicacao.destroy
        format.html { redirect_to biblioteca_local_publicacoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @biblioteca_local_publicacao.errors.full_messages[0] if @biblioteca_local_publicacao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioteca_local_publicacao
      @biblioteca_local_publicacao = Biblioteca::LocalPublicacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def biblioteca_local_publicacao_params
        params.require(:biblioteca_local_publicacao).permit(:descricao)
    end
end
