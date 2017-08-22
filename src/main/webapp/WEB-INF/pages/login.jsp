<%@include file="header.jsp" %>
<%--<div class="container">--%>
<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
        <form action="/login" method="post">
            <fieldset>
                <h1>Please Sign In</h1>

                <c:if test="${param.error ne null}">
                    <div class="alert alert-danger">
                        Invalid username and password.
                    </div>
                </c:if>
                <c:if test="${param.logout ne null}">
                    <div class="alert alert-info">
                        You have been logged out.
                    </div>
                </c:if>


                <div class="form-group">
                    <input type="text" name="username" id="username" class="form-control input-lg"
                           placeholder="UserName" required="true" autofocus="true"/>
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control input-lg"
                           placeholder="Password" required="true"/>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign In"/>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>

</div>
<%--<div class="container" style="margin:50px">--%>
<%--<h3>Spring Security Login Example</h3>--%>
<%--<c:if test="${param.error ne null}">--%>
<%--<div style="color: red">Invalid credentials.</div>--%>
<%--</c:if>--%>
<%--<form action="/login" method="post">--%>
<%--<div class="form-group">--%>
<%--<label for="username">UserName: <input type="text"--%>
<%--class="form-control" id="username" name="username">--%>
<%--</label>--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label for="pwd">Password:</label> <input type="password"--%>
<%--class="form-control" id="pwd" name="password">--%>
<%--</div>--%>

<%--<button type="submit" class="btn btn-success">Submit</button>--%>

<%--<input type="hidden" name="${_csrf.parameterName}"--%>
<%--value="${_csrf.token}"/>--%>
<%--</form>--%>
<%--</div>--%>

<%@include file="footer.jsp" %>
