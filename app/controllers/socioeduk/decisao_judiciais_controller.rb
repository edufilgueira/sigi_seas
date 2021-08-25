
# frozen_string_literal: true

class Socioeduk::DecisaoJudiciaisController < SocioedukApplicationController
  before_action :set_socioeduk_decisao_judicial, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_decisao_judicial').pluralize, :socioeduk_decisao_judiciais_path
  add_breadcrumb 'Detalhe', :socioeduk_decisao_judicial_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_decisao_judicial_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_decisao_judicial_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_decisao_judiciais = Socioeduk::DecisaoJudicial.all
  end

  def show; end

  def new
    @socioeduk_decisao_judicial = Socioeduk::DecisaoJudicial.new
  end

  def edit; end

  def create
    @socioeduk_decisao_judicial = Socioeduk::DecisaoJudicial.new(socioeduk_decisao_judicial_params)

    respond_to do |format|
      if @socioeduk_decisao_judicial.save
        format.html { redirect_to socioeduk_decisao_judiciais_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_decisao_judicial }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_decisao_judicial.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_decisao_judicial.update(socioeduk_decisao_judicial_params)
      redirect_to socioeduk_decisao_judiciais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_decisao_judicial.destroy
        format.html { redirect_to socioeduk_decisao_judiciais_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_decisao_judicial.errors.full_messages[0] if @socioeduk_decisao_judicial.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_decisao_judicial
    @socioeduk_decisao_judicial = Socioeduk::DecisaoJudicial.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_decisao_judicial_params
    params.require(:socioeduk_decisao_judicial).permit(:descricao, :atendimento_inicial_id, :documento)
  end
end
