$( document ).ready(function() {

    //CHECK form_foi_planejado
    if($('#socioeduk_jovem_suicidio_foi_planejado').is(':checked'))
        $('#form_foi_planejado').show();
    else
        $('#form_foi_planejado').hide();


    $('#socioeduk_jovem_suicidio_foi_planejado').click(function() {
        if(this.checked) {
            $('#form_foi_planejado').show();
        } else {
            $('#form_foi_planejado').hide();
        }
    })


    //CHECK form_ouve_aviso
    if($('#socioeduk_jovem_suicidio_ouve_aviso').is(':checked'))
        $('#form_ouve_aviso').show();
    else
        $('#form_ouve_aviso').hide();


    $('#socioeduk_jovem_suicidio_ouve_aviso').click(function() {
        if(this.checked) {
            $('#form_ouve_aviso').show();
        } else {
            $('#form_ouve_aviso').hide();
        }
    })


    //CHECK form_ouve_aviso
    if($('#socioeduk_jovem_suicidio_deixou_mensagem').is(':checked'))
        $('#form_deixou_mensagem').show();
    else
        $('#form_deixou_mensagem').hide();


    $('#socioeduk_jovem_suicidio_deixou_mensagem').click(function() {
        if(this.checked) {
            $('#form_deixou_mensagem').show();
        } else {
            $('#form_deixou_mensagem').hide();
        }
    })

    //CHECK form_ouve_aviso
    if($('#socioeduk_jovem_suicidio_estava_acompanhado').is(':checked'))
        $('#form_estava_acompanhado').show();
    else
        $('#form_estava_acompanhado').hide();


    $('#socioeduk_jovem_suicidio_estava_acompanhado').click(function() {
        if(this.checked) {
            $('#form_estava_acompanhado').show();
        } else {
            $('#form_estava_acompanhado').hide();
        }
    })

    //CHECK form_ouve_aviso
    if($('#socioeduk_jovem_suicidio_outros').is(':checked'))
        $('#form_outros').show();
    else
        $('#form_outros').hide();

    $('#socioeduk_jovem_suicidio_outros').click(function() {
        if(this.checked) {
            $('#form_outros').show();
        } else {
            $('#form_outros').hide();
        }
    })



});
