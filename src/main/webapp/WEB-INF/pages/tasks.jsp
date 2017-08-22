<%@include file="header.jsp" %>
<%--<link href="http://mottie.github.io/tablesorter/css/theme.default.css" rel="stylesheet">--%>
<script type="text/javascript"
        src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script>
    $(function () {
        $("#sortTasks").tablesorter({widgets: ['zebra']});
    });
</script>
<div class="container">

    <div class="starter-templ">
        <c:if test="${!empty tasks}">
            <%--<table  class="table table-hover">--%>
            <%--<table id="sortTasks" class="tablesorter table table-hover">--%>
            <table id="myTable" class="table table-hover">
                <thead>
                <tr>
                    <th width="10">ID</th>
                    <th width="100">Icon</th>
                    <th width="100" class="field_to_order" onclick="sortTable(2)">Name<span class="up glyphicon"></span>
                    </th>
                    <th width="100" class="field_to_order" onclick="sortTable(3)">Email<span
                            class="up glyphicon"></span></th>
                    <th>Task</th>
                    <th width="120" class="field_to_order" onclick="sortTable(5)">Status<span
                            class="up glyphicon"></span></th>
                    <th width="40"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${tasks}" var="task">
                    <tr>
                        <td>${task.id}</td>
                        <td><a href="/task/view/${task.id}"> <img class="img_sm img-rounded"
                                                                  src="data:image/png;base64,${task.getImage()}"></a>
                        </td>
                        <td>${task.name}</td>
                        <td>${task.email}</td>
                        <td>${task.comment}</td>
                        <td>${task.taskStatus}</td>
                        <td>
                            <security:authorize access="isAuthenticated()">
                                <a class="btn btn-warning btn-sm" href="/task/edit/${task.id}"
                                   role="button">Edit</a><br><br>
                            </security:authorize>
                            <a class="btn btn-default btn-sm" href="/task/view/${task.id}" role="button">View</a>
                        </td>
                            <%--<td><a href="<c:url value='/edit/${task.id}'/>">Edit</a></td>--%>
                            <%--<td><a href="<c:url value='/remove/${task.id}'/>">Delete</a></td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

</div>

<script>
    $(document).ready(function () {
        $(".field_to_order").click(function () {
            $(this).children("span").toggleClass("up");

        });
    });
</script>
<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("myTable");
        switching = true;
        //Set the sorting direction to ascending:
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.getElementsByTagName("TR");
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchcount++;
            } else {
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
</script>
<%@include file="footer.jsp" %>
