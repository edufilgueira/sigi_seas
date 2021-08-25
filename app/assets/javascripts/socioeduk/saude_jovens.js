var ready = function() {

    $( document ).ready(function() {
        //CHECK Gravida
        if($('#socioeduk_saude_jovem_gravida').is(':checked'))
            $('#form_gravida').show();
        else
            $('#form_gravida').hide();

        
        $('#socioeduk_saude_jovem_gravida').click(function() {
            if(this.checked) {
                $('#form_gravida').show();
            } else {
                $('#form_gravida').hide();
            }
        })

        //CHECK integrante_familia_usa_drogas
        if($('#socioeduk_saude_jovem_integrante_familia_usa_drogas').is(':checked'))
            $('#form_integrante_familia_usa_drogas').show();
        else
            $('#form_integrante_familia_usa_drogas').hide();

        
        $('#socioeduk_saude_jovem_integrante_familia_usa_drogas').click(function() {
            if(this.checked) {
                $('#form_integrante_familia_usa_drogas').show();
            } else {
                $('#form_integrante_familia_usa_drogas').hide();
            }
        })

        //CHECK Usou drogas
        if($('#socioeduk_saude_jovem_usou_drogas').is(':checked'))
            $('#form_usou_drogas').show();
        else
            $('#form_usou_drogas').hide();

        
        $('#socioeduk_saude_jovem_usou_drogas').click(function() {
            if(this.checked) {
                $('#form_usou_drogas').show();
            } else {
                $('#form_usou_drogas').hide();
            }
        })

        //CHECK Historico tratamento psiquiatrico
        if($('#socioeduk_saude_jovem_historico_tratamento_psiquiatrico').is(':checked'))
            $('#form_historico_tratamento_psiquiatrico').show();
        else
            $('#form_historico_tratamento_psiquiatrico').hide();

        $('#socioeduk_saude_jovem_historico_tratamento_psiquiatrico').click(function() {
            if(this.checked) {
                $('#form_historico_tratamento_psiquiatrico').show();
            } else {
                $('#form_historico_tratamento_psiquiatrico').hide();
            }
        })

        //CHECK Hipotese diagnostica transtorno mental
        if($('#socioeduk_saude_jovem_hipotese_diagnostica_transtorno_mental').is(':checked'))
            $('#form_hipotese_diagnostica_transtorno_mental').show();
        else
            $('#form_hipotese_diagnostica_transtorno_mental').hide();

        $('#socioeduk_saude_jovem_hipotese_diagnostica_transtorno_mental').click(function() {
            if(this.checked) {
                $('#form_hipotese_diagnostica_transtorno_mental').show();
            } else {
                $('#form_hipotese_diagnostica_transtorno_mental').hide();
            }
        })

        //CHECK Mediamento controlado
        if($('#socioeduk_saude_jovem_medicamento_controlado').is(':checked'))
            $('#form_medicamento_controlado').show();
        else
            $('#form_medicamento_controlado').hide();

        $('#socioeduk_saude_jovem_medicamento_controlado').click(function() {
            if(this.checked) {
                $('#form_medicamento_controlado').show();
            } else {
                $('#form_medicamento_controlado').hide();
            }
        })

        //CHECK Tentativa suicidio
        if($('#socioeduk_saude_jovem_tentativa_suicidio').is(':checked'))
            $('#form_tentativa_suicidio').show();
        else
            $('#form_tentativa_suicidio').hide();

        $('#socioeduk_saude_jovem_tentativa_suicidio').click(function() {
            if(this.checked) {
                $('#form_tentativa_suicidio').show();
            } else {
                $('#form_tentativa_suicidio').hide();
            }
        })

        //CHECK Tentativa suicidio familiar
        if($('#socioeduk_saude_jovem_tentativa_suicidio_familiar').is(':checked'))
            $('#form_tentativa_suicidio_familiar').show();
        else
            $('#form_tentativa_suicidio_familiar').hide();

        $('#socioeduk_saude_jovem_tentativa_suicidio_familiar').click(function() {
            if(this.checked) {
                $('#form_tentativa_suicidio_familiar').show();
            } else {
                $('#form_tentativa_suicidio_familiar').hide();
            }
        })

        //CHECK doença mental familiar
        if($('#socioeduk_saude_jovem_doenca_mental_familiar').is(':checked'))
            $('#form_doenca_mental_familiar').show();
        else
            $('#form_doenca_mental_familiar').hide();

        $('#socioeduk_saude_jovem_doenca_mental_familiar').click(function() {
            if(this.checked) {
                $('#form_doenca_mental_familiar').show();
            } else {
                $('#form_doenca_mental_familiar').hide();
            }
        })

        //CHECK historico_doenca_tratamento
        if($('#socioeduk_saude_jovem_historico_doenca_tratamento').is(':checked'))
            $('#form_historico_doenca_tratamento').show();
        else
            $('#form_historico_doenca_tratamento').hide();

        $('#socioeduk_saude_jovem_historico_doenca_tratamento').click(function() {
            if(this.checked) {
                $('#form_historico_doenca_tratamento').show();
            } else {
                $('#form_historico_doenca_tratamento').hide();
            }
        })


        //CHECK Tem alergia alimentar
        if($('#socioeduk_saude_jovem_tem_alergia_alimentar').is(':checked'))
            $('#form_tem_alergia_alimentar').show();
        else
            $('#form_tem_alergia_alimentar').hide();

        $('#socioeduk_saude_jovem_tem_alergia_alimentar').click(function() {
            if(this.checked) {
                $('#form_tem_alergia_alimentar').show();
            } else {
                $('#form_tem_alergia_alimentar').hide();
            }
        })


        //CHECK Tem alergia medicamentosa
        if($('#socioeduk_saude_jovem_tem_alergia_medicamentosa').is(':checked'))
            $('#form_tem_alergia_medicamentosa').show();
        else
            $('#form_tem_alergia_medicamentosa').hide();

        $('#socioeduk_saude_jovem_tem_alergia_medicamentosa').click(function() {
            if(this.checked) {
                $('#form_tem_alergia_medicamentosa').show();
            } else {
                $('#form_tem_alergia_medicamentosa').hide();
            }
        })

    })
    
}

if (typeof Turbolinks == "undefined") {
    $(document).ready(ready);
} else {
    $(document).on("turbolinks:load", ready);
}
