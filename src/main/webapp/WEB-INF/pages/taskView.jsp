<%@include file="header.jsp" %>
<div class="container">
    <h2>Task Details</h2>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                Name: <b> ${task.name}</b><br>
                email: <b> ${task.email}</b><br>
                Status: <b>${task.taskStatus}</b>
            </h3>
        </div>

        <div>
            <div class="panel-body">
                <div class="col-md-5">
                    <img class="img-responsive img-thumbnail" src="data:image/png;base64,${task.getImage()}"/>
                </div>
                <div class="col-md-7">
                    <p>
                        ${task.comment}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>