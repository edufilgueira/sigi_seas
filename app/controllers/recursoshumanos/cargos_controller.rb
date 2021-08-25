
# frozen_string_literal: true

class Recursoshumanos::CargosController < AdminApplicationController
  before_action :set_recursoshumanos_cargo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.recursoshumanos_cargo').pluralize, :recursoshumanos_cargos_path
  add_breadcrumb 'Detalhe', :recursoshumanos_cargo_path, only: [:show]
  add_breadcrumb 'Novo', :new_recursoshumanos_cargo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_recursoshumanos_cargo_path, only: %i[edit update]

  respond_to :html
  def index
    @recursoshumanos_cargos = Recursoshumanos::Cargo.all
    #@cargos_group_by_contratos = Recursoshumanos::Cargo.joins(contrato: {recursoshumanos_tipo_legal: :recursoshumanos_tipo_vinculo})
    
    @cargos_group_by_contratos = Recursoshumanos::Cargo.find_by_sql(' select rca.id as id, rca.nome as rca_nome, rtv.nome as rtv_nome, rtl.nome as rtl_nome, rco.doe_ce as doe_ce, rca.quantidade,
                                                                      (select count(id) from recursoshumanos_vinculos as rtv2 where rtv2.recursoshumanos_cargo_id = rca.id) as quantidade_cargo_contratado
                                                                      from  recursoshumanos_cargos as rca
                                                                      inner join recursoshumanos_contratos rco on rca.contrato_id = rco.id
                                                                      inner join recursoshumanos_tipo_legais rtl on rco.recursoshumanos_tipo_legal_id = rtl.id
                                                                      inner join recursoshumanos_tipo_vinculos rtv on rtl.recursoshumanos_tipo_vinculo_id = rtv.id
                                                                      order by rtv.nome desc')
    @cargos_group_by_contratos = @cargos_group_by_contratos.group_by(&:rtv_nome)
                                                        
  end

  def show; end

  def new
    @recursoshumanos_cargo = Recursoshumanos::Cargo.new
  end

  def edit; end

  def create
    @recursoshumanos_cargo = Recursoshumanos::Cargo.new(recursoshumanos_cargo_params)

    respond_to do |format|
      if @recursoshumanos_cargo.save
        format.html { redirect_to recursoshumanos_cargos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @recursoshumanos_cargo }
      else
        format.html { render :new }
        format.json { render json: @recursoshumanos_cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recursoshumanos_cargo.update(recursoshumanos_cargo_params)
      redirect_to recursoshumanos_cargos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @recursoshumanos_cargo.destroy
        format.html { redirect_to recursoshumanos_cargos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @recursoshumanos_cargo.errors.full_messages[0] if @recursoshumanos_cargo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recursoshumanos_cargo
    @recursoshumanos_cargo = Recursoshumanos::Cargo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def recursoshumanos_cargo_params
    params.require(:recursoshumanos_cargo).permit(:nome, :quantidade, :contrato_id, :simbolo)
  end
end
