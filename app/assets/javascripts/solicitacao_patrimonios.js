var ready = function() {
  $( document ).ready(function() {
    $('.input-formated').css({
      "border-color": "#1FA689",
      "text-align": "center",
      "height": "20px"
    });
  });
  $('#solicitacao_patrimonio_numero_processo').change(function() {
    if ((this.value).length < "13") {
      alert("O campo Nº Processo deverá conter 12 números. Caso necessário, adicione 0 (zero) a esquerda.");
      (this).focus();
      $('#btn-salvar').prop('disabled', true);
    } else {
      $('#btn-salvar').prop('disabled', false);
    }
  });
}

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
} else {
  $(document).on("turbolinks:load", ready);
}