module Bairros
  def self.popular
    puts "Iniciando configuração de emails ..."
    #CONFIGURAR A FINCIONALIDADE DE ENVIO DE EMAIL
    comarca_especifica = '<table style="width: 100%;">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Descrição</th>
            <th scope="col">Dados</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Nome do Jovem</td>
            <td>[nome_do_adolescente]</td>
        </tr>
        <tr>
            <td>Comarca de origem</td>
            <td>[comarca_de_origem]</td>
        </tr>
        <tr>
            <td>Medida Socioeducativa</td>
            <td>[medida_socioeducativa]</td>
        </tr>
        <tr>
            <td>Início</td>
            <td>[data_inicio]</td>
        </tr>
        <tr>
            <td>Fim</td>
            <td>[data_fim]</td>
        </tr>
        <tr>
            <td>Tempo de cumprimento</td>
            <td>[tempo_de_cumprimento]</td>
        </tr>
        <tr>
            <td>Motivo de conclusão</td>
            <td>[motivo_de_conclusao]</td>
        </tr>
        <tr>
            <td>Encaminhado para</td>
            <td>[encaminhado_para]</td>
        </tr>
    </tbody>
</table>'

admitir_na_unidade = '<table style="width: 100%;">
<thead class="thead-dark">
    <tr>
        <th scope="col">Descrição</th>
        <th scope="col">Dados</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td>Nome do Jovem</td>
        <td>[nome_do_adolescente]</td>
    </tr>
    <tr>
        <td>Centro Socioeducativo Origem</td>
        <td>[centro_socioeducativo_origem]</td>
    </tr>
    <tr>
        <td>Centro Socioeducativo Destino</td>
        <td>[centro_socioeducativo_destino]</td>
    </tr>
    <tr>
        <td>Nome do Pai</td>
        <td>[nome_do_pai]</td>
    </tr>
    <tr>
        <td>Nome da Mãe</td>
        <td>[nome_da_mae]</td>
    </tr>
    <tr>
        <td>Data de Nascimento</td>
        <td>[data_nascimento]</td>
    </tr>
    <tr>
        <td>Naturalidade</td>
        <td>[naturalidade]</td>
    </tr>
    <tr>
        <td>Idade</td>
        <td>[idade]</td>
    </tr>
    <tr>
        <td>Rua</td>
        <td>[endereco_rua]</td>
    </tr>
    <tr>
        <td>Número</td>
        <td>[endereco_numero]</td>
    </tr>
    <tr>
        <td>Bairro</td>
        <td>[endereco_bairro]</td>
    </tr>
    <tr>
        <td>Cidade</td>
        <td>[endereco_cidade]</td>
    </tr>
    <tr>
        <td>Certidão Positiva (Sim ou Não)</td>
        <td>[certidao_positiva]</td>
    </tr>
    <tr>
        <td>Número do Processo</td>
        <td>[numero_processo]</td>
    </tr>
    <tr>
        <td>Comarca de Origem</td>
        <td>[comarca_de_origem]</td>
    </tr>
    <tr>
        <td>Medida Socioeducativa</td>
        <td>[medida_socioeducativa]</td>
    </tr>
    <tr>
        <td>Apreensão (Sim ou Não)</td>
        <td>[apreensao]</td>
    </tr>
    <tr>
        <td>Fim Previsto</td>
        <td>[fim_previsto]</td>
    </tr>
    <tr>
        <td>Data da Apreensão</td>
        <td>[data_apreensao]</td>
    </tr>
    <tr>
        <td>Data Atual</td>
        <td>[data_atual]</td>
    </tr>
    <tr>
        <td>Vara</td>
        <td>[vara]</td>
    </tr>
    <tr>
        <td>Atos Infracionais</td>
        <td>[lista_atos_infracionais]</td>
    </tr>
    <tr>
        <td>Audiências</td>
        <td>[lista_audiencias]</td>
    </tr>
    <tr>
        <td>Observações</td>
        <td>[lista_observacoes]</td>
    </tr>
    </tbody>
</table>'


autorizar_negar_vaga = '<table style="width: 100%;">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Descrição</th>
            <th scope="col">Dados</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Nome do Juíz</td>
            <td>[nome_do_juiz]</td>
        </tr>
        <tr>
            <td>Nome do Jovem</td>
            <td>[nome_do_adolescente]</td>
        </tr>
        <tr>
            <td>Nome da Mãe</td>
            <td>[nome_da_mae]</td>
        </tr>
        <tr>
            <td>Data de Nascimento</td>
            <td>[data_nascimento]</td>
        </tr>
        <tr>
            <td>Tipo de medida</td>
            <td>[tipo_medida]</td>
        </tr>
        <tr>
            <td>Comarca</td>
            <td>[comarca]</td>
        </tr>
    </tbody>
</table>'
    Socioeduk::TipoAcaoConfiguracaoEmail.find_or_create_by(id: 1, descricao: "Ação executada após finalizar um processo, que ocorre quando o adolescente é liberado das instalações da instuituição", nome: "Ao finalizar um processo")
    Socioeduk::TipoAcaoConfiguracaoEmail.find_or_create_by(id: 2, descricao: "Ação executada após adolescente ingressar dentro do sistema  por meio da Admissão ou Admissão Direta", nome: "Ao admitir na unidade")
    Socioeduk::TipoAcaoConfiguracaoEmail.find_or_create_by(id: 3, descricao: "Ação executada após a CRV autorizar ou negar a solicitação feita pelo juíz", nome: "Ao Manter Solicitação de Vaga")
    Socioeduk::TipoFiltroConfiguracaoEmail.find_or_create_by(id: 1, socioeduk_tipo_acao_configuracao_email_id: 1, descricao: "Representa a comarca de um município", nome: "Comarca").update(id: 1, parametros: comarca_especifica)
    Socioeduk::TipoFiltroConfiguracaoEmail.find_or_create_by(id: 2, socioeduk_tipo_acao_configuracao_email_id: 2, descricao: "Executa a ação após clicar no botão salvar da tela de admissão direta ou admitir adolescentre na unidade", nome: "Salvar").update(id: 2, parametros: admitir_na_unidade)
    Socioeduk::TipoFiltroConfiguracaoEmail.find_or_create_by(id: 3, socioeduk_tipo_acao_configuracao_email_id: 3, descricao: "Executa a ação após clicar no botão Autorizar Vaga", nome: "Autorizar Vaga").update(id: 3, parametros: autorizar_negar_vaga)
    Socioeduk::TipoFiltroConfiguracaoEmail.find_or_create_by(id: 4, socioeduk_tipo_acao_configuracao_email_id: 3, descricao: "Executa a ação após clicar no botão Aguardar Vaga", nome: "Aguardar Vaga").update(id: 4, parametros: autorizar_negar_vaga)
    puts "Fim de configuração de emails ..."
  end
end