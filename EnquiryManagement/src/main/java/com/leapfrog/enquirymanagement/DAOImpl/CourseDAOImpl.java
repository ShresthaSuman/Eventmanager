/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.enquirymanagement.DAOImpl;

import com.leapfrog.enquirymanagement.DAO.CourseDAO;
import com.leapfrog.enquirymanagement.entity.Course;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mr. Shrestha Suman
 */
public class CourseDAOImpl implements CourseDAO {

    @Override
    public List<Course> getAll() throws ClassNotFoundException, SQLException {
        List<Course> courseList=new ArrayList<>();
        Course course=null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/enquiries","root","");
        String query="SELECT * FROM courses";
        PreparedStatement stmt=conn.prepareStatement(query);
        ResultSet rs= stmt.executeQuery();
         while(rs.next()){ 
         course=new Course();
         course.setId(rs.getInt("course_id"));
         course.setName(rs.getString("course_name"));
         course.setDescription(rs.getString("course_description"));
         course.setFees(rs.getString("fees"));
         course.setStatus(rs.getBoolean("status"));
         courseList.add(course);
       }
         conn.close();
         return courseList;
    }
    
}
