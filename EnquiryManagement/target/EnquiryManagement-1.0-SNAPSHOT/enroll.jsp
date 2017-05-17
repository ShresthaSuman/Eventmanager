<%-- 
    Document   : enroll
    Created on : Nov 7, 2016, 9:18:16 AM
    Author     : Mr. Shrestha Suman
--%>


<%@page import="com.leapfrog.enquirymanagement.entity.Enquiry"%>
<%@page import="com.leapfrog.enquirymanagement.DAO.EnquiryDAO"%>
<%@page import="com.leapfrog.enquirymanagement.DAOImpl.EnquiryDAOImpl"%>
<%@page import="com.leapfrog.enquirymanagement.entity.Course"%>
<%@page import="com.leapfrog.enquirymanagement.DAOImpl.CourseDAOImpl"%>
<%@page import="com.leapfrog.enquirymanagement.DAO.CourseDAO"%>
<%
            EnquiryDAO enquiryDAO=new EnquiryDAOImpl();
            if(request.getMethod().equalsIgnoreCase("post")){
            Enquiry enquiry =new Enquiry();
            enquiry.setFirstName(request.getParameter("first_name"));
            enquiry.setLastName(request.getParameter("last_name"));
            enquiry.setEmail(request.getParameter("email"));
            enquiry.setContactNo(request.getParameter("Contact"));
            Course course=new Course();
            course.setId(Integer.parseInt(request.getParameter("course_id")));
            enquiry.setCourse(course);
            enquiry.setMessage(request.getParameter("message"));
            enquiry.setType("website");
            enquiryDAO.insert(enquiry);
            
            
            }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="assest/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="assest/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assest/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="assest/js/bootstrap.min.js" type="text/javascript"></script>

    </head>
    <body>
        <h1>Enroll</h1>

      
        <div class="container">
              <%
            CourseDAO courseDAO = new CourseDAOImpl();
        %>
            <form action=""  method="POST" class="form-horizontal">
                <div class="form-group">
                    <label> First Name:</label>
                    <input type="text" name="first_name" required="required" class="form-control">
                </div>
                <div class="form-group">
                    <label> Last Name:</label>
                    <input type="text" name="last_name" required="required" class="form-control">
                </div>
                <div class="form-group">
                    <label> Email:</label>
                    <input type="text" name="email" required="required" class="form-control">
                </div>
                <div class="form-group">
                    <label> Contact Number:</label>
                    <input type="text" name="Contact" required="required" class="form-control">
                </div>
                <div class="form-group">
                   <label> Course </label>
                    <select name="course_id" required="required">
                       
                        <% for (Course c : courseDAO.getAll()) {%>
                        <option  value="<%= c.getId()%>" requird="required" class="form-control"><%= c.getName()%></option>
                        <% }%>


                    </select>

                </div>
                <div class="form-group">
                    <label>Message</label>
                    <textarea name="message" required="required" class="form-control"></textarea>
                </div>
                        <div>
                            <button type="submit" class="btn-success">Enroll</button>
                            </div>
                        
            </form>
        </div>
    </body>
</html>
