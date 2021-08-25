# frozen_string_literal: true

class SolicitacaoPatrimoniosController < PatrimonioApplicationController
  before_action :set_solicitacao_patrimonio, only: %i[show edit update destroy autorizar_solicitacao atender_solicitacao]
  add_breadcrumb I18n.t('activerecord.models.solicitacao_patrimonio').pluralize, :solicitacao_patrimonios_path
  add_breadcrumb 'Detalhe', :solicitacao_patrimonio_path, only: [:show]
  add_breadcrumb 'Novo', :new_solicitacao_patrimonio_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_solicitacao_patrimonio_path, only: %i[edit update]

  respond_to :html
  def index
    if current_usuario.permissao.perfil.upcase == 'SOLICITAR PATRIMÔNIO'
      @solicitacao_patrimonios = SolicitacaoPatrimonio.where(solicitante: current_usuario.id).order('id DESC')
      @partial = 'index_solicitante'
    elsif current_usuario.permissao.perfil.upcase == 'MANTÊM PATRIMÔNIO'
      @solicitacao_patrimonios = SolicitacaoPatrimonio.where.not(autorizado: true, atendido: true).order('id DESC')
      @partial = 'index_patrimonio'
    end
  end

  def show
    @itens_solicitacao_patrimonio = ItensSolicitacaoPatrimonio.where(solicitacao_patrimonio_id: @solicitacao_patrimonio.id)
    @itens_solicitacao_patrimonio_disponiveis = Array.new
    @itens_solicitacao_patrimonio.pluck(:item_patrimonio_id).each do |item|
      @itens_solicitacao_patrimonio_disponiveis.push(Patrimonio.where(item_patrimonio_id: item, deposito_id: !nil).count)
    end
    @itens_solicitacao_patrimonio = @itens_solicitacao_patrimonio.zip(@itens_solicitacao_patrimonio_disponiveis.cycle)
    @solicitacao_patrimonio_id = params[:id]

    if current_usuario.permissao.perfil.upcase == 'SOLICITAR PATRIMÔNIO'
      @partial = 'show_solicitante'
    elsif current_usuario.permissao.perfil.upcase == 'MANTÊM PATRIMÔNIO'
      @partial = 'show_patrimonio'
    end
  end

  def new
    @solicitacao_patrimonio = SolicitacaoPatrimonio.new
    @solicitacao_patrimonio.itens_solicitacao_patrimonios.build
  end

  def edit; end

  def create
    @solicitacao_patrimonio = SolicitacaoPatrimonio.new(solicitacao_patrimonio_params)
    # @solicitacao_patrimonio.numero_solicitacao = SolicitacaoPatrimonio.gerar_numero_solicitacao

    respond_to do |format|
      if @solicitacao_patrimonio.save
        format.html { redirect_to solicitacao_patrimonios_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @solicitacao_patrimonio }
      else
        format.html { render :new }
        format.json { render json: @solicitacao_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @solicitacao_patrimonio.update(solicitacao_patrimonio_params)
      redirect_to solicitacao_patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @solicitacao_patrimonio.destroy
        format.html { redirect_to solicitacao_patrimonios_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @solicitacao_patrimonio.errors.full_messages[0] if @solicitacao_patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def autorizar_solicitacao
    @solicitacao_patrimonio.update(autorizado: true)

    redirect_to({action: :index}, notice: "Autorizado com Sucesso!")
  end
  
  def atender_solicitacao
    @solicitacao_patrimonio.update(atendido: true)

    redirect_to({action: :index}, notice: "Atendido com Sucesso!")
  end

  def atender_itens_solicitacao
    params[:item].each do |item|
      ItensSolicitacaoPatrimonio.update(item[:id], quantidade_entregue: item[:quantidade_entregue])
    end

    redirect_to(solicitacao_patrimonio_path(params[:solicitacao_id]), notice: "Salvo com Sucesso!")
  end

  def solicitacoes_autorizadas
    @solicitacao_patrimonios = SolicitacaoPatrimonio.where(autorizado: true, atendido: false).order('id DESC')
  end
  
  def solicitacoes_atendidas
    @solicitacao_patrimonios = SolicitacaoPatrimonio.where(autorizado: true, atendido: true).order('id DESC')
  end
  
  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_solicitacao_patrimonio
    @solicitacao_patrimonio = SolicitacaoPatrimonio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def solicitacao_patrimonio_params
    params.require(:solicitacao_patrimonio).permit(:numero_processo, :solicitante, :justificativa, :observacao, itens_solicitacao_patrimonios_attributes: %i[solicitacao_patrimonio_id item_patrimonio_id quantidade_solicitada id _destroy])
  end
end
