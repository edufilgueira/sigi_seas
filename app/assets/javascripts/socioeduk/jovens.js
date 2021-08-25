function buscar_jovem_por_nome(nome) {
  var retorno = "";
  if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
    var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/jovens/buscar_jovem_por_nome';
  }  else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
    var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/jovens/buscar_jovem_por_nome';
  }  else {
    var url_path = '/socioeduk/jovens/buscar_jovem_por_nome';
  }

  $.ajax({
    method: 'GET',
    url: url_path,
    async: true,
    data: { nome: nome },
    success: function(data,status,xhr) {
      if(data != null)
        $('#socioeduk_jovem_nome_validador').fadeIn().css('display','block');
      else
        $('#socioeduk_jovem_nome_validador').fadeOut().removeClass('displaytype');
    }
  });
  return retorno;
}

function carregarBairros(cidade) {
  element_id = cidade.id;
  number_element_id = element_id.replace("socioeduk_jovem_endereco_jovens_attributes_", "");
  number_element_id = number_element_id.replace("_cidade_id", "");

  if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
    var url_path = 'https://sigi.seas.ce.gov.br/socioeduk/jovens/bairros_por_cidade';
  }  else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
    var url_path = 'http://homologacao.seas.ce.gov.br/socioeduk/jovens/bairros_por_cidade';
  }  else {
    var url_path = '/socioeduk/jovens/bairros_por_cidade';
  }

  $.ajax({
    method: 'GET',
    url: url_path,
    data: { cidade_id: cidade.value, number_element_id: number_element_id }
  });
}



var ready = function() {

  $('#add_nested_jovem_recepcao').click(function() {
    $(this).addClass('disabled');
    var delay=500;
    setTimeout(function(){
      $('#collapse').collapse('show');
    },delay);
  });


  $("#gestacao").hide();
  $('#socioeduk_jovem_sexo_f').click(function() {
    $("#gestacao").show();
  });
  $('#socioeduk_jovem_sexo_m').click(function() {
    $("#gestacao").hide();
  });

  $("#data_providencia_documento").hide();
  $('#socioeduk_jovem_providenciando_documentos').click(function() {
    if(this.checked) {
      $('#data_providencia_documento').show();
      $('#socioeduk_jovem_rg').prop('disabled', true);
      $('#socioeduk_jovem_orgao_expedidor').prop('disabled', true);
      $('#socioeduk_jovem_cpf').prop('disabled', true);
    } else {
      $('#data_providencia_documento').hide();
      $('#socioeduk_jovem_rg').prop('disabled', false);
      $('#socioeduk_jovem_orgao_expedidor').prop('disabled', false);
      $('#socioeduk_jovem_cpf').prop('disabled', false);
    }
  });

}

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
} else {
  $(document).on("turbolinks:load", ready);
}
