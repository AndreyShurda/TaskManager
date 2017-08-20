<%@include file="header.jsp"%>
<div class="container">

    <div class="starter-templ">
        <h1>Spring Boot Web JSP Example</h1>
        <h2>Message: ${message}</h2>
        <c:if test="${!empty tasks}">
            <table class="table table-hover">
                <tr>
                    <th width="10">ID</th>
                    <th width="100">Icon</th>
                    <th width="100">Name</th>
                    <th width="100">Email</th>
                    <th>Task</th>
                    <th width="120">Status</th>
                    <th width="40">Edit</th>
                    <%--<th width="60">Delete</th>--%>
                </tr>
                <c:forEach items="${tasks}" var="task">
                    <tr>
                    <%--<tr onclick="location.href='SomeWherrrreOverTheWebsiiiite.html'">**--%>
                        <td>${task.id}</td>
                        <td><a href="/task/view/${task.id}"> <img class="img_sm img-rounded" src="data:image/png;base64,${task.getImage()}"></a></td>
                        <td>${task.name}</td>
                        <td>${task.email}</td>
                        <td>${task.comment}</td>
                        <td>${task.taskStatus}</td>
                        <%--<td><a href="/task/edit/${task.id}" target="_blank">${task.id}</a>Edit</td>--%>
                        <td><a href="/task/edit/${task.id}"/>Edit</td>
                    <%--<td><a href="<c:url value='/edit/${task.id}'/>">Edit</a></td>--%>
                            <%--<td><a href="<c:url value='/remove/${task.id}'/>">Delete</a></td>--%>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

</div>
<%@include file="footer.jsp"%>