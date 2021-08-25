class EnviarEmailMailer < ApplicationMailer
    default from: 'assistente.virtual@seas.ce.gov.br'

    def solicitar_transporte(dados)
        @email = dados[:email]
        @solicitacao = dados[:solicitacao]
        mail(from: 'transporte@seas.ce.gov.br', to: @email, subject: 'Solicitação de Transporte')
    end

    def autorizar_transporte(dados)
        @email = dados[:email]
        @solicitacao = dados[:solicitacao]
        mail(from: 'transporte@seas.ce.gov.br', to: @email, subject: 'Solicitação de Transporte Autorizada')
    end
    
    def cancelar_transporte(dados)
        @email = dados[:email]
        @solicitacao = dados[:solicitacao]
        mail(from: 'transporte@seas.ce.gov.br', to: @email, subject: 'Solicitação de Transporte Cancelada')
    end
    
    def gerar_mapa_bordo(dados)
        @email = dados[:email]
        @solicitacao = dados[:solicitacao]
        mail(from: 'transporte@seas.ce.gov.br', to: @email, subject: 'Mapa de bordo')
    end

    def autorizar_solicitacao_vaga(dados)
        @email = dados[:dados_solicitacao].usuario.email
        @jovem = dados[:dados_solicitacao].nome
        @status_solicitacao = dados[:dados_solicitacao].status
        @medida_socioeducativa = dados[:dados_solicitacao].tipo_medida_socioeducativa.descricao
        mail(to: @email, subject: 'Solicitação Autorizada')
    end

    def cadastrar_demanda_trello(dados)
        @email = "nonatojr_007+qkttwd4fdc3we2upo6h3@boards.trello.com"
        @dados_demanda = dados[:solicitacao]
        mail(to: @email, subject: @dados_demanda.titulo)
    end

    def enviar_email(emails, texto_email, titulo, anexos_path = nil)
        if(!emails.index(',').nil?)
            lista_emails = emails.join(',')
        else
            lista_emails = emails
        end
        @texto_email = texto_email

        # if(!anexos_path.nil?)
        #     array = anexos_path.split("/")
        #     file_name = array[array.length - 1]
        #     attachments[file_name] = File.read("#{Rails.root}/#{anexos_path}")
        # end

        if(!anexos_path.nil?)
            anexos_path.each do |anexo_path|
                array = anexo_path.split("/")
                file_name = array[array.length - 1]
                new_anexo_path = anexo_path.split("?")
                attachments[file_name] = File.read("#{Rails.root}/#{new_anexo_path[0]}")
            end
        end
        mail(to: lista_emails, subject: titulo)
    end

end
