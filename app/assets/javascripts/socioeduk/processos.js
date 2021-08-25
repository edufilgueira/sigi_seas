function calcularData(atributo) {
  var indice_id = atributo.id.split("_");
  var data_inicio = $('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_inicio')).val();
  var data_inicio = data_inicio.split('/');
  var data_inicio = new Date(''.concat(data_inicio[1], '/', data_inicio[0], '/', data_inicio[2]));
  var data_fim = new Date();
  var medida = $('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_socioeduk_tipo_medida_socioeducativa_id', ' option:selected'));
  var valor_medida = "";
  medida.each(function () {
    valor_medida += $(this).text() + " ";
  });
  if (valor_medida.trim() == "INTERNAÇÃO") {
    var dias = 1095; //referente a 36 meses, equiavalente a 3 anos (3 * 365 = 1095)
    $('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_periodo_dias')).empty().val(dias);
  } else if (valor_medida.trim() == 'SEMILIBERDADE') {
    var dias = 1095; //referente a 36 meses, equiavalente a 3 anos (3 * 365 = 1095)
    $('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_periodo_dias')).empty().val(dias);
  } else if (valor_medida.trim() == 'INTERNAÇÃO PROVISÓRIA') {
    var dias = 45;
    $('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_periodo_dias')).empty().val(dias);
  } else if (valor_medida.trim() == 'SANÇÃO') {
    var dias = parseInt($('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_periodo_dias')).val());
    $('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_periodo_dias')).empty().val(dias);
  } else {
    var dias = parseInt($('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_periodo_dias')).empty().val('0'));
    $('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_periodo_dias')).empty().val(dias);
  }
  data_fim.setDate((data_inicio.getDate() + dias) - 1);
  $('#'.concat('socioeduk_processo_socioeduk_medida_socioeducativas_attributes_', indice_id[6], '_fim_previsto')).empty().val(data_fim.toLocaleDateString());
}

function calcularDataSimples(atributo) {
  var medida = $('#socioeduk_medida_socioeducativa_socioeduk_tipo_medida_socioeducativa_id').val();
  var data_inicio = $('#socioeduk_medida_socioeducativa_inicio').val();
  var data_inicio = data_inicio.split('/');
  var data_inicio = new Date(''.concat(data_inicio[1], '/', data_inicio[0], '/', data_inicio[2]));
  var data_fim = new Date(data_inicio);

  if (medida == 1) { //INTERNAÇÃO
    var dias = 1095; //referente a 36 meses, equiavalente a 3 anos (3 * 365 = 1095)
  } else if (medida == 4) { //SEMILIBERDADE
    var dias = 1095; //referente a 36 meses, equiavalente a 3 anos (3 * 365 = 1095)
  } else if (medida == 2) { //INTERNAÇÃO PROVISÓRIA
    var dias = 45;
  } else if (medida == 3) { //SANÇÃO
    var dias = $('#socioeduk_medida_socioeducativa_periodo_dias').val();
  } else {
    var dias = $('#socioeduk_medida_socioeducativa_periodo_dias').val();
  }
  $('#socioeduk_medida_socioeducativa_periodo_dias').val(dias);
  data_fim.setDate((data_inicio.getDate() + parseInt(dias)) - 1);
  $('#socioeduk_medida_socioeducativa_fim_previsto').val(data_fim.toLocaleDateString());
}

function listarParagrafo(infracao) {
  ativar_estupro_vulneravel(infracao);

  var index = numberText(infracao.id) // index do select infracao
  var infracao_id = document.getElementById(''.concat("socioeduk_processo_socioeduk_processo_naturezas_attributes_", index, "_socioeduk_artigo_infracao_id")).value; // valor do select infracao
  if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
    var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/processos/listar_paragrafos';
  } else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
    var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/processos/listar_paragrafos';
  }  else {
    var url_path = '/socioeduk/processos/listar_paragrafos';
  }
  $.ajax({
    method: 'POST',
    url: url_path,
    data: { infracao_id: infracao_id, index: index },
    success: function () {
      var index = numberText(paragrafo.id) // index do select paragrafo
      var paragrafo_id = document.getElementById(''.concat("socioeduk_processo_socioeduk_processo_naturezas_attributes_", index, "_socioeduk_artigo_infracao_id")).value; // valor do select paragrafo
      if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
        var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/processos/listar_incisos';
      } else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
        var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/processos/listar_incisos';
      }  else {
        var url_path = '/socioeduk/processos/listar_incisos';
      }
      $.ajax({
        method: 'POST',
        url: url_path,
        data: { paragrafo_id: paragrafo_id, index: index },
        success: function () {
          var index = numberText(inciso.id) // index do select inciso
          var inciso_id = document.getElementById(''.concat("socioeduk_processo_socioeduk_processo_naturezas_attributes_", index, "_socioeduk_artigo_infracao_id")).value; // valor do select inciso
          if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
            var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/processos/listar_alineas';
          } else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
            var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/processos/listar_alineas';
          }  else {
            var url_path = '/socioeduk/processos/listar_alineas';
          }
          $.ajax({
            method: 'POST',
            url: url_path,
            data: { inciso_id: inciso_id, index: index }
          });
        }
      });
    }
  });
}

function ativar_estupro_vulneravel(elemento) {
  valor_linha = elemento.id
  valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_processo_naturezas_attributes_", "");
  valor_linha = valor_linha.replace("_socioeduk_artigo_infracao_id", "");

  elementoIdInfracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_socioeduk_artigo_infracao_id";
  elementoIdvulneravel = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_estupro_vulneravel";

  if ($(elementoIdInfracao + " option:selected").text().toLowerCase().indexOf('estupro') >= 0)
    $(elementoIdvulneravel).show();
  else {
    $(elementoIdvulneravel).hide();
    $(elementoIdvulneravel).prop("checked", false);
  }
}

function ativar_desativar_estupro_vulneravel() {
  setTimeout(function () {
    $("#lista_processo_natureza fieldset input").each(function () {
      valor_linha = this.id
      valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_processo_naturezas_attributes_", "");
      valor_linha = valor_linha.replace("_estupro_vulneravel", "");

      elementoIdInfracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_socioeduk_artigo_infracao_id";
      elementoIdvulneravel = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_estupro_vulneravel";

      if ($(elementoIdInfracao + " option:selected").text().toLowerCase().indexOf('estupro') >= 0)
        $(elementoIdvulneravel).show();
      else {
        $(elementoIdvulneravel).hide();
        $(elementoIdvulneravel).prop("checked", false);
      }
    });
  }, 1);
}

function listarInciso(paragrafo) {
  var index = numberText(paragrafo.id) // index do select paragrafo
  var pararafo_id = document.getElementById(''.concat("socioeduk_processo_socioeduk_processo_naturezas_attributes_", index, "_socioeduk_artigo_infracao_id")).value; // valor do select paragrafo
  if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
    var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/processos/listar_incisos';
  } else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
    var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/processos/listar_incisos';
  }  else {
    var url_path = '/socioeduk/processos/listar_incisos';
  }
  $.ajax({
    method: 'POST',
    url: url_path,
    data: { paragrafo_id: paragrafo_id, index: index },
    success: function () {
      var index = numberText(inciso.id) // index do select inciso
      var inciso_id = document.getElementById(''.concat("socioeduk_processo_socioeduk_processo_naturezas_attributes_", index, "_socioeduk_artigo_infracao_id")).value; // valor do select inciso
      if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
        var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/processos/listar_alineas';
      } else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
        var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/processos/listar_alineas';
      }  else {
        var url_path = '/socioeduk/processos/listar_alineas';
      }
      $.ajax({
        method: 'POST',
        url: url_path,
        data: { inciso_id: inciso_id, index: index }
      });
    }
  });
}

function listarAlinea(inciso) {
  var index = numberText(inciso.id) // index do select inciso
  var inciso_id = document.getElementById(''.concat("socioeduk_processo_socioeduk_processo_naturezas_attributes_", index, "_socioeduk_artigo_infracao_id")).value; // valor do select inciso
  if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
    var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/processos/listar_alineas';
  } else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
    var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/processos/listar_alineas';
  }  else {
    var url_path = '/socioeduk/processos/listar_alineas';
  }
  $.ajax({
    method: 'POST',
    url: url_path,
    data: { inciso_id: inciso_id, index: index }
  });
}

function numberText(texto) {
  var regex = /\d+/g;
  var matches = texto.match(regex);
  return matches;
}

function atualizar_infracao_continuado(elementoid) {

  valor_linha = elementoid.id
  valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_processo_naturezas_attributes_", "");
  valor_linha = valor_linha.replace("_pontuacao_continuado", "");

  elementoIdInfracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_socioeduk_artigo_infracao_id";
  elementoIdContinuado = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_pontuacao_continuado";

  if ($(elementoIdContinuado).is(':checked'))
    $(elementoIdInfracao).attr("continuado", "true");
  else
    $(elementoIdInfracao).attr("continuado", "false");

  carregarCalculo();
}

function atualizar_infracao_estupro_vulneravel(elemento) {

  valor_linha = elemento.id
  valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_processo_naturezas_attributes_", "");
  valor_linha = valor_linha.replace("_estupro_vulneravel", "");

  elementoIdInfracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_socioeduk_artigo_infracao_id";
  elementoIdVulneravel = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_estupro_vulneravel";

  if ($(elementoIdVulneravel).is(':checked'))
    $(elementoIdInfracao).attr("vulneravel", "true");
  else
    $(elementoIdInfracao).attr("vulneravel", "false");

  carregarCalculo();
}

function atualizar_tipo_natureza(elementoid) {
  valor_linha = elementoid.id
  valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_processo_naturezas_attributes_", "");
  valor_linha = valor_linha.replace("_tipo_natureza_consumada", "");
  valor_linha = valor_linha.replace("_tipo_natureza_tentada", "");

  elementoIdInfracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_socioeduk_artigo_infracao_id";

  elementoIdNaturezaConsumada = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_tipo_natureza_consumada";
  elementoIdNaturezaTentada = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_tipo_natureza_tentada";

  if ($(elementoIdNaturezaConsumada).prop("checked")) {
    $(elementoIdInfracao).attr("tipo_natureza", "Consumada");
  }

  if ($(elementoIdNaturezaTentada).prop("checked")) {
    $(elementoIdInfracao).attr("tipo_natureza", "Tentada");
  }

  carregarCalculo();
}

function atualizar_reiteracao(elemento) {
  valor_linha = elemento.id
  valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_processo_naturezas_attributes_", "");
  valor_linha = valor_linha.replace("_pontuacao_reinteracao", "");
  console.log("linha: " + valor_linha);

  elementoIdInfracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_socioeduk_artigo_infracao_id";
  elementoIdReiteracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_pontuacao_reinteracao";
  elementoQtdreiteracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_pontuacao_quantidade_reinteracao";

  if ($(elementoIdReiteracao).is(':checked')) {
    $(elementoQtdreiteracao).focus();
    $(elementoQtdreiteracao).val('1')
    $(elementoIdInfracao).attr("qtd_reiteracao", "1");
  }
  else {
    $(elementoQtdreiteracao).val('');
    $(elementoIdInfracao).attr("qtd_reiteracao", "");
  }

  carregarCalculo();
}

function atualizar_qtd_reiteracao(elemento) {

  valor_linha = elemento.id
  valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_processo_naturezas_attributes_", "");
  valor_linha = valor_linha.replace("_pontuacao_quantidade_reinteracao", "");

  elementoIdInfracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_socioeduk_artigo_infracao_id";
  elementoIdReiteracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_pontuacao_reinteracao";
  elementoQtdreiteracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_pontuacao_quantidade_reinteracao";
  console.log("elementoQtdreiteracao: " + $(elementoQtdreiteracao).val());

  if ($(elementoQtdreiteracao).val() > 0) {
    if ($(elementoIdReiteracao).is(':checked')) {
      $(elementoIdInfracao).attr("qtd_reiteracao", $(elementoQtdreiteracao).val());
    }
    else {
      $(elementoQtdreiteracao).val('');
      $(elementoIdInfracao).attr("qtd_reiteracao", "");
    }

    carregarCalculo();
  }
}

function atualizar_certidao_positiva() {
  if ($('#socioeduk_processo_pontuacao_certidao_positiva').is(':checked')) {
    $('#socioeduk_processo_pontuacao_quantidade_certidao_positiva').focus();
    $('#socioeduk_processo_pontuacao_quantidade_certidao_positiva').val('1')
  }
  else
    $('#socioeduk_processo_pontuacao_quantidade_certidao_positiva').val('');

  carregarCalculo();
}

function atualizar_qtd_certidao_positiva() {

  if ($('#socioeduk_processo_pontuacao_quantidade_certidao_positiva').val() > 0) {
    carregarCalculo();
  }
}

function carregarCalculo() {
  setTimeout(gerarCalculo, 0);
}

function gerarCalculo() {
  ativar_desativar_estupro_vulneravel();
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
          valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_processo_naturezas_attributes_", "");
          valor_linha = valor_linha.replace("_estupro_vulneravel", "");
          elementoIdInfracao = "#socioeduk_processo_socioeduk_processo_naturezas_attributes_" + valor_linha + "_socioeduk_artigo_infracao_id";
          $(elementoIdInfracao).attr("vulneravel", "true");
        }
      }
    });
    /**PERCORRE A NATUREZA PARA REALIZAR O CALCULO */
    $("#lista_processo_natureza fieldset select").each(function () {
      var tem_ponderacao = $(this).attr('ponderacao');
      var processo_natureza_id = $(this).attr('processo_natureza_id');
      if (tem_ponderacao == "SIM") {
        var id = $(this).val();
        var ponderacao = buscar_pontuacao_por_id(id);
        var tipo_natureza = $(this).attr('tipo_natureza')
        //TIPO DE MEDIDA
        if (tipo_natureza == "Consumada") {
          calc_tipo_natureza += ponderacao;
          console.log('Consumada: '+ponderacao)
        }
        else if (tipo_natureza == "Tentada") {
          console.log('Tentada: '+ponderacao - (ponderacao * 0.3))
          calc_tipo_natureza += ponderacao - (ponderacao * 0.3);
        }
        //CRIME CONTINUADO
        if ($(this).attr('continuado') == 'true') {
          calc_continuado += ponderacao * 0.3;
          console.log('continuado: '+ponderacao * 0.3)
        }
        //ESTUPRO DE VULNERÁVEL
        if ($(this).attr('vulneravel') == 'true') {
          calc_vulneravel += ponderacao * 0.5;
          console.log('vulneravel: '+ponderacao * 0.5)
        }
        //REINTERAÇÃO
        if ($(this).attr('qtd_reiteracao') > 0) {
          var qtd_reiteracao = $(this).attr('qtd_reiteracao');
          calc_reiteracao += (ponderacao * 0.1 * qtd_reiteracao);
          console.log('reinteracao: '+ponderacao * 0.1 * qtd_reiteracao)
        }

        // // DESCUMPRIMENTO DE MEDIDA
        // if (!processo_natureza_id == "") {
        //   //PEGAR ID DO NUMERO PROCESSO
        //   $("#processo_natureza" + processo_natureza_id + " select").each(function () {
        //     if (this.id.indexOf('socioeduk_numero_processo_id') >= 0) {
        //       var numero_processo_id = $(this).val();
        //       //IDENTIFICAR LINHA DO NUMERO DO PROCESSO E PEGAR O STATUS
        //       $("#numero_processo" + numero_processo_id + " input").each(function () {
        //         //VERIFICAR STATUS DO PROCESSO
        //         if (this.id.indexOf('status') >= 0) {
        //           if ($(this).is(':checked')) {
        //             //VERIFICAR STATUS DA DESCUMPRIMENTO DE MEDIDA
        //             $("#numero_processo" + numero_processo_id + " input").each(function () {
        //               if (this.id.indexOf('pontuacao_descumprimento_medida') >= 0)
        //                 if ($(this).is(':checked')){
        //                   calc_descumprimento_medida += (ponderacao * 0.1);
        //                   console.log('calc_descumprimento_medida: '+ponderacao * 0.1)
        //                 }
        //             });
        //           }
        //         }
        //       });
        //     }
        //   });
        // }
      }
    });

    // CALCULO BASE DO ATO
    calc += calc_tipo_natureza + calc_continuado + calc_reiteracao;
    calc -= calc_vulneravel;

    // CERTIDÃO POSITIVA
    if ($("#socioeduk_processo_pontuacao_certidao_positiva").is(':checked')) {
      if ($('#socioeduk_processo_pontuacao_quantidade_certidao_positiva').val() == '') {
        $('#socioeduk_processo_pontuacao_quantidade_certidao_positiva').val('1')
      }
      if ($('#socioeduk_processo_pontuacao_quantidade_certidao_positiva').val() > 0) {
        total = 0;
        quantidade = $('#socioeduk_processo_pontuacao_quantidade_certidao_positiva').val();
        for(i = 1; i <= quantidade; i++){
          total += calc * c;
        }
        certidao_positiva += total;
      }
    }
    
    // APREENDIDO
    if ($("#socioeduk_processo_pontuacao_apreendido").is(':checked')){
      apreendido += a;
      console.log('Apreendido: ' + a);
    }
    
    // PEGAR ID DO NUMERO PROCESSO
    $("#lista_numero_processo input").each(function () {
      var attr_numero = $(this).attr('numero');
      if(attr_numero == "SIM"){
        valor_linha = this.id;
        valor_linha = valor_linha.replace("socioeduk_processo_socioeduk_numero_processos_attributes_", "");
        valor_linha = valor_linha.replace("_numero", "");
        status = "#socioeduk_processo_socioeduk_numero_processos_attributes_" + valor_linha + "_status";
        if($(status).is(':checked')){
          // ORGANIZAÇÃO CRIMINOSA
          elementoIdOrganizacaoCriminosa = "#socioeduk_processo_socioeduk_numero_processos_attributes_" + valor_linha + "_pontuacao_organizacao_criminosa";
          if($(elementoIdOrganizacaoCriminosa).is(':checked')){
            calc_organizacao_criminosa += o;
          }
          // DESCUMPRIMENTO DE MEDIDA
          elementoIdDescumprimentoMedida = "#socioeduk_processo_socioeduk_numero_processos_attributes_" + valor_linha + "_pontuacao_descumprimento_medida";
          if($(elementoIdDescumprimentoMedida).is(':checked')){
            calc_descumprimento_medida +=  (calc * 0.1);
          }
        }
      }
    });
    calc += certidao_positiva + calc_descumprimento_medida;
    calc += calc_organizacao_criminosa;
    calc += apreendido;

    $('#resultado_pontuacao').html(calc.toFixed(2));
  }, 0);

}

function liberar_finalizar() {

  var status = "";
  if ($('#medida_socioeducativas div').length <= 0)
    status="--"
  else
    status = "CONCLUÍDO";
  $("#medida_socioeducativas div").each(function () {
    if (this != null) {
      if ($('#medida_socioeducativas div').length == 1) {
        if ($(this).attr('situacao') == 'EVASÃO') {
          status = $(this).attr('situacao');
          return;
        }
        if ($(this).attr('situacao') == 'CONCLUÍDO') {
          status = $(this).attr('situacao');
        } else {
          status = $(this).attr('situacao');
          return;
        }
      } else if ($('#medida_socioeducativas div').length > 1) {
        if ($(this).attr('situacao') != 'CONCLUÍDO') {
          if ($(this).attr('situacao') == 'EVASÃO') {
            status = $(this).attr('situacao');
            return;
          } else if ($(this).attr('situacao') == 'FUGA'){
            status = $(this).attr('situacao');
            return;
          } else {
            status = $(this).attr('situacao');
            return;
          }
        }
      }
    }
  });
  if (status == "CONCLUÍDO") {
    console.log('edu: '+status);
    if ($('#socioeduk_processo_socioeduk_status_processo_id').val() == 1)
      $('#finalizar_processo').show();
    else if ($('#socioeduk_processo_socioeduk_status_processo_id').val() == 3)
      $('#reverter_processo_finalizado').show();
  }
  if (status == "EVASÃO") {
    if ($('#socioeduk_processo_socioeduk_status_processo_id').val() == 1)
      $('#evadir_processo').show();
    else if ($('#socioeduk_processo_socioeduk_status_processo_id').val() == 2)
      $('#reverter_processo_finalizado').show();
  }
  if (status == "FUGA") {
    if ($('#socioeduk_processo_socioeduk_status_processo_id').val() == 1)
      $('#fuga_processo').show();
    else if ($('#socioeduk_processo_socioeduk_status_processo_id').val() == 4)
      $('#reverter_processo_finalizado').show();
  }
}


carregarCalculo();

function buscar_pontuacao_por_id(id) {
  var ponderacao = 0;
  if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
    var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/artigo_infracoes/buscar_por_id';
  } else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
    var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/artigo_infracoes/buscar_por_id';
  }  else {
    var url_path = '/socioeduk/artigo_infracoes/buscar_por_id';
  }
  $.ajax({
    method: 'GET',
    url: url_path,
    async: false,
    data: { id: id },
    success: function (data, status, xhr) {
      if (data != null)
        ponderacao = data.ponderacao;
    }
  });
  return ponderacao;
}

// Quando alterar neste método, alterar também no /home/nonatojr/Projetos/ativos/principal/app/views/socioeduk/processos/_form_adicionar_medida.html.erb
function concluirMedidaIndex() {
  setTimeout(function () {
    concluirMedida();
  }, 1000);
}

// VALIDADOR DOS CAMPOS NO FORMULÁRIO
// BOTÃO SÓ ABILITA APÓS AS CONDIÇÕES SEREM ATENDIDAS
function liberar_botao_salvar_processo() {
  validar_tipo_natureza = false;
  validar_processo_natureza = false;
  validar_artigo_infracao = false;
  if ($('#lista_processo_natureza fieldset select').length > 0) {
    $('#lista_processo_natureza fieldset select').each(function () {
      //PROCURA PELO CAMPO NUMERO DO PROCESSO
      if (this.id.indexOf('socioeduk_numero_processo_id') > 0) {
        if ($(this).val() == "") {
          validar_processo_natureza = true;
          return;
        }
      }
      //PROCURA PELO CAMPO INFRAÇÃO
      if (this.id.indexOf('socioeduk_artigo_infracao_id') > 0) {
        if ($(this).val() == "") {
          validar_artigo_infracao = true;
          return;
        }
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

    if (!true_validar_tipo_natureza && !false_validar_tipo_natureza)
      validar_tipo_natureza = true;

    true_validar_tipo_natureza = false;
    false_validar_tipo_natureza = false;
  }


  //LIBERAR MENSAGEM DO VALIDADOS
  if (validar_artigo_infracao)
    $('#validar_natureza_infracao_processo').fadeIn().css('display', 'block');
  else
    $('#validar_natureza_infracao_processo').fadeOut().removeClass('displaytype');

  //LIBERAR MENSAGEM DO VALIDADOS
  if (validar_processo_natureza)
    $('#validar_natureza_numero_processo').fadeIn().css('display', 'block');
  else
    $('#validar_natureza_numero_processo').fadeOut().removeClass('displaytype');

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

  //LIBERA BOTÁO ADICIONAR MEDIDA SOCIOEDUCATIVA
function btn_desabilita_medida_socioeducativa() {
  setTimeout(function () {
    $("#lista_processo_natureza fieldset div").each(function () {
      if (this.id == "processo_natureza") {
        $("#medida_socioeducativa_id").attr('disabled', true);
      }
    }, 500);
  });
}
