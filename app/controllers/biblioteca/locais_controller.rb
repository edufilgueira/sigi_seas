# encoding: utf-8
class Biblioteca::LocaisController < BibliotecaApplicationController
  before_action :set_biblioteca_local, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.biblioteca_local").pluralize, :biblioteca_locais_path
  add_breadcrumb "Detalhe", :biblioteca_local_path, only: [:show]
  add_breadcrumb "Novo", :new_biblioteca_local_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_biblioteca_local_path, only: [:edit, :update]


  respond_to :html
  def index
    @biblioteca_locais = Biblioteca::Local.all
  end

  def show
  end

  def new
    @biblioteca_local = Biblioteca::Local.new
  end

  def edit
  end

  def create
    @biblioteca_local = Biblioteca::Local.new(biblioteca_local_params)

    respond_to do |format|
      if @biblioteca_local.save
        format.html { redirect_to biblioteca_locais_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @biblioteca_local }
      else
        format.html { render :new }
        format.json { render json: @biblioteca_local.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @biblioteca_local.update(biblioteca_local_params)
      redirect_to biblioteca_locais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @biblioteca_local.destroy
        format.html { redirect_to biblioteca_locais_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @biblioteca_local.errors.full_messages[0] if @biblioteca_local.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioteca_local
      @biblioteca_local = Biblioteca::Local.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def biblioteca_local_params
        params.require(:biblioteca_local).permit(:nome)
    end
end
