var ready = function() {
  if($('#socioeduk_tecnico_jovem_programas_sociais').is(':checked'))
  $('#form_programa_sociais').show();
  else
  $('#form_programa_sociais').hide();
  
  $('#socioeduk_tecnico_jovem_programas_sociais').click(function() {
    if(this.checked) {
        $('#form_programa_sociais').show();
    } else {
        $('#form_programa_sociais').hide();
    }
  })

}    

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
  } else {
  $(document).on("turbolinks:load", ready);
}