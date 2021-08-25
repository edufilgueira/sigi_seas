
# frozen_string_literal: true
require 'rubygems'
require 'rest_client'
require 'json'


class PessoasController < AdminApplicationController
  before_action :set_pessoa, only: %i[show edit update destroy]
  add_breadcrumb 'Pessoas', :pessoas_path
  add_breadcrumb 'Detalhe', :pessoa_path, only: [:show]
  add_breadcrumb 'Novo', :new_pessoa_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_pessoa_path, only: %i[edit update]
  
  if Rails.env.development?
    BASE_URL = "http://127.0.0.1:3000/colaboradores/"
  else
    BASE_URL = "http://172.27.39.116:7013/colaboradores/"
  end


  respond_to :html
  def index
    @pessoas = Pessoa.all
  end

  def show; end

  def new
    @pessoa = Pessoa.new
  end

  def edit; end

  def data_api_add(id)
    data = {
      id: id,
      nome: remover_acentos(pessoa_params[:nome]),
      cpf: pessoa_params[:cpf],
      email: pessoa_params[:email_pessoal],
      role: 'colaborador',
      ativo: true,
      password_digest: current_usuario.encrypted_password
    }
  end

  def data_api_edit(id)
    data = {
      id: id,
      nome: remover_acentos(pessoa_params[:nome]),
      cpf: pessoa_params[:cpf],
      email: pessoa_params[:email_pessoal],
      role: 'colaborador',
      ativo: true,
      password_digest: current_usuario.encrypted_password
    }
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)
    @pessoa.cpf = @pessoa.cpf.gsub(/[^0-9]/,'')
    @pessoa.nome = remover_acentos(@pessoa.nome)

    if !verifica_cpf_existente(@pessoa.cpf)
      respond_to do |format|
        if @pessoa.save
          if(@pessoa.ponto_obrigatorio)
            uri = URI(BASE_URL)
            data = data_api_add(@pessoa.id)
            post(uri, data)
          end
          format.html { redirect_to new_recursoshumanos_vinculo_url(pessoa_id: @pessoa.id), notice: I18n.t('messages.cadastro_sucesso') }
          format.json { render :show, status: :created, location: @pessoa }
        else
          format.html { render :new }
          format.json { render json: @pessoa.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_pessoa_path, notice: I18n.t('messages.cpf_cadastrado')
    end

  end

  def update
    raise "aqui".inspect
    parametro = pessoa_params
    cpf = pessoa_params[:cpf].gsub(/[^0-9]/,'')
    parametro[:cpf] = cpf
    parametro[:nome] = remover_acentos(parametro[:nome])

    if @pessoa.update(parametro)
      if(@pessoa.ponto_obrigatorio)
        uri = URI(BASE_URL+@pessoa.id.to_s)
        data = data_api_edit(@pessoa.id)
        patch(uri, data)
      end
      redirect_to pessoas_url, notice: t('messages.atualizado_sucesso')
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

  def contratacao
    @pessoa = Pessoa.new
  end

  def verifica_cpf_existente(cpf)
    pessoa = Pessoa.where(cpf: cpf)
    #raise pessoa.inspect
    if pessoa.blank?
      false
    else
      true
    end
  end

  private
  
  def post(uri, data)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, {"Content-Type" => "application/json", "Accept" => "application/json"})
    request.body = data.to_json
    res = http.request(request)
  end

  def patch(uri, data)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Patch.new(uri.request_uri, {"Content-Type" => "application/json", "Accept" => "application/json"})
    request.body = data.to_json
    res = http.request(request)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pessoa_params
    params.require(:pessoa).permit( :tipo_pessoa_id, :nome, :ponto_obrigatorio, :data_contratacao, :cpf, :usuario_id, :email_pessoal, :nome_pai, :nome_mae, :estado_civil, :conjuge, :profissao, :cidade_id, :data_nascimento, :naturalidade, :uf, :tipo_sanguineo, :sexo, :rua, :numero, :complemento, :bairro, :cidade, :estado, :cep, :cep, :telefone, :celular, :pis, :ctps, :serie, :rg, :emissor, :emissao, :certificado_militar, :emissor_militar, :titulo_eleitoral, :zona, :secao, :banco, :agencia, :conta_corrente, :controle_ponto)
  end


  
end
