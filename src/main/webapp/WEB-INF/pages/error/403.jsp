<%@include file="../header.jsp"%>
<div class="container">

    <div class="starter-template">
        <h1>403 - Access is denied</h1>
        <div inline="text">Hello <security:authentication property="principal.username"/>, you do not have permission to access this page.</div>
    </div>

</div>
<%@include file="../footer.jsp"%>
