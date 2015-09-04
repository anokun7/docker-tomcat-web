<body style="color: red; background-color: #000">
<h2>Hello World</h2>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
  String userid = request.getParameter("user"); 
  Class.forName("com.mysql.jdbc.Driver"); 
  java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/mysql","root","root"); 
  Statement st = con.createStatement(); 
  ResultSet rs = st.executeQuery("select user, password from mysql.user where user='" + userid + "'"); 
  try {
    if(rs.next()) 
    { 
       out.println("Welcome " + userid); 
       out.println("<br/> Password hash: " + rs.getString(2)); 
    } else {
      out.println("User " + userid + " not found!");
    } 
  } finally {
    con.close();
    rs.close();
    st.close();
  }
%>
</body>
