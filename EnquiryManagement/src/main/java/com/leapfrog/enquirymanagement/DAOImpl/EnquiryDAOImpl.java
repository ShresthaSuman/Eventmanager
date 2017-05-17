/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.enquirymanagement.DAOImpl;

import com.leapfrog.enquirymanagement.DAO.EnquiryDAO;
import com.leapfrog.enquirymanagement.entity.Enquiry;
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
public class EnquiryDAOImpl implements EnquiryDAO {

    @Override
    public List<Enquiry> getAll() throws SQLException, ClassNotFoundException {
     List<Enquiry> enquiryList=new ArrayList<>();
        Enquiry enquiry=null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/enquiries","root","");
        String query="SELECT * FROM enquiries";
        PreparedStatement stmt=conn.prepareStatement(query);
        ResultSet rs= stmt.executeQuery();
        while(rs.next()){
            enquiry=new Enquiry();
            enquiry.setId(rs.getInt("enquiry_id"));
            enquiry.setFirstName(rs.getString("first_name"));
            enquiry.setLastName(rs.getString("last_name"));
            enquiry.setEmail(rs.getString("email"));
            enquiry.setContactNo(rs.getString("contact_no"));
            enquiry.setMessage(rs.getString("message"));
            enquiry.setStatus(rs.getString("enquiry_status"));
            enquiry.setIsRead(rs.getBoolean("is_read"));
            enquiryList.add(enquiry);
            
        }
        conn.close();
        return enquiryList;
        
        
    }

    @Override
    public int insert(Enquiry enquiry) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/enquiries","root","");
        String query="INSERT INTO enquiries(first_name,last_name,email,contact_no,course_id,message,enquiry_type) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement stmt=conn.prepareStatement(query);
        stmt.setString(1, enquiry.getFirstName());
         stmt.setString(2, enquiry.getLastName());
         stmt.setString(3, enquiry.getEmail());
         stmt.setString(4, enquiry.getContactNo());
         stmt.setInt(5, enquiry.getCourse().getId());
         stmt.setString(6, enquiry.getMessage());
         stmt.setString(7, enquiry.getType());
        int result=stmt.executeUpdate();
        return result;
    }
    
}
