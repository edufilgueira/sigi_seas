class Api::RelatorioDiariosController < Api::ApiController

  before_action :set_relatorio_diario, only: [:show, :update, :destroy]

  def listar_envio_unidades
    @relatorio_diarios = UnidadeSocioeducativa.select("id, sigla, nome, (select id from socioeduk_relatorio_diarios rdi
                                        where rdi.unidade_socioeducativa_id = unidades_socioeducativas.id
                                        and rdi.data = '" + params[:data] + "' limit 1) as relatorio_diario_id")
    .order('nome');
    render json: @relatorio_diarios
  end

  # GET /api/RelatorioDiarios
  def index
    @relatorio_diarios = Socioeduk::RelatorioDiario.joins(:unidade_socioeducativa).select('socioeduk_relatorio_diarios.*', 'unidades_socioeducativas.*')
    render json: @relatorio_diarios
  end

  # GET /api/RelatorioDiarios/1
  def show
    render json: @relatorio_diario
  end

  # POST /api/RelatorioDiarios
  def create
    @relatorio_diario = Socioeduk::RelatorioDiario.new(processo_params)
    if @relatorio_diario.save
      render json: @relatorio_diario, status: :created
    else
      render json: @relatorio_diario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/RelatorioDiarios/1
  def update
    if @relatorio_diario.update(relatorio_diario_params)
      render json: @relatorio_diario
    else
      render json: @relatorio_diario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/RelatorioDiarios/1
  def destroy
    @relatorio_diario.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_relatorio_diario
    @relatorio_diario = Socioeduk::RelatorioDiario.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def relatorio_diario_params
    params.require(:socioeduk_relatorio_diario).permit(:unidade_socioeducativa_id, :int_mas, :int_fem, :ip_mas, :ip_fem, :sl_mas, :sl_fem, :capacidade_nominal, :capacidade_real, :socioeducador_homem, :socioeducador_mulher, :capacidade_por_adolescente, :evasao, :fuga, :descumprimento, :situacao_crise, :data, :resumo)
  end

  # def require_authorization!
  #   unless current_usuario == @processo.user
  #     render json: {}, status: :forbidden
  #   end
  # end

end
