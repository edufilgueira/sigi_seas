var ready = function() {

  $(document).ready(function() {
    $('input:radio[name="socioeduk_jovem_ocorrencia[socioeduk_tipo_ocorrencia_id]"]').change(function() {
      if ($("input[name='socioeduk_jovem_ocorrencia[socioeduk_tipo_ocorrencia_id]']:checked")) {

        $.ajax({
          //url: '/socioeduk/tipo_ocorrencias/listar_ocorrencias',
          url: 'https://sigi.seas.ce.gov.br/socioeduk/tipo_ocorrencias/listar_ocorrencias',
          post: 'GET',
          data: { tipo_ocorrencia_id: $(this).val() }
        }).done(function(retorno) {
          var data = retorno;
          var selectbox = $('#socioeduk_jovem_ocorrencia_socioeduk_ocorrencia');
          selectbox.find('option').remove();
          $.each(data, function (i, d) {
              $('<option>').val(d.id).text(d.nome).appendTo(selectbox);
          });
        });

      } 

    });
  });

}

if (typeof Turbolinks == "undefined") {
    $(document).ready(ready);
} else {
    $(document).on("turbolinks:load", ready);
}