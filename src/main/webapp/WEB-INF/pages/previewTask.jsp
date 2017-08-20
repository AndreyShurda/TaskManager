<!-- Trigger the modal with a button -->
<button type="button" id="button_Preview_Modal" class="btn btn-info btn-lg" data-toggle="modal"
        data-target="#myModal">Open
  Modal
</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Task Details</h4>
      </div>
      <div class="modal-body">

        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">
              Name: <b><label id="lbName"/></b><br>
              email: <b><label id="lbEmail"/></b><br>
            </h3>
          </div>

          <div>
            <div class="panel-body">
              <div class="col-md-5">
                <img name="pr_logo" class="img-responsive img-thumbnail"
                     id="pr_output"/>
                <%--<img class="img-responsive img-thumbnail" src="data:image/png;base64,${task.getImage()}"/>--%>
              </div>
              <div class="col-md-7">
                <p id="lbComment">
                  <%--<label id="lbComment"/>--%>
                </p>
              </div>
            </div>
          </div>
        </div>
        <%--<div class="modal-body">--%>
        <%--<div class="form-group">--%>
        <%--<label class="col-sm-2 control-label">Name:</label>--%>

        <%--<div class="col-sm-10">--%>
        <%--<output type="text" class="form-control" id="pr_name" name="pr_name"/>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--<div class="form-group">--%>
        <%--<label class="col-sm-2 control-label">Task:</label>--%>

        <%--<div class="col-sm-10">--%>
        <%--<output type="text" class="form-control" id="pr_comment" name="pr_comment"/>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--<div class="form-group">--%>
        <%--<label id="pr_label" class="col-sm-2 control-label">Task:</label>--%>
        <%--</div>--%>

        <%--<div class="upload_img_wrapper">--%>
        <%--<img name="pr_logo" class="upload_img_wrapper" id="pr_output"/>--%>
        <%--</div>--%>
        <%--</div>--%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<script>
  $(document).ready(function () {
//                        $("#button_Preview").click(function () {
    $("#button_Preview_Modal").click(function () {
      var name = $('input[name="name"]').val();
      var email = $('input[name="email"]').val();
      var logo = $('input[name="file"]').val();
      var comment = $('textarea[name="comment"]').val();

      $('output[name="pr_name"]').val(name);
//                            $('output[name="pr_comment"]').val(comment);
      document.getElementById('lbName').innerHTML = name
      document.getElementById('lbEmail').innerHTML = email
      document.getElementById('lbComment').innerHTML = comment


//                            $.post('/task/prew.jsp',
//                                    {
//                                        name: name,
//                                        email: email,
//                                        logo: logo,
//                                        coment: comment
//                                    },
//                                    function (data) {
//                                        $("#toPreview").jsp(data);
//                                    }
//                            );
    });
  });
</script>
