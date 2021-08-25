# encoding: utf-8
class Socioeduk::SolicitacaoVagaInfracoesController < SocioedukApplicationController
  before_action :set_socioeduk_solicitacao_vaga_infracao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_solicitacao_vaga_infracao").pluralize, :socioeduk_solicitacao_vaga_infracoes_path
  add_breadcrumb "Detalhe", :socioeduk_solicitacao_vaga_infracao_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_solicitacao_vaga_infracao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_solicitacao_vaga_infracao_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_solicitacao_vaga_infracoes = Socioeduk::SolicitacaoVagaInfracao.all
  end

  def show
  end

  def new
    @socioeduk_solicitacao_vaga_infracao = Socioeduk::SolicitacaoVagaInfracao.new
  end

  def edit
  end

  def create
    
    @socioeduk_solicitacao_vaga_infracao = Socioeduk::SolicitacaoVagaInfracao.new(socioeduk_solicitacao_vaga_infracao_params)

    respond_to do |format|
      if @socioeduk_solicitacao_vaga_infracao.save
        format.html { redirect_to socioeduk_solicitacao_vaga_infracoes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_solicitacao_vaga_infracao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_solicitacao_vaga_infracao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_solicitacao_vaga_infracao.update(socioeduk_solicitacao_vaga_infracao_params)
      redirect_to socioeduk_solicitacao_vaga_infracoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_solicitacao_vaga_infracao.destroy
        format.html { redirect_to socioeduk_solicitacao_vaga_infracoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_solicitacao_vaga_infracao.errors.full_messages[0] if @socioeduk_solicitacao_vaga_infracao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_solicitacao_vaga_infracao
      @socioeduk_solicitacao_vaga_infracao = Socioeduk::SolicitacaoVagaInfracao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_solicitacao_vaga_infracao_params
        params.require(:socioeduk_solicitacao_vaga_infracao).permit(:solicitacao_vaga_id, :tipo_natureza, :artigo_infracao_id, :pontuacao_continuado, :estupro_vulneravel)
    end
end
