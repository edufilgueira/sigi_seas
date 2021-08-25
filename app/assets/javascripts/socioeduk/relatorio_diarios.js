var ready = function() {
	$(document).ready(function() {
    $('#socioeduk_relatorio_diario_data').mask('99/99/9999')

    $('.calc-capacidade').on('keyup change', function() {
      var int_mas = $('#socioeduk_relatorio_diario_int_mas').val();
      var int_fem = $('#socioeduk_relatorio_diario_int_fem').val();
      var ip_mas = $('#socioeduk_relatorio_diario_ip_mas').val();
      var ip_fem = $('#socioeduk_relatorio_diario_ip_fem').val();
      var sl_mas = $('#socioeduk_relatorio_diario_sl_mas').val();
      var sl_fem = $('#socioeduk_relatorio_diario_sl_fem').val();
      var san_mas = $('#socioeduk_relatorio_diario_san_mas').val();
      var san_fem = $('#socioeduk_relatorio_diario_san_fem').val();
      var cap_real = $('#socioeduk_relatorio_diario_capacidade_real').val();
      var socioeducador_homem = $('#socioeduk_relatorio_diario_socioeducador_homem').val();
      var socioeducador_mulher = $('#socioeduk_relatorio_diario_socioeducador_mulher').val();
      var soma_adolesc_medidas = (Number(int_mas) + Number(int_fem) + Number(ip_mas) + Number(ip_fem) + Number(sl_mas) + Number(sl_fem) + Number(san_mas) + Number(san_fem))
      var capacidade = (soma_adolesc_medidas - Number(cap_real))
      var capacidade_socioeducador = (soma_adolesc_medidas/(Number(socioeducador_homem) + Number(socioeducador_mulher)))
      $('#socioeduk_relatorio_diario_capacidade_por_adolescente_percentual').val(capacidade);
      $('#socioeduk_relatorio_diario_capacidade_socioeducador_por_adolescente_percentual').val(roundToTwo((capacidade/Number(cap_real))*100));
      $('#socioeduk_relatorio_diario_capacidade_por_adolescente').val(roundToTwo(capacidade_socioeducador));
    });

    function roundToTwo(num) {    
      return +(Math.round(num + "e+2")  + "e-2");
    };

    $('.quantidade').on('keyup change', function() {
      var cap_real = parseInt($('#socioeduk_relatorio_diario_capacidade_real').val());
      var cap_nominal = parseInt($('#socioeduk_relatorio_diario_capacidade_nominal').val());
      if (cap_real > cap_nominal) {
        $('#socioeduk_relatorio_diario_capacidade_real').val('');
        $('#mensagem').html("<h4 class='text-danger'>A capacidade real é superior a capacidade nominal.</h4>");
      } else {
        $('#mensagem').html('');
      }
    })

    $('#socioeduk_relatorio_diario_data').change(function() {
      var data = new Date(formatDate($('#socioeduk_relatorio_diario_data').val()));
      if (data >= new Date()) {
        $('#socioeduk_relatorio_diario_data').val('');
        $('#mensagem').html("<h4 class='text-danger'>A data informada é superior a data atual.</h4>");
      } else {
        $('#mensagem').html('');
      }
    });

    function formatDate(date) {
      var d = new Date(date);
      var day = d.getDate();
      var month = d.getMonth() + 1;
      var year = d.getFullYear();
      if (day < 10) {
        day = "0" + day;
      }
      if (month < 10) {
        month = "0" + month;
      }
      var date = day + "/" + month + "/" + year;
      return date;
    };

    // Head table fixed
    var $th = $('.tableFixHead').find('thead th')
    $('.tableFixHead').on('scroll', function() {
      $th.css('transform', 'translateY('+ this.scrollTop +'px)');
    });
	});
}

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
} else {
  $(document).on("turbolinks:load", ready);
}
