# encoding: utf-8
class TipoPessoasController < ApplicationController
  before_action :set_tipo_pessoa, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.tipo_pessoa").pluralize, :tipo_pessoas_path
  add_breadcrumb "Detalhe", :tipo_pessoa_path, only: [:show]
  add_breadcrumb "Novo", :new_tipo_pessoa_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_tipo_pessoa_path, only: [:edit, :update]


  respond_to :html
  def index
    @tipo_pessoas = TipoPessoa.all
  end

  def show
  end

  def new
    @tipo_pessoa = TipoPessoa.new
  end

  def edit
  end

  def create
    @tipo_pessoa = TipoPessoa.new(tipo_pessoa_params)

    respond_to do |format|
      if @tipo_pessoa.save
        format.html { redirect_to tipo_pessoas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @tipo_pessoa }
      else
        format.html { render :new }
        format.json { render json: @tipo_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @tipo_pessoa.update(tipo_pessoa_params)
      redirect_to tipo_pessoas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @tipo_pessoa.destroy
        format.html { redirect_to tipo_pessoas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @tipo_pessoa.errors.full_messages[0] if @tipo_pessoa.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_pessoa
      @tipo_pessoa = TipoPessoa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_pessoa_params
        params.require(:tipo_pessoa).permit(:descricao)
    end
end
