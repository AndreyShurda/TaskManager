<%@include file="header.jsp" %>
<%--<div class="container">--%>
<div class="container content">

    <div class="starter-templ">
        <h1>Task Manager</h1>
        <div class="col-sm-12">
            <ol>
                <li> The tasks consist of:
                    <ul>
                        <li>user name;</li>
                        <li>e-mail;</li>
                        <li>task text;</li>
                        <li>image</li>
                    </ul>
                    <br><br>
                </li>
                <li>
                    Requirements for images - JPG / GIF / PNG format, no more than 320x240 pixels.
                    When trying to upload a larger image,
                    the image should be proportionally reduced to the specified size.
                    <br><br>
                </li>
                <li>Any visitor can create new tasks. Before saving a new task, you can click "Preview",
                    it should work without reloading the page.
                    <br><br>
                </li>
                <li> Make an entry for the administrator (login "admin", password "123").
                    The administrator has the ability to edit the text of the task and put a tick about the
                    implementation.
                    Executed tasks in the general list are displayed with the appropriate mark.
                    <br><br>
                </li>
                <li>
                    In the task list you need to make the ability to sort by user name, email and status.
                </li>
            </ol>

        </div>
    </div>

</div>
<%@include file="footer.jsp" %>
