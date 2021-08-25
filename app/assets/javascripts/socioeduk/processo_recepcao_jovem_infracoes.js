function calcularData(atributo) {
  var indice_id = atributo.id.split("_");
  var data_inicio = document.getElementById(''.concat('socioeduk_processo_recepcao_jovem_infracao_socioeduk_medida_socioeducativas_attributes_', indice_id[9], '_inicio')).value;
  var data_inicio = data_inicio.split('/')
  var data_inicio = new Date(''.concat(data_inicio[1], '/' ,data_inicio[0], '/' ,data_inicio[2]))
  var dias = parseInt(document.getElementById(''.concat('socioeduk_processo_recepcao_jovem_infracao_socioeduk_medida_socioeducativas_attributes_', indice_id[9], '_periodo_dias')).value);
  var data_fim = new Date();
  data_fim.setDate(data_inicio.getDate() + dias);
  document.getElementById(''.concat('socioeduk_processo_recepcao_jovem_infracao_socioeduk_medida_socioeducativas_attributes_', indice_id[9], '_fim_previsto')).value = data_fim.toLocaleDateString();
}