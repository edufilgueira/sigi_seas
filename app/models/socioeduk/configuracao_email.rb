class Socioeduk::ConfiguracaoEmail < ApplicationRecord
  include PdfGenerator
  belongs_to :socioeduk_tipo_acao_configuracao_email, class_name: 'Socioeduk::TipoAcaoConfiguracaoEmail', foreign_key: 'socioeduk_tipo_acao_configuracao_email_id', required: false
  belongs_to :socioeduk_tipo_filtro_configuracao_email, class_name: 'Socioeduk::TipoFiltroConfiguracaoEmail', foreign_key: 'socioeduk_tipo_filtro_configuracao_email_id', required: false
  
  has_many :configuracao_email_pessoas, class_name: 'Socioeduk::ConfiguracaoEmailPessoa', foreign_key: 'socioeduk_configuracao_email_id', dependent: :destroy
  has_many :configuracao_email_funcoes, class_name: 'Socioeduk::ConfiguracaoEmailFuncao', foreign_key: 'socioeduk_configuracao_email_id', dependent: :destroy
  has_many :configuracao_email_areas, class_name: 'Socioeduk::ConfiguracaoEmailArea', foreign_key: 'socioeduk_configuracao_email_id', dependent: :destroy

  accepts_nested_attributes_for :configuracao_email_pessoas, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :configuracao_email_funcoes, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :configuracao_email_areas, reject_if: :all_blank, allow_destroy: true


  def self.enviar_email_ao_finalizar_processo(processo)
    # PROCURAR POR REGRA DE COMARCA
    configuracao_emails = Socioeduk::ConfiguracaoEmail.where(socioeduk_tipo_filtro_configuracao_email_id: 1)
    if configuracao_emails.length > 0
      configuracao_emails.each do |configuracao_email|
        # VERIFICA SE A COMARCA DO PROCESSO É A MESMA DA CONFIGURAÇÃO DE EMAIL
        if configuracao_email.valor.to_i == processo.cidade_comarca
          # CARREGA AS VERIÁVEIS (PARAMETROS)
          nome_do_adolescente = processo.socioeduk_jovem_recepcao.socioeduk_jovem.nome
          comarca_de_origem = Cidade.find(processo.cidade_comarca).nome
          medida = Socioeduk::MedidaSocioeducativa.where(socioeduk_processo_id: processo.id).order(:id).last
          medida_socioeducativa = medida&.socioeduk_tipo_medida_socioeducativa&.descricao
          data_inicio = medida&.inicio
          data_fim = medida&.data_conclusao
          tempo_de_cumprimento = intervalo_de_data_por_extenso(data_inicio, data_fim)
          motivo_de_conclusao = medida.socioeduk_medida_socioeducativa_motivo_conclusao&.socioeduk_tipo_conclusao_medida_socioeducativa&.descricao
          encaminhado_para = medida.socioeduk_encaminhamento_conclusao_medida_socioeducativas&.descricao
          # SUBSTITUIR AS VARIAVEIS DO E MAIL
          body = configuracao_email.body
          body = body.gsub!('[nome_do_adolescente]',nome_do_adolescente)
          body = body.gsub!('[comarca_de_origem]',comarca_de_origem)
          body = body.gsub!('[medida_socioeducativa]',medida_socioeducativa)
          body = body.gsub!('[data_inicio]',data_inicio.to_s)
          body = body.gsub!('[data_fim]',data_fim.to_s)
          body = body.gsub!('[tempo_de_cumprimento]',tempo_de_cumprimento.to_s)
          body = body.gsub!('[motivo_de_conclusao]',motivo_de_conclusao.to_s)
          body = body.gsub!('[encaminhado_para]',encaminhado_para)

          if (!body.blank? && !body.nil?)
            # ENVIAR EMAIL PARA PESSOAS
            configuracao_email_pessoas = Socioeduk::ConfiguracaoEmailPessoa.where(socioeduk_configuracao_email_id: configuracao_email.id)
            emails = []
            if configuracao_email_pessoas.length > 0
              configuracao_email_pessoas.each do |configuracao_email_pessoa|
                emails.push(configuracao_email_pessoa.email)
              end
              EnviarEmailMailer.enviar_email(emails, body, 'SEAS - Processo Finalizado').deliver_now!
            end

            # ENVIAR PARA EMAIL PARA FUNÇÃO
            configuracao_email_funcoes = Socioeduk::ConfiguracaoEmailFuncao.where(socioeduk_configuracao_email_id: configuracao_email.id)
            funcoes = []
            if configuracao_email_funcoes.length > 0
              configuracao_email_funcoes.each do |configuracao_email_funcao|
                funcao_pessoas = FuncaoPessoa.where(funcao_id: configuracao_email_funcao.funcao_id)
                funcao_pessoas.each do |funcao_pessoa|
                  funcoes.push(funcao_pessoa.pessoa.email_pessoal)
                end
              end
              EnviarEmailMailer.enviar_email(funcoes, body, 'SEAS - Processo Finalizado').deliver_now!
            end

          # ENVIAR PARA EMAIL PARA AREA
          configuracao_email_areas = Socioeduk::ConfiguracaoEmailArea.where(socioeduk_configuracao_email_id: configuracao_email.id)
          areas = []
          if configuracao_email_areas.length > 0
            configuracao_email_areas.each do |configuracao_email_area|
              unidade_socioeducativa_areas = UnidadeSocioeducativaArea.where(area_id: configuracao_email_area.area_id)
              unidade_socioeducativa_areas.each do |unidade_socioeducativa_area|
                areas.push(unidade_socioeducativa_area.email)
              end
            end
            EnviarEmailMailer.enviar_email(areas, body, 'SEAS - Processo Finalizado').deliver_now!
          end
          end
        
        end
      end
    end
  end

  def self.calcular_idade(nascimento)
    (Time.now.to_s(:number).to_i - nascimento.to_time.to_s(:number).to_i)/10e9.to_i
  end

  def self.enviar_email_ao_admintir(unidade_origem, unidade_destino, processo)
    unidade_socioeducativa = UnidadeSocioeducativa.find(unidade_destino)
    unidade_socioeducativa_origem = UnidadeSocioeducativa.find(unidade_origem)
    titulo_email_unidade = unidade_socioeducativa.sigla + " - " + unidade_socioeducativa.nome

    # PROCURAR POR REGRA DE COMARCA
    configuracao_emails = Socioeduk::ConfiguracaoEmail.where(socioeduk_tipo_filtro_configuracao_email_id: 2)
    if configuracao_emails.length > 0
      configuracao_emails.each do |configuracao_email|
        # CARREGA AS VERIÁVEIS (PARAMETROS)
        nome_do_adolescente = processo.socioeduk_jovem_recepcao&.socioeduk_jovem.nome
        centro_socioeducativo_destino = unidade_socioeducativa.nome
        centro_socioeducativo_origem = unidade_socioeducativa_origem.nome
        nome_do_pai = processo.socioeduk_jovem_recepcao&.socioeduk_jovem.nome_pai
        nome_da_mae = processo.socioeduk_jovem_recepcao&.socioeduk_jovem.nome_mae
        data_nascimento = processo.socioeduk_jovem_recepcao&.socioeduk_jovem.data_nascimento
        naturalidade = processo.socioeduk_jovem_recepcao&.socioeduk_jovem&.cidade_naturalidade.nome
        idade = calcular_idade(data_nascimento)
        endereco = Socioeduk::EnderecoJovem.where(socioeduk_jovem_id: processo.socioeduk_jovem_recepcao&.socioeduk_jovem.id).last
        if(!endereco.nil?)
          if(!endereco&.cidade_id.nil?)
            cidade = Cidade.find(endereco&.cidade_id)
            endereco_cidade = cidade.nome
          end
          if(!endereco&.bairro_id.nil?)
            endereco_bairro = Bairro.find(endereco&.bairro_id).nome
          end
          endereco_rua = endereco&.rua
          endereco_numero = endereco&.numero
        end
        ato_infracionais = Socioeduk::ProcessoNatureza.where(processo_id: processo.id).order(:created_at)
        if(ato_infracionais.length > 0)
          ato_infracionais_string ="<p><strong>NATUREZA DO ATO INFRACIONAL</strong></p>"
          ato_infracionais_string += '<table width="100%" style="border:solid 1px #000;border-spacing: 0;">'
          cont = 0
          ato_infracionais_string += '<tr><th style="font-weight: bold;">#</th><th style="text-align: left;">Tipo Natureza</th><th style="text-align: left;">Nº Processo</th><th style="text-align: left;">Descrição</th></tr>'
          ato_infracionais.each do |ato_infracional|
            cont += 1
            ato_infracionais_string += '<tr>'
            ato_infracionais_string += '<td width="50px" style="border-bottom:solid 1px #000; text-align: center">'+cont.to_s+'º</td>'
            ato_infracionais_string += '<td style="border-bottom:solid 1px #000">'+ato_infracional.tipo_natureza+'</td>'
            ato_infracionais_string += '<td style="border-bottom:solid 1px #000">'+ato_infracional&.socioeduk_numero_processo.numero+'</td>'
            ato_infracionais_string += '<td style="border-bottom:solid 1px #000">'+ato_infracional&.socioeduk_artigo_infracao.descricao+'</td>'
            ato_infracionais_string += '</tr>'
          end
          ato_infracionais_string += '</table>'
        end
        numero_processo = Socioeduk::NumeroProcesso.where(socioeduk_processo_id: processo.id, principal: true).last
        data_apreensao = processo.data_hora_apreensao.strftime('%d/%m/%Y')
        vara = numero_processo&.socioeduk_comarca.nome
        comarca_de_origem = Cidade.find(processo.cidade_comarca).nome
        medida = Socioeduk::MedidaSocioeducativa.where(socioeduk_processo_id: processo.id).order(:id).last
        medida_socioeducativa = medida&.socioeduk_tipo_medida_socioeducativa&.descricao
        fim_previsto = medida&.fim_previsto.to_s
        audiencias = Socioeduk::Audiencia.where(socioeduk_processo_id: processo.id).order(:created_at)
        if(audiencias.length > 0)
          audiencias_string ="<p><strong>AUDIÊNCIAS</strong></p>"
          audiencias_string += '<table width="100%" style="border:solid 1px #000; border-spacing: 0;">'
          cont = 0
          audiencias_string += '<tr><th style="font-weight: bold;">#</th><th style="text-align: left;">Comarca</th><th style="text-align: left;">Data</th><th style="text-align: left;">Observação</th></tr>'
          audiencias.each do |audiencia|
            cont += 1
            audiencias_string += '<tr>'
            audiencias_string += '<td width="50px" style="border-bottom:solid 1px #000; text-align: center">'+cont.to_s+'º</td>'
            audiencias_string += '<td style="border-bottom:solid 1px #000">'+audiencia&.socioeduk_comarca.nome+'</td>'
            audiencias_string += '<td style="border-bottom:solid 1px #000">'+audiencia.datahora.to_s+'</td>'
            audiencias_string += '<td style="border-bottom:solid 1px #000">'+audiencia.observacao+'</td>'
            audiencias_string += '</tr>'
          end
          audiencias_string += '</table>'
        end
        observacoes = Socioeduk::ProcessoObservacao.where(socioeduk_processo_id: processo.id).order(:created_at)
        if(observacoes.length > 0)
          observacoes_string ="<p><strong>OBSERVAÇÕES</strong></p>"
          observacoes_string += '<table width="100%" style="border:solid 1px #000;border-spacing: 0;">'
          cont = 0
          observacoes_string += '<tr><th style="font-weight: bold;">#</th><th style="text-align: left;">Observação</th></tr>'
          observacoes.each do |observacao|
            cont += 1
            observacoes_string += '<tr>'
            observacoes_string += '<td width="50px" style="border-bottom:solid 1px #000; text-align: center">'+cont.to_s+'º</td>'
            observacoes_string += '<td style="border-bottom:solid 1px #000">'+observacao.observacao+'</td>'
            observacoes_string += '</tr>'
          end
          observacoes_string += '</table>'
        end
        # SUBSTITUIR AS VARIAVEIS DO E MAIL
        body = configuracao_email.body
        body = body.gsub('[nome_do_adolescente]',nome_do_adolescente)
        body = body.gsub('[centro_socioeducativo_origem]',centro_socioeducativo_origem)
        body = body.gsub('[centro_socioeducativo_destino]',centro_socioeducativo_destino)
        body = body.gsub('[nome_do_pai]',!nome_do_pai.nil? ? nome_do_pai : '')
        body = body.gsub('[nome_da_mae]',!nome_da_mae.nil? ? nome_da_mae : '')
        body = body.gsub('[data_nascimento]',data_nascimento.to_s)
        body = body.gsub('[naturalidade]',naturalidade)
        body = body.gsub('[idade]',idade.to_s)
        body = body.gsub('[endereco_rua]',!endereco_rua.nil? ? endereco_rua : '')
        body = body.gsub('[endereco_numero]',!endereco_numero.nil? ? endereco_numero : '')
        body = body.gsub('[endereco_bairro]',!endereco_bairro.nil? ? endereco_bairro : '')
        body = body.gsub('[endereco_cidade]',!endereco_cidade.nil? ? endereco_cidade : '')
        body = body.gsub('[certidao_positiva]',processo.pontuacao_certidao_positiva? ? 'SIM' : 'NÃO')#SIM/NAO
        body = body.gsub('[numero_processo]',numero_processo&.numero)
        body = body.gsub('[vara]',vara)
        body = body.gsub('[comarca_de_origem]',comarca_de_origem)
        body = body.gsub('[medida_socioeducativa]',!medida_socioeducativa.nil? ? medida_socioeducativa : '')
        body = body.gsub('[apreensao]',processo.pontuacao_apreendido? ? 'SIM' : 'NÃO')#SIM/NÃO
        body = body.gsub('[data_apreensao]', data_apreensao)
        body = body.gsub('[fim_previsto]',!fim_previsto.nil? ? fim_previsto : '')
        body = body.gsub('[lista_atos_infracionais]',!ato_infracionais_string.nil? ? ato_infracionais_string : '')
        body = body.gsub('[lista_audiencias]',!audiencias_string.nil? ? audiencias_string : '')
        body = body.gsub('[lista_observacoes]',!observacoes_string.nil? ? observacoes_string : '')
        body = body.gsub('[data_atual]', Time.now.strftime('%d/%m/%Y'))
        body_pdf =  body.gsub('<div', '<p')
        body_pdf =  body_pdf.gsub('</div', '</p')
        body_pdf =  body_pdf.gsub('>&nbsp;</p>', '>&nbsp;</p><br>')
        
        # GERANDO O PDF
        path = "docs/relatorios_pdf/"
        file_name = "ci_admissao_jovem_#{Time.now.strftime('%Y%m%d%H%M%S%L')}.pdf"
        PdfGenerator.ci_admissao_jovem(body_pdf, path, file_name)

        # GERANDO O CAMINHO DO ARQUIVO PARA ENVIAR EMAIL. O CAMINHO VAI EM ARRAY, PORQUE O METODO ENVIAR_EMAIL EXIGE UM ARRAI DE ANEXOS
        path_ci_admissao = path + file_name
        path_file_name = []
        path_file_name.push(path_ci_admissao)

        if (!body.blank? && !body.nil?)
          # ENVIAR EMAIL PARA PESSOAS
          configuracao_email_pessoas = Socioeduk::ConfiguracaoEmailPessoa.where(socioeduk_configuracao_email_id: configuracao_email.id)
          emails = []
          if configuracao_email_pessoas.length > 0
            configuracao_email_pessoas.each do |configuracao_email_pessoa|
              emails.push(configuracao_email_pessoa.email)
            end
            EnviarEmailMailer.enviar_email(emails, body, 'Admissão na Unidade '+titulo_email_unidade, path_file_name).deliver_now!
          end
          # ENVIAR PARA EMAIL PARA FUNÇÃO
          configuracao_email_funcoes = Socioeduk::ConfiguracaoEmailFuncao.where(socioeduk_configuracao_email_id: configuracao_email.id)
          funcoes = []
          if configuracao_email_funcoes.length > 0
            configuracao_email_funcoes.each do |configuracao_email_funcao|
              funcao_pessoas = FuncaoPessoa.where(funcao_id: configuracao_email_funcao.funcao_id)
              funcao_pessoas.each do |funcao_pessoa|
                funcoes.push(funcao_pessoa.pessoa.email_pessoal)
              end
            end
            EnviarEmailMailer.enviar_email(funcoes, body, 'Admissão na Unidade '+titulo_email_unidade, path_file_name).deliver_now!
          end
          # ENVIAR PARA EMAIL PARA AREA DESTINO
          configuracao_email_areas = Socioeduk::ConfiguracaoEmailArea.where(socioeduk_configuracao_email_id: configuracao_email.id)
          areas = []
          if configuracao_email_areas.length > 0
            configuracao_email_areas.each do |configuracao_email_area|
              unidade_socioeducativa_areas = UnidadeSocioeducativaArea.where(area_id: configuracao_email_area.area_id, unidade_socioeducativa_id: unidade_destino)
              unidade_socioeducativa_areas.each do |unidade_socioeducativa_area|
                areas.push(unidade_socioeducativa_area.email)
              end
            end
            EnviarEmailMailer.enviar_email(areas, body, 'Admissão na Unidade '+titulo_email_unidade, path_file_name).deliver_now!
          end
          # ENVIAR PARA EMAIL DE AREA ORIGEM PARA AREA DESTINO
          configuracao_email_areas = Socioeduk::ConfiguracaoEmailArea.where(socioeduk_configuracao_email_id: configuracao_email.id)
          areas = []
          if configuracao_email_areas.length > 0
            configuracao_email_areas.each do |configuracao_email_area|
              unidade_socioeducativa_areas = UnidadeSocioeducativaArea.where(area_id: configuracao_email_area.area_id, unidade_socioeducativa_id: unidade_origem)
              unidade_socioeducativa_areas.each do |unidade_socioeducativa_area|
                areas.push(unidade_socioeducativa_area.email)
              end
            end
            EnviarEmailMailer.enviar_email(areas, body, 'Transferencia para Unidade '+titulo_email_unidade, path_file_name).deliver_now!
          end
        end
      end
    end
  end

  def self.enviar_email_ao_autorizar_vaga(solicitacao_vaga, configuracao_email_id, email_text, nome_juiz, array_arquivos_path = nil)
    # PROCURAR POR REGRA DE COMARCA
    configuracao_email = Socioeduk::ConfiguracaoEmail.find(configuracao_email_id)
    # CARREGA AS VERIÁVEIS (PARAMETROS)
    nome_do_adolescente = solicitacao_vaga.nome
    nome_da_mae = solicitacao_vaga.nome_mae
    data_nascimento = solicitacao_vaga.data_nascimento
    tipo_medida = solicitacao_vaga&.tipo_medida_socioeducativa&.descricao
    comarca = Cidade.find(solicitacao_vaga.cidade_comarca).nome
    # SUBSTITUIR O TEXTO DO E MAIL
    body = email_text
    body = body.gsub('[nome_do_juiz]',nome_juiz.to_s)
    body = body.gsub('[nome_do_adolescente]', nome_do_adolescente.to_s)
    body = body.gsub('[nome_da_mae]',nome_da_mae)
    body = body.gsub('[data_nascimento]',data_nascimento.to_s)
    body = body.gsub('[tipo_medida]',tipo_medida)
    body = body.gsub('[comarca]',comarca.to_s)
    if (!body.blank? && !body.nil?)
      # ENVIAR EMAIL PARA PESSOAS
      configuracao_email_pessoas = Socioeduk::ConfiguracaoEmailPessoa.where(socioeduk_configuracao_email_id: configuracao_email.id)
      emails = []
      if configuracao_email_pessoas.length > 0
        configuracao_email_pessoas.each do |configuracao_email_pessoa|
          emails.push(configuracao_email_pessoa.email)
        end
        EnviarEmailMailer.enviar_email(emails, body, 'SEAS - Vaga Liberada', array_arquivos_path).deliver_now!
      end
      # ENVIAR PARA EMAIL PARA FUNÇÃO
      configuracao_email_funcoes = Socioeduk::ConfiguracaoEmailFuncao.where(socioeduk_configuracao_email_id: configuracao_email.id)
      funcoes = []
      if configuracao_email_funcoes.length > 0
        configuracao_email_funcoes.each do |configuracao_email_funcao|
          funcao_pessoas = FuncaoPessoa.where(funcao_id: configuracao_email_funcao.funcao_id)
          funcao_pessoas.each do |funcao_pessoa|
            funcoes.push(funcao_pessoa.pessoa.email_pessoal)
          end
        end
        EnviarEmailMailer.enviar_email(funcoes, body, 'SEAS - Vaga Liberada', array_arquivos_path).deliver_now!
      end
      # ENVIAR PARA EMAIL PARA AREA
      configuracao_email_areas = Socioeduk::ConfiguracaoEmailArea.where(socioeduk_configuracao_email_id: configuracao_email.id)
      areas = []
      if configuracao_email_areas.length > 0
        configuracao_email_areas.each do |configuracao_email_area|
          unidade_socioeducativa_areas = UnidadeSocioeducativaArea.where(area_id: configuracao_email_area.area_id, unidade_socioeducativa_id: unidade)
          unidade_socioeducativa_areas.each do |unidade_socioeducativa_area|
            areas.push(unidade_socioeducativa_area.email)
          end
        end
        EnviarEmailMailer.enviar_email(areas, body, 'SEAS - Vaga Liberada', array_arquivos_path).deliver_now!
      end
      # #ENVIAR EMAIL PARA O JUIZ
      # usuario = Usuario.find(solicitacao_vaga.usuario_id)
      # if(!usuario.email.nil?)
      #   EnviarEmailMailer.enviar_email(usuario.email, body, 'SEAS - Vaga Liberada', array_arquivos_path).deliver_now!
      # end

      # ENVIAR EMAIL PARA O JUIZ
      juiz_e_apoio = []
      pessoa = PessoaJuiz.where(usuario_id: solicitacao_vaga.usuario_id).first
      # SE juiz_id É NULO ENTAO A PESSOA É O PROPRIO JUIZ, CASO CONTRARIO A PESSOA É UM APOIO POIS ESTA LIGADA A UM JUIZ
      if(pessoa.juiz_id.nil?)
        # LISTAR TODOS OS APOIOS DE UM JUIZ
        listar_apoio = PessoaJuiz.where(juiz_id: pessoa.juiz_id)
        listar_apoio.each do | pessoa_juiz |
          juiz_e_apoio.push(pessoa_juiz.usuario.email)
        end
      else
        listar_juiz = PessoaJuiz.find(pessoa.juiz_id)
        juiz_e_apoio.push(listar_juiz.usuario.email)
      end
      juiz_e_apoio.push(pessoa.usuario.email)
      # raise juiz_e_apoio.inspect
      if juiz_e_apoio.length > 0
        EnviarEmailMailer.enviar_email(juiz_e_apoio, body, 'SEAS - Vaga Liberada', array_arquivos_path).deliver_now!
      end
    end
  end

  def self.enviar_email_ao_negar_vaga(solicitacao_vaga, configuracao_email_id, email_text, nome_juiz)
    # PROCURAR POR REGRA DE COMARCA
    configuracao_email = Socioeduk::ConfiguracaoEmail.find(configuracao_email_id)

    # CARREGA AS VERIÁVEIS (PARAMETROS)
    nome_do_adolescente = solicitacao_vaga.nome
    nome_da_mae = solicitacao_vaga.nome_mae
    data_nascimento = solicitacao_vaga.data_nascimento
    tipo_medida = solicitacao_vaga&.tipo_medida_socioeducativa&.descricao
    comarca = Cidade.find(solicitacao_vaga.cidade_comarca).nome
    # SUBSTITUIR O TEXTO DO E MAIL
    body = email_text
    body = body.gsub('[nome_do_juiz]',nome_juiz.to_s)
    body = body.gsub('[nome_do_adolescente]',nome_do_adolescente)
    body = body.gsub('[nome_da_mae]',nome_da_mae)
    body = body.gsub('[data_nascimento]',data_nascimento.to_s)
    body = body.gsub('[tipo_medida]',tipo_medida)
    body = body.gsub('[comarca]',comarca)
    
    if (!body.blank? && !body.nil?)
      # ENVIAR EMAIL PARA PESSOAS
      configuracao_email_pessoas = Socioeduk::ConfiguracaoEmailPessoa.where(socioeduk_configuracao_email_id: configuracao_email.id)
      emails = []
      if configuracao_email_pessoas.length > 0
        configuracao_email_pessoas.each do |configuracao_email_pessoa|
          emails.push(configuracao_email_pessoa.email)
        end
        EnviarEmailMailer.enviar_email(emails, body, 'SEAS - Aguardando Vagas').deliver_now!
      end
      # ENVIAR PARA EMAIL PARA FUNÇÃO
      configuracao_email_funcoes = Socioeduk::ConfiguracaoEmailFuncao.where(socioeduk_configuracao_email_id: configuracao_email.id)
      funcoes = []
      if configuracao_email_funcoes.length > 0
        configuracao_email_funcoes.each do |configuracao_email_funcao|
          funcao_pessoas = FuncaoPessoa.where(funcao_id: configuracao_email_funcao.funcao_id)
          funcao_pessoas.each do |funcao_pessoa|
            funcoes.push(funcao_pessoa.pessoa.email_pessoal)
          end
        end
        EnviarEmailMailer.enviar_email(funcoes, body, 'SEAS - Aguardando Vagas').deliver_now!
      end
      # ENVIAR PARA EMAIL PARA AREA
      configuracao_email_areas = Socioeduk::ConfiguracaoEmailArea.where(socioeduk_configuracao_email_id: configuracao_email.id)
      areas = []
      if configuracao_email_areas.length > 0
        configuracao_email_areas.each do |configuracao_email_area|
          unidade_socioeducativa_areas = UnidadeSocioeducativaArea.where(area_id: configuracao_email_area.area_id, unidade_socioeducativa_id: unidade)
          unidade_socioeducativa_areas.each do |unidade_socioeducativa_area|
            areas.push(unidade_socioeducativa_area.email)
          end
        end
        EnviarEmailMailer.enviar_email(areas, body, 'SEAS - Aguardando Vagas').deliver_now!
      end
      #ENVIAR EMAIL PARA O JUIZ
      usuario = Usuario.find(solicitacao_vaga.usuario_id)
      if(!usuario.email.nil?)
        EnviarEmailMailer.enviar_email(usuario.email, body, 'SEAS - Aguardando Vagas').deliver_now!
      end
    end
  end

  def self.intervalo_de_data_por_extenso(data_inicial, data_final)
    intervalo_data = (Date.parse(data_final.strftime('%d/%m/%Y')) - Date.parse(data_inicial.strftime('%d/%m/%Y'))).to_f
    anos = (intervalo_data/(30*12)).to_i
    meses = (intervalo_data/30).to_i
    meses_restante = meses - (anos*12)
    dias = intervalo_data - (meses * 30)
    anos > 1 ? text_ano = " anos ": text_ano = " ano "
    meses_restante > 1 ? text_mes = " meses ": text_mes = " mês "
    dias > 1 ? text_dia = " dias ": text_dia = " dia "
    texto = anos.to_s + text_ano + meses_restante.to_s + text_mes + " e " + dias.round(0).to_s + text_dia
  end
end
