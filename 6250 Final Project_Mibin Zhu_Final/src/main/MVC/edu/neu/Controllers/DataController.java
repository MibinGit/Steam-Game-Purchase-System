package edu.neu.Controllers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Views/*")
public class DataController
{
	@Resource(name = "dataSource")
	private DataSource dataSource;
	
	public String showres(ResultSet rs)
	{
		try
		{
			ResultSetMetaData rsmd = rs.getMetaData();
		    int columnsNumber = rsmd.getColumnCount();
		    String s = "";
		    while (rs.next())
		    {
		    	for(int i = 1; i <= columnsNumber; i++)
		        {
		    		if (i > 1) s = s + (",  ");
		            String columnValue = rs.getString(i);
		            s = s + (columnValue + " " + rsmd.getColumnName(i));
		        }
		        s = s + ("");
		    }
		    return s;
		}
		 
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return "";
	}
	
    @GetMapping("LogoutPage")
    private String logout(Model model, HttpServletRequest request, HttpServletResponse response)
    {  
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();  
        if (auth != null)
        {      
            new SecurityContextLogoutHandler().logout(request, response, auth);  
        }
        model.addAttribute("logout", "You are successfully logout.");
        return "LogoutPage";
    }
}