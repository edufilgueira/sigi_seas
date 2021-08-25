var ready = function() {
    $('#pesquisar').click(function() {

      var cpf = $('#cpf').val();
      if (($(location).attr('host').indexOf('sigi.seas.ce.gov.br') >= 0)) {
        var url_path = 'https://sigi.seas.ce.gov.br/admin/usuarios/buscar_usuario_cpf';
      }  else if (($(location).attr('host').indexOf('homologacao.seas.ce.gov.br') >= 0)) {
        var url_path = 'http://homologacao.seas.ce.gov.br/admin/usuarios/buscar_usuario_cpf';
      }  else {
        var url_path = '/admin/usuarios/buscar_usuario_cpf';
      }

      $.ajax({
        url: url_path,
        type: "get",
        dataType : "html",
        data: { cpf: cpf }
        }).done(function(retorno) {
          var dados  = JSON.parse(retorno);
          console.log(dados);
          if(retorno != 'null')
          {
            $("#usuario_pessoa_id").val(dados.id).change();
            msg = 'USUÁRIO <b>' + dados.nome + '</b> ENCONTRADO';
            $("#usuario_pessoa_id").val("1086");
            $("#select2-usuario_pessoa_id-container").html(dados.nome);
          }
          else
          {
            $("#usuario_pessoa_id").val('').change();
            msg = 'Nenhuma pessoa encontrada';
          }

          $("#resultado").html(msg);
        });
    }); 
}

if (typeof Turbolinks == "undefined") {
    $(document).ready(ready);
} else {
    $(document).on("turbolinks:load", ready);
}