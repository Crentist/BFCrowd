
<div class="modal hide fade in" id="confirmationdialog">
  <div class="modal-header">
    <button class="close" data-dismiss="modal">×</button>
    <h3 id="confirmationtitle">Modal header</h3>
  </div>
  <div class="modal-body">
    <p id="confirmationcontent">Modal body</p>
  </div>
  <div class="modal-footer">
    <a href="#" class="btn" id="confirmcancel" data-dismiss="modal">Close</a>
    <a href="#" class="btn btn-danger" id="confirmaccept" onClick="$('#confirmationdialog').modal('hide'); confirmAction(); return false;">Save changes</a>
  </div>
</div>