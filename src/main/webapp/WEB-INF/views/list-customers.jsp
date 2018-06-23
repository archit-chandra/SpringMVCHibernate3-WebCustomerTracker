<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                <%--only visible to manager, admin--%>
                <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                    <input type="button" value="Add Customer"
                           onclick="window.location.href='showFormForAdd'; return false;"
                           class="add-button">
                </security:authorize>

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
                        <c:url var="updateLink"
                               value="/customer/showFormForUpdate">
                            <c:param name="customerId"
                                     value="${customer.id}"></c:param>
                        </c:url>

                        <%--construct an 'delete' link with customer id--%>
                        <c:url var="deleteLink" value="/customer/delete">
                            <c:param name="customerId"
                                     value="${customer.id}"></c:param>
                        </c:url>

                        <tr>
                            <td>${customer.firstName}</td>
                            <td>${customer.lastName}</td>
                            <td>${customer.email}</td>
                                <%--display the updae link--%>
                            <td>
                                <security:authorize
                                        access="hasAnyRole('MANAGER', 'ADMIN')">
                                    <a href="${updateLink}">Update</a>
                                </security:authorize>
                                <security:authorize
                                        access="hasAnyRole('ADMIN')">
                                    |
                                    <a href="${deleteLink}"
                                       onclick="if (!(confirm('Are you sure?'))) return false;">Delete</a>
                                </security:authorize>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%--Add a logout button--%>
        <form:form action="${pageContext.request.contextPath}/logout"
                   method="post">
            <input class="logout-button" type="submit" value="Logout">
        </form:form>
    </body>
</html>
