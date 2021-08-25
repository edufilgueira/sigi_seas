var ready = function() {

$(function()
{
    //Executa a requisição quando o campo username perder o foco
    $('#pessoa_cpf').blur(function()
    {
        var cpf = $('#pessoa_cpf').val();
        if(validaCPF(cpf))
            $('#val_cpf').html('');
        else
        {
            $('#val_cpf').html('CPF inválido');            
            $('#pessoa_cpf').focus();    
        }
    });

    //Executa a requisição quando o campo username perder o foco
    $('#pessoa_email_pessoal').blur(function()
    {
        var cpf = $('#pessoa_email_pessoal').val();
        if(validaEmail(cpf))
            $('#val_email_pessoal').html('');
        else
            $('#val_email_pessoal').html('e-mail inválido');
    });

});

}
function dateToYMD(date) {
    data = new Date(date)
    var d = data.getDate();
    var m = data.getMonth() + 1; //Month from 0 to 11
    var y = data.getFullYear();
    return (d <= 9 ? '0' + d : d) + '/' + (m<=9 ? '0' + m : m) + '/' + y;
}

function buscarPessoaNoSisrhPorCpf(){
    
    $('select').removeClass("select2-hidden-accessible");
    $('.select2-selection--single').css("display", "none");
    
    var texto = $('#pessoa_cpf').val();
    texto = texto.replace(".","");
    texto = texto.replace(".","");
    texto = texto.replace("-","");
    
    $.ajax({
        url: "https://172.27.39.116:7005/registrations/find_by_cpf",
        type: 'ajax',
        method: 'GET',
        data: { cpf: texto },
        success: function(data,status,xhr) {

            if(data != null)
            {
                if (data.birth_date != null)
                {
                    $('#pessoa_data_nascimento').val(dateToYMD(data.birth_date));
                }

                $('#pessoa_nome').val(data.name);
                $('#pessoa_email_pessoal').val(data.email);
                $('#pessoa_nome_pai').val(data.father_name);
                $('#pessoa_nome_mae').val(data.mother_name);
                $('#pessoa_profissao').val(data.profession);
                $('#pessoa_tipo_sanguineo').val(data.blood_type);
                $('#pessoa_rua').val(data.street);
                $('#pessoa_numero').val(data.address_number);
                $('#pessoa_complemento').val(data.address_extra_data);
                $('#pessoa_bairro').val(data.neighborhood);
                $('#pessoa_cidade').val(data.city);
                $('#pessoa_telefone').val(data.phone);
                $('#pessoa_celular').val(data.mobile_phone);
                $('#pessoa_cep').val(data.cep);
                $('#pessoa_pis').val(data.pis_pasep);
                $('#pessoa_ctps').val(data.ctps);
                $('#pessoa_serie').val(data.serie);
                $('#pessoa_rg').val(data.rg);
                $('#pessoa_emissor').val(data.emitted_by);
                $('#pessoa_emissao').val(data.emitted_at);
                $('#pessoa_titulo_eleitoral').val(data.electoral_title);
                $('#pessoa_zona').val(data.zone);
                $('#pessoa_secao').val(data.section);
                $('#pessoa_cidade_eleitoral').val(data.electoral_city);
                $('#pessoa_estado_eleitoral').val(data.electoral_state);
                $('#pessoa_banco').val(data.bank);
                $('#pessoa_agencia').val(data.bank_agency);
                $('#pessoa_conta_corrente').val(data.bank_account);
                $('#pessoa_sexo').val(data.sex);
                $('#pessoa_uf').val(data.state);
                $('#pessoa_estado_civil').val(data.marital_status);
                $('#pessoa_naturalidade').val(data.place_of_birth);
                $('#pessoa_conjuge').val(data.spouse);
                $('#pessoa_certificado_militar').val(data.reserve_certificate);
                $('#pessoa_emissor_militar').val(data.military_emitter);

                //LIMPAR O VALIDADOR
                $('#val_cpf').html("");
            }
            else
                $('#val_cpf').html("Colaborador não encontrado no SISRH.");
        }

    });
    
}


if (typeof Turbolinks == "undefined") {
    $(document).ready(ready);
} else {
    $(document).on("turbolinks:load", ready);
}
