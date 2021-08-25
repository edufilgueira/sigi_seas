
# frozen_string_literal: true

class UnidadesSocioeducativasController < AdminApplicationController
  before_action :set_unidade_socioeducativa, only: %i[show edit update destroy]
  add_breadcrumb 'Unidades Socioeducativas', :unidades_socioeducativas_path
  add_breadcrumb 'Detalhe', :unidade_socioeducativa_path, only: [:show]
  add_breadcrumb 'Novo', :new_unidade_socioeducativa_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_unidade_socioeducativa_path, only: %i[edit update]

  respond_to :html
  def index
    @unidades_socioeducativas = UnidadeSocioeducativa.all
  end

  def show; end

  def new
    @unidade_socioeducativa = UnidadeSocioeducativa.new
  end

  def edit; end

  def create
    @unidade_socioeducativa = UnidadeSocioeducativa.new(unidade_socioeducativa_params)

    respond_to do |format|
      if @unidade_socioeducativa.save
        format.html { redirect_to unidades_socioeducativas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @unidade_socioeducativa }
      else
        format.html { render :new }
        format.json { render json: @unidade_socioeducativa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @unidade_socioeducativa.update(unidade_socioeducativa_params)
      redirect_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: params[:id]), notice: t('messages.atualizado_sucesso')
    else
      redirect_to cadastrar_blocos_socioeduk_gestao_vagas_url(id: params[:id]), notice: t('messages.atualizado_erro')
    end
  end

  def destroy
    respond_to do |format|
      if @unidade_socioeducativa.destroy
        format.html { redirect_to unidades_socioeducativas_path, notice: t('messages.sucesso') }
      else
        format.html { redirect_to unidades_socioeducativas_path, notice: t('messages.erro') }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_unidade_socioeducativa
    @unidade_socioeducativa = UnidadeSocioeducativa.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def unidade_socioeducativa_params
    params.require(:unidade_socioeducativa).permit(:nome, :sigla, :endereco, :cidade_id,
    unidade_socioeducativa_blocos_attributes: %i[unidade_socioeducativa_id descricao socioeduk_tipo_medida_socioeducativa_id id _destroy])
  end

end
