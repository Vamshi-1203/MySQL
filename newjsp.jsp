<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "jakarta.servlet.ServletException"%>
<%@page import = "jakarta.servlet.http.HttpServlet"%>
<%@page import = "jakarta.servlet.http.HttpServletRequest"%>
<%@page import = "jakarta.servlet.http.HttpServletResponse"%>
<%@page import = "java.io.IOException"%>
<%@page import = "java.io.PrintWriter"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int Sno = Integer.parseInt(request.getParameter("Sno"));
            String name = request.getParameter("name");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/checking?autoReconnect=true&useSSL=false", "root", "Jayapriya0@");
                String sql = "select * from soapAndRest where Sno = ? and name = ?";
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, Sno);
                pstmt.setString(2, name);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    out.println("<html><body><h2>Data inserted successfully!</h2>" + rs.getString("name") +"</body></html>");
                } else {
                    out.println("<html><body><h2>Failed to insert data.</h2></body></html>");
                }
            } catch (SQLException e) {
                out.println("<html><body><h2>Database error: " + e.getMessage() + "</h2></body></html>");
                e.printStackTrace();
            } catch (NumberFormatException e) {
                out.println("<html><body><h2>Invalid Sno value.</h2></body></html>");
                e.printStackTrace();
            } catch (Exception e) {
                out.println("<html><body><h2>An error occurred: " + e.getMessage() + "</h2></body></html>");
                e.printStackTrace();
            }
        %>
    </body>
</html>
