$(function() {
$('#myModal').on('show.bs.modal', function (event) {
  var btn = $(event.relatedTarget) // Button that triggered the modal
  console.log(btn.data());
  var modal = $(this)
})
});