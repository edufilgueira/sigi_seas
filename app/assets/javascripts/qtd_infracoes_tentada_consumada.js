
$(function () {
    var soma = 0;
    $(".tentada").each(function () {
        soma += Number($(this).html());
    });
    $("#resultado1 h4").text(soma);
})

$(function () {
    var soma = 0;
    $(".consumada").each(function () {
        soma += Number($(this).html());
    });
    $("#resultado2 h4").text(soma);
})

$(function () {
    var total = 0;
    $(".total").each(function () {
        total += Number($(this).html());
    });
    $("#resultadoTotal h4").text(total);
})

$(window).on("scroll load tr", function () {
    var tabela_topo = $(".tabelaFixa table").offset().top;
    var window_topo = $(this).scrollTop();

    $(".tabelaFixa table thead th").css({
        'top': tabela_topo - window_topo <= 0 ? window_topo - tabela_topo + 'px' : '0',
        'z-index': '9',
        'padding': '10px 0'
    });
})

