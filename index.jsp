<h1>Hello World</h1>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
  String userid = request.getParameter("user"); 
  Class.forName("com.mysql.jdbc.Driver"); 
  java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/mysql","root","root"); 
  Statement st = con.createStatement(); 
  ResultSet rs = st.executeQuery("select user, password from mysql.user where user='" + userid + "'"); 
  if(rs.next()) 
  { 
     out.println("Welcome " + userid); 
     out.println("<br/>"); 
     out.println("Password hash: " + rs.getString(2)); 
  } else {
    out.println("User " + userid + " not found!");
  } 
%>
