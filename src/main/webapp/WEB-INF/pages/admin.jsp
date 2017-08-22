<%--<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>--%>
<%@include file="header.jsp" %>
<div class="container">

    <div class="starter-template">
        <h1>Admin page</h1>

        <p inline="text">Hello <%= request.getUserPrincipal().getName() %>!.
            Now you can change status task on page "Tasks"
        </p>
    </div>

</div>
<%@include file="footer.jsp" %>
