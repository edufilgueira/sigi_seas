# encoding: utf-8
class Socioeduk::TecnicoJovemAnexosController < ApplicationController
  before_action :set_socioeduk_tecnico_jovem_anexo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tecnico_jovem_anexo").pluralize, :socioeduk_tecnico_jovem_anexos_path
  add_breadcrumb "Detalhe", :socioeduk_tecnico_jovem_anexo_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tecnico_jovem_anexo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tecnico_jovem_anexo_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tecnico_jovem_anexos = Socioeduk::TecnicoJovemAnexo.all
  end

  def show
  end

  def new
    @socioeduk_tecnico_jovem_anexo = Socioeduk::TecnicoJovemAnexo.new
  end

  def edit
  end

  def create
    @socioeduk_tecnico_jovem_anexo = Socioeduk::TecnicoJovemAnexo.new(socioeduk_tecnico_jovem_anexo_params)

    respond_to do |format|
      if @socioeduk_tecnico_jovem_anexo.save
        format.html { redirect_to socioeduk_tecnico_jovem_anexos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tecnico_jovem_anexo }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tecnico_jovem_anexo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tecnico_jovem_anexo.update(socioeduk_tecnico_jovem_anexo_params)
      redirect_to socioeduk_tecnico_jovem_anexos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tecnico_jovem_anexo.destroy
        format.html { redirect_to socioeduk_tecnico_jovem_anexos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tecnico_jovem_anexo.errors.full_messages[0] if @socioeduk_tecnico_jovem_anexo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tecnico_jovem_anexo
      @socioeduk_tecnico_jovem_anexo = Socioeduk::TecnicoJovemAnexo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tecnico_jovem_anexo_params
        params.require(:socioeduk_tecnico_jovem_anexo).permit(:socioeduk_tecnico_jovem_id, :data_inclusao, :unidade_socioeducativa_id, :anexo)
    end
end
