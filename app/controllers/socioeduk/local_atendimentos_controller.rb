# encoding: utf-8
class Socioeduk::LocalAtendimentosController < ApplicationController
  before_action :set_socioeduk_local_atendimento, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_local_atendimento").pluralize, :socioeduk_local_atendimentos_path
  add_breadcrumb "Detalhe", :socioeduk_local_atendimento_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_local_atendimento_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_local_atendimento_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_local_atendimentos = Socioeduk::LocalAtendimento.all
  end

  def show
  end

  def new
    @socioeduk_local_atendimento = Socioeduk::LocalAtendimento.new
  end

  def edit
  end

  def create
    @socioeduk_local_atendimento = Socioeduk::LocalAtendimento.new(socioeduk_local_atendimento_params)

    respond_to do |format|
      if @socioeduk_local_atendimento.save
        format.html { redirect_to socioeduk_local_atendimentos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_local_atendimento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_local_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_local_atendimento.update(socioeduk_local_atendimento_params)
      redirect_to socioeduk_local_atendimentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_local_atendimento.destroy
        format.html { redirect_to socioeduk_local_atendimentos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_local_atendimento.errors.full_messages[0] if @socioeduk_local_atendimento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_local_atendimento
      @socioeduk_local_atendimento = Socioeduk::LocalAtendimento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_local_atendimento_params
        params.require(:socioeduk_local_atendimento).permit(:descricao)
    end
end
