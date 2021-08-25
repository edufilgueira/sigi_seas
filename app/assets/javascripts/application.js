// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/jquery-ui.min.js
//= require sortable/sorttable.js
//= require clockpicker/clockpicker.js
//= require maskmoney/mask-money.js
//= require metisMenu/jquery.metisMenu.js
//= require bootstrap-sprockets
//= require pace/pace.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require jquery_ujs
//= require moment
//= require select2
//= require Chart.bundle
//= require chartkick
//= require select2-full
//= require toastr/toastr.min.js
//= require turbolinks
//= require autocomplete_zipcode
//= require nested_form_fields
//= require tinymce 
//= require_tree .
//= require bootstrap-modal
//= require apexcharts
//= require Chart.min
//= require sweetalert2
//= require sweet-alert2-rails


function datepicker(){
  //$('#'+object.id).focus();
  $('.datepicker').datepicker({
    format: "dd/mm/yyyy",
    todayBtn: "linked",
    clearBtn: true,
    language: "pt-BR",
    autoclose: true,
    todayHighlight: true
  });
}

function clockpicker() {
  $('.clockpicker').clockpicker({
    placement: 'top',
    align: 'left',
    donetext: 'Ok'
  });
}

function datetimepicker(){
  $('.datetimepicker').datetimepicker();
}

// atualiza todos os selects para select2
function atualizar_select2(){
  $('select').attr('class', 'form-control select2');
  $('.nested_fields select').attr('class', 'form-control');
}

function select2(){
  $(".select2").select2({
    theme: "bootstrap"
  });
  $( ".select2tags" ).select2({
    theme: "bootstrap", 
    tags: true
  });
}

function executar_mascaras_campos(){
  var delay=1500;
  setTimeout(function(){
    datepicker();
    datetimepicker();
    //select2();
  },delay);
}

function close_modal_auxiliar(){
  $('#modalAuxiliar').modal('hide');
}

(function($){
  $.fn.datepicker.dates['pt-BR'] = {
    days: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"],
		daysShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"],
		daysMin: ["Do", "Se", "Te", "Qu", "Qu", "Se", "Sa", "Do"],
		months: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
		monthsShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
		today: "Hoje",
		clear: "Limpar"
	};
}(jQuery));

function contador_regressivo(data, idElement, horas_adicinais){
  setInterval(function() {
    var dtfim = moment(data, "DD/MM/YYYY hh:mm:ss");
    dtfim.add(horas_adicinais,'hours');
    var at = moment(new Date(), "DD/MM/YYYY hh:mm:ss");
    var distance = dtfim.diff(at, 'seconds');
    var days = Math.floor(distance / (60 * 60 * 24));
    var hours = Math.floor((distance % (60 * 60 * 24)) / (60 * 60));
    var minutes = Math.floor((distance % (60 * 60)) / (60));
    var seconds = Math.floor((distance % (60)));
    valor = (distance > 0) ? "<span style='font-size:14px' class='label label-info'>" + hours + ":" + minutes + ":" + seconds + "</span>": "<span style='font-size:14px' class='label label-danger'>EXPIRADO</span>";
    
    if(distance <= 0){
      var data_inicial = moment(data, "DD/MM/YYYY hh:mm");
      var data_atual = at;//moment(new Date(), "DD/MM/YYYY hh:mm");
      
      atrazo = data_atual.diff(data_inicial);

      var day = 1000 * 60 * 60 * 24;
      var days = Math.floor(atrazo/day);
      var months = Math.floor(days/31);
      var years = Math.floor(months/12);
      days =  days - (Math.floor(days/30)*30)
      message = ''; 
      if(years>0){
        text = " ano ";
        if(years > 1) text = " anos "
        message += years + text;
      }
      if(months>0){
        text = " mes ";
        if(months > 1) text = " meses "
        message += months + text;
      }
      if(days>0){
        text = " dia ";
        if(days > 1) text = " dias "
        message += days + text;
      }
      valor = "<span style='font-size:14px' class='label label-danger'>"+message+"</span>";
    }
    $("#"+idElement).html(valor);
  }, 1000);
}

var ready = function() {

  $(".sortable").addSortWidget();

  $('.add_nested_fields_link').click(function() {
    var delay=500;
    setTimeout(function(){
      datepicker();
      datetimepicker();
      //atualizar_select2();
      select2();
      $('.maskdata').mask('00/00/0000', {reverse: false});
      $('.maskhora').mask('00:00', {reverse: false});
      $('.maskdatahora').mask('00/00/0000 00:00', {reverse: false});
      $('.maskprocesso').mask('9999999-99.9999.9.99.9999');
      $('.maskphonecelular').mask('(00)00000-0000', {reverse: false});
      $(".maskcep").mask("99999-999");
    },delay);
  });

  $('[data-tooltip="true"]').tooltip();

  $('.sidebar-toggle').click(function() {
    setTimeout(function() {
      hasKlass = $('body').hasClass('sidebar-collapse');
      $.get(root_path + 'sidebar_preference?sidebar_preference=' + hasKlass);
    }, 300);
  });

  atualizar_select2();

  select2();

  recarreca_campos();

  $('[type="submit"], a[data-method="post"]').click(function() {
    $('#box-loading').children('.box-loading-content').toggleClass('sk-loading');
  });
  
  datetimepicker();

  datepicker();

  document.addEventListener('zipcode.error', function(e) {
    alert('Cep invalido!!!');
  });

  $('.currency').maskMoney({
    prefix: 'R$ ',
    allowNegative: true,
    thousands: '',
    decimal: '.',
    affixesStay: false
  });

  $('.maskcpf').mask('000.000.000-00', {reverse: true});
  $('.maskdata').mask('00/00/0000', {reverse: false});
  $('.maskhora').mask('00:00', {reverse: false});
  $('.maskdatahora').mask('00/00/0000 00:00', {reverse: false});
  $('.mask-numero-viproc').mask('00000000/0000', {reverse: true});
  $('.maskphonecelular').mask('(00)00000-0000', {reverse: false});
  $(".mask-placa").mask("AAA-9999");
  $(".maskcep").mask("99999-999");
  
  
  /************************* ORGANIZA O NESTED FOR *************************/
  $(document).ready(function(e) {
    $(".table-nested-identify .form-control").attr("class", "table-nested");
    $(".table-nested-identify").attr("style", "border-top: 0px solid #e7eaec;border-bottom: 1px solid #e7eaec; margin-top: -16px;padding-top: 13px;");
    $(".nested-row").attr("style", "border-right: 0px solid #e7eaec;");
    $(".exibe_nested_radio").attr("class","esconde_nested_radio");
    $(".esconde_nested_campo").attr("class","exibe_nested_campo");
  });

  $('.deletar-nested').attr('title','Selecione para excluir');
}

function editarLinhaNested(id){  
  var classe = $("#"+id+" .table-nested").attr("class");
  
  if(classe == 'table-nested'){
    $("#"+id+" .table-nested").attr("class", "form-control");
    $("#"+id+' .btn-primary').attr("class","btn btn-xs btn-danger");
    $("#"+id+' .esconde_nested_radio').attr("class","exibe_nested_radio");
    $("#"+id+' .exibe_nested_campo').attr("class","esconde_nested_campo");
    select2();
  }
  else if(typeof classe == "undefined"){
    $("#"+id+" .form-control").attr("class", "table-nested");
    $("#"+id+' .btn-danger').attr("class","btn btn-xs btn-primary");
    $("#"+id+' .exibe_nested_radio').attr("class","esconde_nested_radio");
    $("#"+id+' .esconde_nested_campo').attr("class","exibe_nested_campo");
  }
}

/****************************** AND NESTED FOR *****************************/

function recarreca_campos() {
  if ($("#servico_realizado_eixo_id option:selected").val() != "")
    $('#servico_realizado_eixo_id').trigger('change');
  if ($("#servico_realizado_area_id option:selected").val() != "")
    $('#servico_realizado_area_id').trigger('change');
  if ($("#servico_realizado_unidade_socioeducativa_id option:selected").val() != "")
    $('#servico_realizado_unidade_socioeducativa_id').trigger('change');
  if ($("#servico_realizado_mes option:selected").val() != "")
    $('#servico_realizado_mes').trigger('change');
}

$(document).on('turbolinks:request-start',  function() {  $('#box-loading').children('.box-loading-content').toggleClass('sk-loading'); });
$(document).on('turbolins:request-end', function() { $('#box-loading').children('.box-loading-content').toggleClass('sk-loading'); });

$(document).on('turbolinks:render', function() {
  if ($('.box-loading-content').hasClass('sk-loading')) {
    $('#box-loading').children('.box-loading-content').toggleClass('sk-loading');
  }
});

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
} else {
  $(document).on("turbolinks:load", ready);
}

function calcular_qtd_de_anos_relacionado_data_atual(campo){
  var hoje = new Date();
  str = $(campo).val();
  data = str.substring(0, 10);

  var partes_data = data.split('/');
  var data_formatada = (partes_data[1] + '-' + partes_data[0] + '-' + partes_data[2]);
  var data = new Date(data_formatada);

  anos = Math.floor((hoje - data) / (24 * 60 * 60 * 1000));
  anos = Math.floor(anos / 365);
  return anos;
}

function validaCPF(cpf) {
  cpf = cpf.replace('.','');
  cpf = cpf.replace('.','');
  cpf = cpf.replace('-','');
  
  erro = new String;
  if (cpf.length < 11) erro += "Sao necessarios 11 digitos para verificacao do CPF! \n\n"; 
  var nonNumbers = /\D/;
  if (nonNumbers.test(cpf)) erro += "A verificacao de CPF suporta apenas numeros! \n\n";  
  if (cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999"){
    erro += "Numero de CPF invalido!"
  }
  var a = [];
  var b = new Number;
  var c = 11;
  for (i=0; i<11; i++){
    a[i] = cpf.charAt(i);
    if (i <  9) b += (a[i] *  --c);
  }
  if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11-x }
  b = 0;
  c = 11;
  for (y=0; y<10; y++) b += (a[y] *  c--); 
  if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11-x; }
  status = a[9] + ""+ a[10]
  if ((cpf.charAt(9) != a[9]) || (cpf.charAt(10) != a[10])){
    erro +="Digito verificador com problema!";
  }
  if (erro.length > 0){
    return false;
  }
  return true;
}

function validaEmail(email) {
  var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
  return regex.test(email);
}

function calcularIdade(data) {
  var partes_data_nascimento = data.split('/');
  var data_nascimento_formatada = (partes_data_nascimento[1] + '-' + partes_data_nascimento[0] + '-' + partes_data_nascimento[2]);
  var data_nascimento = new Date(data_nascimento_formatada);
  var hoje = new Date();
  var idade = Math.floor((hoje - data_nascimento) / (365.25 * 24 * 60 * 60 * 1000));
  $('#idade').empty().html(''.concat(idade, ' anos'));
  //return idade;
}

function control_space(){
var pressedCtrl = false; //variável de controle 
	$(document).keyup(function (e) {  //O evento Kyeup é acionado quando as teclas são soltas
    if(e.which == 17) {
      pressedCtrl=false; //Quando qualuer tecla for solta é preciso informar que Crtl não está pressionada
      //alert('soultou');
    }
	})
	$(document).keydown(function (e) { //Quando uma tecla é pressionada
    if(e.which == 17){
      pressedCtrl = true; //Informando que Crtl está acionado
      //alert('apertou');
    }
		if((e.which == 32 || e.keyCode == 32) && pressedCtrl == true) { //Reconhecendo tecla Enter
      alert('O comando Crtl+Space foi acionado');
      pressedCtrl=false;
		} 
  });
}
control_space();

// funcao para exibir imagem em tela cheia
function makeFullScreen() {
  var divObj = document.getElementById("theImage");
  //Use the specification method before using prefixed versions
  if (divObj.requestFullscreen) {
    divObj.requestFullscreen();
  }
  else if (divObj.msRequestFullscreen) {
    divObj.msRequestFullscreen();               
  }
  else if (divObj.mozRequestFullScreen) {
    divObj.mozRequestFullScreen();      
  }
  else if (divObj.webkitRequestFullscreen) {
    divObj.webkitRequestFullscreen();       
  } else {
    console.log("Fullscreen API is not supported");
  } 
}


function retira_acentos(str) 
{
    com_acento = "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝŔÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿŕ";
    sem_acento = "AAAAAAACEEEEIIIIDNOOOOOOUUUUYRsBaaaaaaaceeeeiiiionoooooouuuuybyr";
    novastr="";
    for(i=0; i<str.length; i++) {
        troca=false;
        for (a=0; a<com_acento.length; a++) {
            if (str.substr(i,1)==com_acento.substr(a,1)) {
                novastr+=sem_acento.substr(a,1);
                troca=true;
                break;
            }
        }
        if (troca==false) {
            novastr+=str.substr(i,1);
        }
    }
    return novastr;
}  

$(function () {
  $("#tabela input").on('click keyup change load', function () {
      var index = $(this).parent().index();
      var nth = "#tabela td:nth-child(" + (index + 1).toString() + ")";
      var valor = $(this).val().toUpperCase();
      $("#tabela tbody tr").show();
      $(nth).each(function () {
          if ($(this).text().toUpperCase().indexOf(valor) < 0) {
              $(this).parent().hide();
          }
      });
  });

  $("#tabela input").blur(function () {
      $(this).val("");
  });
});