package com.test.models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class Item {
	


	public String getItems() {
		
		String itemRes = null;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select * from item";
		
		try {
			con = DBConnection.createConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			
			
			if(rs.first()) {
				itemRes = "<table border='1' cellspacing='1' cellpadding='1'>"+
							"<tr>"+
								"<td>ID</td>"+
								"<td>NAME</td>"+
								"<td>STATUS</td>"+
								"<td>CREATE AT</td>"+
								"<td>ACTION</td>"+
							"</tr>";
				
				while(rs.next()) {
					
					itemRes += "<tr>"+
									"<td>"+rs.getString(1)+"</td>"+
									"<td>"+rs.getString(2)+"</td>"+
									"<td>"+rs.getString(3)+"</td>"+
									"<td>"+rs.getString(4)+"</td>"+
									"<td><button class='btn btn-info btn-sm' onclick='openEditItem(\""+rs.getString(1)+"\")'>Edit</button> &nbsp; <button class='btn btn-danger btn-sm' onclick='openDeleteItem(\""+rs.getString(1)+"\")'>Delete</button></td>"+
							  "</tr>";
				}
				
				
				itemRes += "</table>";
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return itemRes;
	}
	
	public String saveItem() {
		return "";
	}
}
