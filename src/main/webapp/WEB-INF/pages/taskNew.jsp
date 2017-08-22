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
                        <input type="file" name="file" accept="image/jpeg,image/png,image/gif"
                               onchange="loadFile(event)"/>

                        <script>
                            var loadFile = function (event) {
                                var output = document.getElementById('output');
                                var file = event.target.files[0];
                                output.src = URL.createObjectURL(file);
                                document.getElementById('pr_output').src = URL.createObjectURL(file);
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


                <div class="col-xs-12  col-sm-6 col-md-offset-2 col-md-4">
                    <p>
                        <button type="submit" class="btn btn-default btn-block">Save</button>
                    </p>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <p>
                        <button type="button" id="button_Preview_Modal" class="btn btn-default btn-block" data-toggle="modal"
                                data-target="#myModal">Open Modal
                        </button>
                    </p>
                </div>
                <%@include file="previewTask.jsp" %>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>