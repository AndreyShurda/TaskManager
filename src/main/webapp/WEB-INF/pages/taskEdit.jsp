<%@include file="header.jsp" %>
<%@ page import="com.taskmanager.enums.TaskStatus" %>
<div class="container">
    <div class="starter-templ">
        <h2>Task Details</h2>
        <div>
            <form class="form-horizontal" object="task" action="/task/${task.id}" method="post"
                  enctype="multipart/form-data">

                <div class="form-group">
                    <label class="col-sm-2 control-label">Task status:</label>
                    <div class="col-sm-10">
                        <select name="taskStatus">
                            <c:forEach items="<%= TaskStatus.values() %>" var="status">
                                <option ${status == task.taskStatus ? 'selected' : ''} value="${status}">
                                        ${status}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>


                <input type="hidden" field="${task.id}"/>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Icon:</label>
                    <div class="col-sm-10">
                        <td><img src="data:image/png;base64,${task.getImage()}"/></td>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Name:</label>
                    <div class="col-sm-10">
                        <b>${task.name}</b>
                        <%--<input type="text" class="form-control" name="name" value="${task.name}"/>--%>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Email:</label>
                    <div class="col-sm-10">
                        <b>${task.email}</b>
                        <%--<input type="text" class="form-control" name="email" value="${task.email}"/>--%>
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
                    <div class="col-sm-offset-2 col-sm-8">
                        <button type="submit" class="btn btn-default">Save change</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>