<%--<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>--%>
<div align="center">
    <footer>
        <p>Copyright &copy; 2017</p>
        <security:authorize access="isAuthenticated()">
            | Logged user: <security:authentication property="principal.username"/>
            | Roles: <security:authentication property="principal.authorities"/> |
            <a href="/logout">Sign Out</a>

            </span>
        </security:authorize>
    </footer>
</div>

</body>

</html>