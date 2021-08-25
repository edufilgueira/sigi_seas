class Api::ProcessosController < Api::ApiController

  before_action :set_processo, only: [:show, :update, :destroy]

  # GET /api/processos
  def index
    @processos = Socioeduk::Processo.all
    render json: @processos
  end

  # GET /api/processos/1
  def show
    render json: @processo
  end

  # POST /api/processos
  def create
    @processo = Socioeduk::Processo.new(processo_params)
    if @processo.save
      render json: @processo, status: :created
    else
      render json: @processo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/processos/1
  def update
    if @processo.update(processo_params)
      render json: @processo
    else
      render json: @processo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/processos/1
  def destroy
    @processo.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_processo
    @processo = Socioeduk::Processo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def processo_params
    params.require(:socioeduk_processo).permit(:socioeduk_jovem_recepcao_id, :numero_processo, :socioeduk_tipo_processo_id, :socioeduk_comarca_id, :data_representacao, 
    :data_decisao, :numero_oficio, :data_oficio, :socioeduk_situacao_processo_id, :socioeduk_municipio_id, :data_hora_infracao, :data_hora_apreensao)
  end

  # def require_authorization!
  #   unless current_usuario == @processo.user
  #     render json: {}, status: :forbidden
  #   end
  # end

end
