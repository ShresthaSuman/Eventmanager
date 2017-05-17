/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.enquirymanagement.DAO;

import com.leapfrog.enquirymanagement.entity.Enquiry;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Mr. Shrestha Suman
 */
public interface EnquiryDAO {
    List<Enquiry> getAll() throws SQLException, ClassNotFoundException;
    int insert(Enquiry enquiry) throws SQLException, ClassNotFoundException;
}
