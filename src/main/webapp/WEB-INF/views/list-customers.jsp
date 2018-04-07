<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Customer List</title>
        <%--reference our style sheet--%>
        <link type="text/css"
              rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/css/style.css"/>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <h2>CRM - Customer Relationship Manager</h2>
            </div>
        </div>
        <div id="container">
            <div id="content">
                <%--add customer button--%>
                <input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;"
                       class="add-button">
                <%--add out html table here--%>
                <table>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                    <%--loop over and print our customers--%>
                    <c:forEach var="customer" items="${customers}">

                        <%--construct an 'update' link with customer id--%>
                        <c:url var="updateLink" value="/customer/showFormForUpdate">
                            <c:param name="customerId" value="${customer.id}"></c:param>
                        </c:url>

                        <%--construct an 'delete' link with customer id--%>
                        <c:url var="deleteLink" value="/customer/delete">
                            <c:param name="customerId" value="${customer.id}"></c:param>
                        </c:url>

                        <tr>
                            <td>${customer.firstName}</td>
                            <td>${customer.lastName}</td>
                            <td>${customer.email}</td>
                                <%--display the updae link--%>
                            <td><a href="${updateLink}">Update</a></td>
                            |
                            <td><a href="${deleteLink}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
