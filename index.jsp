<h1>Hello World</h1>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String userid=request.getParameter("user"); 
session.putValue("userid",userid); 
String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/mysql","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from mysql.user where user='"+userid+"'"); 
  if(rs.next()) 
    { 
      if(rs.getString(2).equals(pwd)) 
      { 
        out.println("welcome"+userid); 
      } else { 
        out.println("Invalid password try again"); 
      } 
    } else {
      out.println("User "+userid+" not found!");
    } 
%>
