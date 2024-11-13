$(document).ready(function () {

  $("#example").DataTable({
    language: {
      url: '//cdn.datatables.net/plug-ins/2.1.8/i18n/es-ES.json',
    },
    columnDefs: [{ type: "string", target: [0, 1, 2, 3, 4, 5] }]
  });

});

$(document).on("click", ".abrirModal", function () {
  $("#Consecutivo").val($(this).attr("data-id"));
  $("#Nombre").text($(this).attr("data-name"));
})