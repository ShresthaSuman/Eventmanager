<%-- 
    Document   : index
    Created on : Nov 8, 2016, 1:48:19 PM
    Author     : Mr. Shrestha Suman
--%>


<%@page import="com.leapfrog.enquirymanagement.entity.Enquiry"%>
<%@page import="com.leapfrog.enquirymanagement.DAOImpl.EnquiryDAOImpl"%>
<%@page import="com.leapfrog.enquirymanagement.DAO.EnquiryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/assest/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assest/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assest/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/assest/js/bootstrap.min.js" type="text/javascript"></script>

    </head>
    <body>
        <h1>Enroll now</h1>
        <div class="container">
            <table class="table table-bordered">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                   
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <% EnquiryDAO enquiryDAO=new EnquiryDAOImpl(); %>
                <% for(Enquiry en:enquiryDAO.getAll()){ %>
                <tr>
                    <td><%=en.getId() %></td>
                    <td><%=en.getFirstName()+" "+ en.getLastName() %></td>
                    
                   
                    <td><%=en.getEmail() %></td>
                    <td><%=en.getContactNo()%></td>
                    <td><%=en.getStatus()%></td>
                   
                    </tr>
                
                <% } %>

            </table>

        </div>
    </body>
</html>
