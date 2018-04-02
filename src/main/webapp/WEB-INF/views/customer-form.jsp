<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Customer Form</title>
        <%--reference our style sheet--%>
        <link type="text/css"
              rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/css/style.css"/>
        <link type="text/css"
              rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/css/add-customer-style.css"/>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <h2>CRM - Customer Relationship Manager</h2>
            </div>
            <div id="container">
                <h3>Save Customer</h3>
                <form:form action="saveCustomer" modelAttribute="customer" method="post">
                    <table>
                        <tbody>
                        <tr>
                            <td><label>First Name:</label></td>
                            <td><form:input path="firstName"></form:input></td>
                        </tr>
                        <tr>
                            <td><label>Last Name:</label></td>
                            <td><form:input path="lastName"></form:input></td>
                        </tr>
                        <tr>
                            <td><label>Email:</label></td>
                            <td><form:input path="email"></form:input></td>
                        </tr>
                        <tr>
                            <td><label></label></td>
                            <td><input type="submit" value="Save" class="save"></td>
                        </tr>
                        </tbody>
                    </table>
                </form:form>
            </div>
        </div>
    </body>
</html>