<%@include file="header.jsp" %>
<%@ page import="com.taskmanager.enums.TaskStatus" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="container">
    <div class="starter-templ">
        <h2>Task Details</h2>
        <div>
            <form class="form-horizontal" action="/task" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Icon:</label>
                    <div class="col-sm-10">
                        <div class="upload_img_wrapper">
                            <img name="logo" class="upload_img_wrapper" id="output"/>
                        </div>
                        <input type="file" name="file" accept="image/png" onchange="loadFile(event)"/>

                        <script>
                            var loadFile = function (event) {
                                var output = document.getElementById('output');
                                var file = event.target.files[0];
                                output.src = URL.createObjectURL(file);
                            };
                        </script>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" value="${task.name}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Email:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="email" value="${task.email}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Task:</label>
                    <div class="col-sm-10">
                        <p><textarea rows="5" cols="45" type="text" class="form-control" name="comment"
                                     value="${task.comment}">${task.comment}</textarea>
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <%--<label class="col-sm-2 control-label">Task status:</label>--%>
                    <div class="col-sm-10">
                        <select hidden name="taskStatus" class="selected">
                            <c:forEach items="<%= TaskStatus.values() %>" var="status">
                                <option ${status == task.taskStatus ? 'selected' : ''} value="${status}">
                                        ${status}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <!-- Trigger the modal with a button -->
                <button type="button" id="button_Preview_Modal" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open
                    Modal
                </button>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Name:</label>
                                    <div class="col-sm-10">
                                        <output type="text" class="form-control" id="pr_name" name="pr_name"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Task:</label>
                                    <div class="col-sm-10">
                                        <output type="text" class="form-control" id="pr_comment" name="pr_comment"/>
                                    </div>
                                </div>


                                <div class="upload_img_wrapper">
                                    <img name="pr_logo" class="upload_img_wrapper" id="pr_output"/>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>


                <div class="col-xs-12  col-sm-6 col-md-offset-2 col-md-4">
                    <p><!-- вызов модального окна для предпросмотра -->
                        <input type="button" class="btn btn-default btn-block" name="button_Preview"
                               id="button_Preview" value='Предварительный просмотр' data-toggle="modal"
                               data-target="#Preview">
                    </p>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="Preview" tabindex="-1" role="dialog" aria-labelledby="mLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="mLabel">Предварительный просмотр</h4>
                            </div>
                            <div class="modal-body">
                                <div id="toPreview"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
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
                            $('output[name="pr_comment"]').val(comment);
//                            $('img[name="pr_logo"]').val(logo);
                            var output = document.getElementById('pr_output');
                            output.src = URL.createObjectURL(logo);
//                            pr_name = name;


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

                <div class="row">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>