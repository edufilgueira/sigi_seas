
# frozen_string_literal: true
require 'rubygems'
require 'rest_client'
require 'json'


class PessoaJuizesController < AdminApplicationController
  before_action :set_pessoa, only: %i[show edit update destroy]
  add_breadcrumb 'Pessoas', :pessoas_path
  add_breadcrumb 'Detalhe', :pessoa_path, only: [:show]
  add_breadcrumb 'Novo', :new_pessoa_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_pessoa_path, only: %i[edit update]

  respond_to :html
  def index
    @pessoas = PessoaJuiz.joins('INNER JOIN usuarios u ON pessoas.usuario_id = u.id')
    .where(tipo_pessoa_id: [2,3])
  end

  def show; end

  def new
    @pessoa = PessoaJuiz.new
  end

  def edit; end

  def juizes_cidade
    @pessoas = PessoaJuiz.where(tipo_pessoa_id: 2, cidade_id: params[:pessoa_juiz][:cidade_id])
  end

  def redefinir_senha
    @usuario = Usuario.find(params[:usuario_id])
    @usuario.reset_password(Constants::PASSWD_DEFAULT, Constants::PASSWD_DEFAULT)
    @usuario.update_attributes(status: 'ativo')
    redirect_to new_pessoa_juiz_path, notice: 'Senha redefinida com sucesso.'
  end

  def create
    @pessoa = PessoaJuiz.new(pessoa_params)
    @pessoa.cpf = @pessoa.cpf.gsub(/[^0-9]/,'')
    @pessoa.nome = remover_acentos(@pessoa.nome)
    if !verifica_cpf_existente(@pessoa.cpf)
      respond_to do |format|
        if @pessoa.save
          # CRIANDO O USUARIO POR PADRÃO
          usuario = Usuario.create(nome: @pessoa.nome, email: @pessoa.email_pessoal, encrypted_password: "seas@1234", permissao_id: 22)
          # LIGANDO EMAIL DA PESSOA AO USUARIO
          @pessoa.update_attributes(usuario_id: usuario.id)
          # ---------------------------

          format.html { redirect_to pessoa_juizes_url, notice: I18n.t('messages.cadastro_sucesso') }
          format.json { render :show, status: :created, location: @pessoa }
        else
          format.html { render :new }
          format.json { render json: @pessoa.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_pessoa_juiz_path, notice: I18n.t('messages.cpf_cadastrado')
    end

  end

  def update
    parametro = pessoa_params
    cpf = pessoa_params[:cpf].gsub(/[^0-9]/,'')
    parametro[:cpf] = cpf
    parametro[:nome] = remover_acentos(parametro[:nome])
    if @pessoa.update(parametro)
      # EDITAR O USUARIO POR PADRÃO
      usuario = Usuario.find(@pessoa.usuario_id)
      usuario.update_attributes(nome: @pessoa.nome, email: @pessoa.email_pessoal)
      # ---------------------------
      redirect_to pessoa_juizes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @pessoa.destroy
        format.html { redirect_to pessoas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @pessoa.errors.full_messages[0] if @pessoa.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def verifica_cpf_existente(cpf)
    pessoa = PessoaJuiz.where(cpf: cpf)
    #raise pessoa.inspect
    if pessoa.blank?
      false
    else
      true
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoa = PessoaJuiz.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pessoa_params
    params.require(:pessoa_juiz).permit(:tipo_pessoa_id, :nome, :cpf, :sexo, :usuario_id, :email_pessoal, :cidade_id, :data_nascimento, :cidade, :juiz_id, :socioeduk_comarca_id)
  end


  
end
