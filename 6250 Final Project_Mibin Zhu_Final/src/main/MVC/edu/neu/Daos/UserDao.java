package edu.neu.Daos;

import edu.neu.Modules.Users;
import edu.neu.Modules.Userinfo;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import org.hibernate.*;
import org.hibernate.cfg.*;
import javax.sql.DataSource;

public class UserDao
{
	public String addUser(Users users, DataSource dataSource)
	{
		Connection con = null;
		if(users.getPhone() == null)
		{
			users.setPhone("0");
		}
		
		try
		{
			con = dataSource.getConnection();
			Statement st = con.createStatement();
			String str = "INSERT INTO USERS"
					+ " VALUES(\'" + users.getUsername() + "\',\'"
					+ users.getPassword() + "\',true,\'"
					+ users.getFirstName() + "\',\'"
					+ users.getLastName() + "\',\'"
					+ users.getBirthDate() + "\',\'"
					+ users.getEmail() + "\',\'"
					+ users.getAddress() +"\',\'"
					+ users.getPhone()
					+"\'"+ ");";
			
			st.executeUpdate(str);
			str = "INSERT INTO AUTHORITIES (USERNAME, AUTHORITY)"
					+ " VALUES(\'" + users.getUsername() + "\',\'"
					+ users.getRole() + "\');";
			st.executeUpdate(str);
			st.close();
			con.close();
			System.out.println("successful");
			return "successful";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return "fail";
	}
}