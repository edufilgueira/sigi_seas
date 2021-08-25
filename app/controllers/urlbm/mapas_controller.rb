# encoding: utf-8
class Urlbm::MapasController < SocioedukApplicationController
  before_action :set_urlbm_mapa, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.urlbm_mapa").pluralize, :urlbm_mapas_path
  add_breadcrumb "Detalhe", :urlbm_mapa_path, only: [:show]
  add_breadcrumb "Novo", :new_urlbm_mapa_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_urlbm_mapa_path, only: [:edit, :update]


  def index
    @urlbm_mapas = Urlbm::Mapa.order('data_ocorrencia DESC').all
    # @chave = Time.now.strftime(“%d%m%Y”)
    aguardandoCrv()
    indisponibilidadeVagas()
    aguardandoFamilia()
    aguardandoComarca()
    demaisStatus()
    projetoJusticaJa()
    dateTime()
    buscar_jovem_recepcionado()
    respond_to do |format| 
      format.html
      format.pdf { render pdf: "relatorio-mapa",
        footer: { center: "[page] de [topage]" },
        encoding: 'utf8',
        orientation: 'Landscape',
        page_size: 'A4',
        default_header: false,
        grayscale: false,
        enable_plugins: true,
        keep_relative_links: true,
        dpi: '300',
        print_media_type: true,
        no_pdf_compression: true,
        image_quality: 10,
        font_size: '20'
      }
      # @urlbm_mapas.where('deleted_at is null').group('urlbm_status_map_id').order('socioeduk_jovem_id desc')
end
     
  
  def show
    # @urlbm_mapa = Urlbm::Mapa.find(params[:id])
    end
  end

  def new
    @urlbm_mapa = Urlbm::Mapa.new
  end
  
  def edit
  end
  
  def create
    @urlbm_mapa = Urlbm::Mapa.new(urlbm_mapa_params)
    
    respond_to do |format|
      if @urlbm_mapa.save
        format.html { redirect_to urlbm_mapas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @urlbm_mapa }
      else
        format.html { render :new }
        format.json { render json: @urlbm_mapa.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    if @urlbm_mapa.update(urlbm_mapa_params)
      redirect_to urlbm_mapas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end
  
  def destroy
    respond_to do |format|
      if @urlbm_mapa.destroy
        format.html { redirect_to urlbm_mapas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @urlbm_mapa.errors.full_messages[0] if @urlbm_mapa.errors.present?
        format.html { redirect_to :back }
      end
    end
  end
  def aguardandoCrv
    @aguardando_crv = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '1' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null
    order by datahora_apresentacao asc ")
  end

  def indisponibilidadeVagas
    @indisponibilidade_vagas = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '11' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null
    order by datahora_apresentacao asc")
  end

  def aguardandoFamilia
    @aguardando_familia = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '2' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null 
    order by datahora_apresentacao asc")
  end

  def aguardandoComarca
    @aguardando_comarca = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '15' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null 
    order by datahora_apresentacao asc")
  end
  
  def demaisStatus
    @demaisStatus = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id != 1 and um.urlbm_status_map_id != 2 and um.urlbm_status_map_id != 4 and um.urlbm_status_map_id != 11 and um.urlbm_status_map_id != 15 and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null 
    order by urlbm_status_map_id, datahora_apresentacao asc") 
  end

  def projetoJusticaJa
    @projetoJusticaJa = Urlbm::Mapa.find_by_sql("select * from urlbm_mapas um
    inner join urlbm_status_maps usm on usm.id = um.urlbm_status_map_id 
    inner join socioeduk_jovem_recepcoes sjr on sjr.id = um.socioeduk_jovem_recepcao_id 
    inner join urlbm_ato_infracionais uai on uai.id = um.urlbm_ato_infracional_id 
    where um.urlbm_status_map_id = '4' and um.deleted_at  is null and sjr.status is true and sjr.data_saida is null 
    order by datahora_apresentacao asc")
  end

  def dateTime
    time = Time.new
    @dataAtual = time.strftime("%d/%m/%Y")
    @horaAtual = time.strftime("%k:%M")
  end 

  def buscar_jovem_recepcionado
    if !params[:frm].blank?
      @nome = params[:frm][:nome]
      @status = params[:frm][:status]

      where_nome = ''
      if (!@nome.blank?)
        where_nome = " AND socioeduk_jovens.nome ilike '%" + @nome + "%'"
      end

      where_status = ''
      if (!@status.blank?)
        where_status = " AND socioeduk_jovem_recepcoes.status = "+@status
      end

      @socioeduk_jovem_recepcoes = Socioeduk::JovemRecepcao
      .select('socioeduk_jovens.id id_jovem', 'socioeduk_jovens.nome nome_jovem', 'socioeduk_jovens.nome_mae nome_mae', 'socioeduk_jovem_recepcoes.datahora_apresentacao', 'socioeduk_jovem_recepcoes.status','tms.descricao')
      .joins(:socioeduk_jovem)
      .joins('left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = socioeduk_jovem_recepcoes.socioeduk_tipo_medida_socioeducativa_id')
      .where("socioeduk_jovem_recepcoes.id not in
              (
              select socioeduk_jovem_recepcao_id from socioeduk_processos where socioeduk_jovem_recepcao_id = socioeduk_jovem_recepcoes.id
              ) 
              and socioeduk_jovens.deleted_at is null " + where_nome + where_status)
      .order('nome_jovem')
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_urlbm_mapa
    @urlbm_mapa = Urlbm::Mapa.find(params[:id])
  end
  
  # Only allow a trusted parameter "white list" through.
  def urlbm_mapa_params
    params.require(:urlbm_mapa).permit(:num_processo, :responsavel, :telcontato, :data_ocorrencia, :data_judicial, :reincidente, :idade, :bo_mapa, :obs, :socioeduk_jovem_recepcao_id, :socioeduk_jovem_id, :urlbm_ato_infracional_id, :cidade_id, :urlbm_status_map_id)
  end
end
