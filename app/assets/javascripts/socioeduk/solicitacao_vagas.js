function atualizar_infracao_continuado_solicitacao_vaga(elementoid) {

    valor_linha = elementoid.id
    valor_linha = valor_linha.replace("socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_", "");
    valor_linha = valor_linha.replace("_pontuacao_continuado", "");

    elementoIdInfracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_artigo_infracao_id";
    elementoIdContinuado = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_pontuacao_continuado";

    if ($(elementoIdContinuado).is(':checked'))
        $(elementoIdInfracao).attr("continuado", "true");
    else
        $(elementoIdInfracao).attr("continuado", "false");

    carregarCalculoSolicitacao();
}


function atualizar_infracao_estupro_vulneravel_solicitacao_vaga(elemento) {

    valor_linha = elemento.id
    valor_linha = valor_linha.replace("socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_", "");
    valor_linha = valor_linha.replace("_estupro_vulneravel", "");

    elementoIdInfracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_artigo_infracao_id";
    elementoIdVulneravel = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_estupro_vulneravel";

    if ($(elementoIdVulneravel).is(':checked'))
        $(elementoIdInfracao).attr("vulneravel", "true");
    else
        $(elementoIdInfracao).attr("vulneravel", "false");

    carregarCalculoSolicitacao();
}

function atualizar_tipo_natureza_solicitacao_vaga(elementoid) {
    valor_linha = elementoid.id
    valor_linha = valor_linha.replace("socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_", "");
    valor_linha = valor_linha.replace("_tipo_natureza_consumada", "");
    valor_linha = valor_linha.replace("_tipo_natureza_tentada", "");

    elementoIdInfracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_artigo_infracao_id";

    elementoIdNaturezaConsumada = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_tipo_natureza_consumada";
    elementoIdNaturezaTentada = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_tipo_natureza_tentada";

    if ($(elementoIdNaturezaConsumada).prop("checked")) {
        $(elementoIdInfracao).attr("tipo_natureza", "Consumada");
    }

    if ($(elementoIdNaturezaTentada).prop("checked")) {
        $(elementoIdInfracao).attr("tipo_natureza", "Tentada");
    }

    carregarCalculoSolicitacao();
}

function atualizar_reiteracao_solicitacao_vaga(elemento) {
    valor_linha = elemento.id
    valor_linha = valor_linha.replace("socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_", "");
    valor_linha = valor_linha.replace("_pontuacao_reinteracao", "");
    console.log("linha: " + valor_linha);

    elementoIdInfracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_artigo_infracao_id";
    elementoIdReiteracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_pontuacao_reinteracao";
    elementoQtdreiteracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_pontuacao_quantidade_reinteracao";

    if ($(elementoIdReiteracao).is(':checked')) {
        $(elementoQtdreiteracao).focus();
        $(elementoQtdreiteracao).val('1')
        $(elementoIdInfracao).attr("qtd_reiteracao", "1");
    }
    else {
        $(elementoQtdreiteracao).val('');
        $(elementoIdInfracao).attr("qtd_reiteracao", "");
    }

    carregarCalculoSolicitacao();
}

function atualizar_qtd_reiteracao_solicitacao_vaga(elemento) {
    valor_linha = elemento.id
    valor_linha = valor_linha.replace("socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_", "");
    valor_linha = valor_linha.replace("_pontuacao_quantidade_reinteracao", "");
    console.log(valor_linha);

    elementoIdInfracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_artigo_infracao_id";
    elementoIdReiteracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_pontuacao_reinteracao";
    elementoQtdreiteracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_pontuacao_quantidade_reinteracao";

    if ($(elementoQtdreiteracao).val() > 0) {
        if ($(elementoIdReiteracao).is(':checked')) {
            $(elementoIdInfracao).attr("qtd_reiteracao", $(elementoQtdreiteracao).val());
        }
        else {
            $(elementoQtdreiteracao).val('');
            $(elementoIdInfracao).attr("qtd_reiteracao", "");
        }

        carregarCalculoSolicitacao();
    }
}

function atualizar_certidao_positiva_silicitacao() {
    if ($('#socioeduk_solicitacao_vaga_pontuacao_certidao_positiva').is(':checked')) {
        $('#socioeduk_solicitacao_vaga_pontuacao_quantidade_certidao_positiva').focus();
        $('#socioeduk_solicitacao_vaga_pontuacao_quantidade_certidao_positiva').val('1')
    }
    else
        $('#socioeduk_solicitacao_vaga_pontuacao_quantidade_certidao_positiva').val('');

    carregarCalculoSolicitacao();
}

function atualizar_qtd_certidao_positiva_silicitacao() {
    if ($('#socioeduk_solicitacao_vaga_pontuacao_quantidade_certidao_positiva').val() > 0) {
        carregarCalculoSolicitacao();
    }
}

function ativar_estupro_vulneravel_solicitacao_vaga(elemento) {
    valor_linha = elemento.id
    valor_linha = valor_linha.replace("socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_", "");
    valor_linha = valor_linha.replace("_artigo_infracao_id", "");

    elementoIdInfracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_artigo_infracao_id";
    elementoIdvulneravel = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_estupro_vulneravel";

    if ($(elementoIdInfracao + " option:selected").text().toLowerCase().indexOf('estupro') >= 0)
        $(elementoIdvulneravel).show();
    else {
        $(elementoIdvulneravel).hide();
        $(elementoIdvulneravel).prop("checked", false);
    }
    ativar_compo_outra_infracao(elemento.id, valor_linha);
}

function ativar_compo_outra_infracao(elemento_id, valor_linha) {
    valor_linha_outra_infracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_outra_infracao";

    if ($("#" + elemento_id + " option:selected").text() == "Outros")
        $(valor_linha_outra_infracao).show();
    else
        $(valor_linha_outra_infracao).hide();
}

function ativar_desativar_estupro_vulneravel_solicitacao_vaga() {
    setTimeout(function () {
        $("#lista_processo_natureza fieldset input").each(function () {
            valor_linha = this.id
            valor_linha = valor_linha.replace("socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_", "");
            valor_linha = valor_linha.replace("_estupro_vulneravel", "");

            elementoIdInfracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_artigo_infracao_id";
            elementoIdvulneravel = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_estupro_vulneravel";

            if ($(elementoIdInfracao + " option:selected").text().toLowerCase().indexOf('estupro') >= 0)
                $(elementoIdvulneravel).show();
            else {
                $(elementoIdvulneravel).hide();
                $(elementoIdvulneravel).prop("checked", false);
            }
        });
    }, 1);
}


function carregarCalculoSolicitacao() {
    setTimeout(gerarCalculoSolicitacao, 0);
}

function gerarCalculoSolicitacao() {
  ativar_desativar_estupro_vulneravel_solicitacao_vaga();
  setTimeout(function () {
    var calc = 0;
    // Constantes
    c = 0.05; // Ponderação Certidão Positiva (%)
    a = 10; // Ponderação Apreendido
    o = 10; //Organização Criminosa
    //Variaveis
    var calc_descumprimento_medida = 0;
    var calc_organizacao_criminosa = 0;
    var calc_tipo_natureza = 0;
    var calc_continuado = 0;
    var calc_vulneravel = 0;
    var calc_reiteracao = 0;
    var certidao_positiva = 0;
    var apreendido = 0;

    /*PERCORRE TODOS AS NATUREZAS PARA
    //ASSINAR O ATRIBUTO "VULNERAVEL" DO CAMPO socioeduk_artigo_infracao_id
    //DE SUA RESPECTIVA LINHA*/
    $("#lista_processo_natureza fieldset input").each(function () {
      var vulneravel = $(this).attr('vulneravel');
      if (vulneravel == "SIM") {
        if ($(this).prop("checked")) {
          $(this).show();
          valor_linha = this.id;
          valor_linha = valor_linha.replace("socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_", "");
          valor_linha = valor_linha.replace("_estupro_vulneravel", "");
          elementoIdInfracao = "#socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_" + valor_linha + "_artigo_infracao_id";
          $(elementoIdInfracao).attr("vulneravel", "true");
        }
      }
    });
    /**PERCORRE A NATUREZA PARA REALIZAR O CALCULO */
    $("#lista_processo_natureza fieldset select").each(function () {
      var tem_ponderacao = $(this).attr('ponderacao');
      if (tem_ponderacao == "SIM") {
        var id = $(this).val();
        var ponderacao = buscar_pontuacao_por_id(id);
        var tipo_natureza = $(this).attr('tipo_natureza')

        if (tipo_natureza == "Consumada") {
          console.log('Consumada: '+ponderacao)
          calc_tipo_natureza += ponderacao;
        }
        else if (tipo_natureza == "Tentada") {
          console.log('Tentada: '+ponderacao - (ponderacao * 0.3))
          calc_tipo_natureza += ponderacao - (ponderacao * 0.3);
        }
        //CRIME CONTINUADO
        if ($(this).attr('continuado') == 'true') {
          console.log('continuado: '+ponderacao * 0.3)
          calc_continuado += ponderacao * 0.3;
        }
        //ESTUPRO DE VULNERÁVEL
        if ($(this).attr('vulneravel') == 'true') {
          console.log('vulneravel: '+ponderacao * 0.5)
          calc_vulneravel += ponderacao * 0.5;
        }
        //REINTERAÇÃO
        if ($(this).attr('qtd_reiteracao') != null && $(this).attr('qtd_reiteracao') > 0) {
          var qtd_reiteracao = $(this).attr('qtd_reiteracao');
          calc_reiteracao += (ponderacao * 0.1 * qtd_reiteracao);
          console.log('reinteracao: '+ponderacao * 0.1 * qtd_reiteracao)
        }
      }
    });

    
    // CALCULO BASE DO ATO
    calc += calc_tipo_natureza + calc_continuado + calc_reiteracao;
    calc -= calc_vulneravel;
    
    // CERTIDÃO POSITIVA
    if ($("#socioeduk_solicitacao_vaga_pontuacao_certidao_positiva").is(':checked')) {
      if ($('#socioeduk_solicitacao_vaga_pontuacao_quantidade_certidao_positiva').val() == '') {
        $('#socioeduk_solicitacao_vaga_pontuacao_quantidade_certidao_positiva').val('1')
      }
      if ($('#socioeduk_solicitacao_vaga_pontuacao_quantidade_certidao_positiva').val() > 0) {
        total = 0;
        quantidade = $('#socioeduk_solicitacao_vaga_pontuacao_quantidade_certidao_positiva').val();
        for(i = 1; i <= quantidade; i++){
          total += calc * c;
        }
        certidao_positiva += total;
        console.log('calc_certidao_positiva: '+total);
      }
    }

    // APREENDIDO
    if ($("#socioeduk_solicitacao_vaga_pontuacao_apreendido").is(':checked')){
      apreendido += a;
      console.log('Apreendido: ' + a);
    }

    // ORGANIZAÇÃO CRIMINOSA
    if ($("#socioeduk_solicitacao_vaga_pontuacao_organizacao_criminosa").is(':checked')){
      calc_organizacao_criminosa += o;
      console.log('organização criminosa: '+o);
    }

    // DESCUMPRIMENTO DE MEDIDA
    if ($("#socioeduk_solicitacao_vaga_pontuacao_descumprimento_medida").is(':checked')) {
      calc_descumprimento_medida += (calc * 0.1);
      console.log('calc_descumprimento_medida: '+calc * 0.1)
    }

    calc += certidao_positiva + calc_descumprimento_medida;
    calc += calc_organizacao_criminosa;
    calc += apreendido;

    $('#resultado_pontuacao').html(calc);
    toastr.options = {
      "closeButton": true,
      "debug": false,
      "progressBar": true,
      "preventDuplicates": true,
      "positionClass": "toast-top-right",
      "onclick": null,
      "showDuration": "400",
      "hideDuration": "1000",
      "timeOut": "20000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }
    // toastr.info(calc.toFixed(2), "Pontuação");
    $('#resultado_pontuacao').html(calc.toFixed(2));
  }, 0);
}

function liberar_botao_salvar() {
    if ($('#lista_processo_natureza fieldset select').length > 0) {

        validar_processo_natureza = false;
        validar_artigo_infracao = false;
        validar_tipo_natureza = false;
        $('#lista_processo_natureza fieldset select').each(function () {
            //PROCURA PELO CAMPO INFRAÇÃO
            if (this.id.indexOf('artigo_infracao_id') > 0) {
                if ($(this).val() == "")
                    validar_artigo_infracao = true;
                return;
            }
        });

        true_validar_tipo_natureza = false;
        false_validar_tipo_natureza = false;
        $('#lista_processo_natureza fieldset input').each(function () {
            //PROCURA PELO CAMPO NUMERO DO PROCESSO
            if (this.id.indexOf('tipo_natureza_tentada') > 0) {
                if ($(this).is(":checked"))
                    true_validar_tipo_natureza = true;
                else true_validar_tipo_natureza = false;
            }
            if (this.id.indexOf('tipo_natureza_consumada') > 0) {
                if ($(this).is(":checked"))
                    false_validar_tipo_natureza = true;
                else false_validar_tipo_natureza = false;
            }
        });
        if (!true_validar_tipo_natureza && !false_validar_tipo_natureza) {
            validar_tipo_natureza = true
        }

        true_validar_tipo_natureza = false;
        false_validar_tipo_natureza = false;

        //LIBERAR MENSAGEM DO VALIDADOS
        if (validar_artigo_infracao)
            $('#validar_natureza_infracao_processo').fadeIn().css('display', 'block');
        else
            $('#validar_natureza_infracao_processo').fadeOut().removeClass('displaytype');


        //LIBERAR MENSAGEM DO TIPO NATUREZA
        if (validar_tipo_natureza)
            $('#validar_tipo_natureza').fadeIn().css('display', 'block');
        else
            $('#validar_tipo_natureza').fadeOut().removeClass('displaytype');

        //LIBERAR BOTÃO DE SALVAR
        if (!validar_artigo_infracao && !validar_processo_natureza && !validar_tipo_natureza)
            $('#botao_salvar').prop("disabled", false);
        else
            $('#botao_salvar').prop("disabled", true);
    }
}

// Selecionar pelo campo metódo tabela

$(function () {
    $("#tabela input").on('keyup change', function () {
        var index = $(this).parent().index();
        var nth = "#tabela td:nth-child(" + (index + 1).toString() + ")";
        var valor = $(this).val().toUpperCase();
        $("#tabela tbody tr").show();
        $(nth).each(function () {
            if ($(this).text().toUpperCase().indexOf(valor) < 0) {
                $(this).parent().hide();
            }
        });
    });

    $("#tabela input").blur(function () {
        $(this).val("");
    });
});

semilib = false;
function semiliberdade_btn() {
    $("#txtColuna5").val('SEMILIBERDADE ');
    $("#txtColuna5").trigger("change");

    if (!semilib) {
        $('#semiliberdade').removeClass('btn-success').addClass('btn-primary');
        $('#semiliberdade').text('Limpar');
        semilib = true;
    }
    else {
        $('#semiliberdade').removeClass('btn-primary').addClass('btn-success');
        $('#semiliberdade').text('Semiliberdade');
        $("#txtColuna5").val('');
        $("#txtColuna5").trigger("change");
        semilib = false;
    };
};

interna = false;
function internacao_btn() {
    $("#txtColuna5").val('INTERNAÇÃO  ');
    $("#txtColuna5").trigger("change");

    if (!interna) {
        $('#internacao').removeClass('btn-success').addClass('btn-primary');
        $('#internacao').text('Limpar');
        interna = true;
    }
    else {
        $('#internacao').removeClass('btn-primary').addClass('btn-success');
        $('#internacao').text('Internação');
        $("#txtColuna5").val('');
        $("#txtColuna5").trigger("change");
        interna = false;
    };
};

internacaoProv = false;
function internacaoProvisoria_btn() {
    $("#txtColuna5").val('INTERNAÇÃO PROVISÓRIA');
    $("#txtColuna5").trigger("change");

    if (!internacaoProv) {
        $('#internacaoProvisoria').removeClass('btn-success').addClass('btn-primary');
        $('#internacaoProvisoria').text('Limpar');
        internacaoProv = true;
    }
    else {
        $('#internacaoProvisoria').removeClass('btn-primary').addClass('btn-success');
        $('#internacaoProvisoria').text('Internação Provisória');
        $("#txtColuna5").val('');
        $("#txtColuna5").trigger("change");
        internacaoProv = false;
    };
};

masculino = false;
function masculino_btn() {
    $("#txtColuna7").val('M');
    $("#txtColuna7").trigger("change");

    if (!masculino) {
        $('#masculino').removeClass('btn-success').addClass('btn-primary');
        $('#masculino').text('Limpar');
        masculino = true;
    }
    else {
        $('#masculino').removeClass('btn-primary').addClass('btn-success');
        $('#masculino').text('Masculino');
        $("#txtColuna7").val('');
        $("#txtColuna7").trigger("change");
        masculino = false;
    };
};

feminino = false;
function feminino_btn() {
    $("#txtColuna7").val('F');
    $("#txtColuna7").trigger("change");

    if (!feminino) {
        $('#feminino').removeClass('btn-success').addClass('btn-primary');
        $('#feminino').text('Limpar');
        feminino = true;
    }
    else {
        $('#feminino').removeClass('btn-primary').addClass('btn-success');
        $('#feminino').text('Feminino');
        $("#txtColuna7").val('');
        $("#txtColuna7").trigger("change");
        feminino = false;
    };
};