# encoding: utf-8
class Socioeduk::JovemControlePertencesController < SocioedukApplicationController
  before_action :set_socioeduk_jovem_controle_pertence, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_jovem_controle_pertence").pluralize, :socioeduk_jovem_controle_pertences_path
  add_breadcrumb "Detalhe", :socioeduk_jovem_controle_pertence_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_jovem_controle_pertence_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_jovem_controle_pertence_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_jovem_controle_pertences = Socioeduk::JovemControlePertence.all
    #@socioeduk_jovem_controle_pertences = Socioeduk::JovemControlePertence.joins(:socioeduk_jovem_controle_pertence)
  end

  def show
  end

  def new
    @socioeduk_jovem_controle_pertence = Socioeduk::JovemControlePertence.new
  end

  def edit
  end

  def create
    @socioeduk_jovem_controle_pertence = Socioeduk::JovemControlePertence.new(socioeduk_jovem_controle_pertence_params)

    respond_to do |format|
      if @socioeduk_jovem_controle_pertence.save
        format.html { redirect_to socioeduk_jovem_controle_pertences_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_jovem_controle_pertence }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem_controle_pertence.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_jovem_controle_pertence.update(socioeduk_jovem_controle_pertence_params)
      redirect_to socioeduk_jovem_controle_pertences_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem_controle_pertence.destroy
        format.html { redirect_to socioeduk_jovem_controle_pertences_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_jovem_controle_pertence.errors.full_messages[0] if @socioeduk_jovem_controle_pertence.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_jovem_controle_pertence
      @socioeduk_jovem_controle_pertence = Socioeduk::JovemControlePertence.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_jovem_controle_pertence_params
        params.require(:socioeduk_jovem_controle_pertence).permit(:socioeduk_jovem_recepcao_id, 
        jovem_item_pertences_attributes: %i[ socioeduk_jovem_controle_pertence_id nome data_entrega recebente entregador usuario_new usuario_update id _destroy ] )
    end
end
