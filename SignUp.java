

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

    

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String email = request.getParameter("email");
        String picLink = request.getParameter("picLink");
        String age = request.getParameter("age");
        String major = request.getParameter("major");
        String hashedpw = request.getParameter("hashedpw");
        String gender = request.getParameter("gender");
        
        String yr = request.getParameter("yr");
        String standing = request.getParameter("standing");
        String idealDate = request.getParameter("idealDate");
        String lastLogin = request.getParameter("lastLogin");
        
            
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        PreparedStatement preparedStatement = null;
        
        System.out.println("In the user adding servlet ---------------------------------------->");
                    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/userdatabase?user=root&password=root&useSSL=false");
            
            String insertTableSQL = "SELECT * from userdata where email='" + email + "'";
            preparedStatement = conn.prepareStatement(insertTableSQL);  
            rs = preparedStatement.executeQuery();
            
            if (!rs.next()) {// If user doesnt exist in our database
                
            
                insertTableSQL = "INSERT INTO Users"
                        + "(fname, email, picLink, age, major, hashedpw,gender, yr, standing,idealDate, lastLogin) VALUES"
                        + "(?,?,?,?,?,?,?,?,?,?,?)";
                
                preparedStatement = conn.prepareStatement(insertTableSQL);  
                
                
                //Inserting Users's info
                preparedStatement.setString(1, fname);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, picLink);
                
                preparedStatement.setString(4, age);
                preparedStatement.setString(5, major);
                preparedStatement.setString(6, hashedpw);
                preparedStatement.setString(7, gender);
                preparedStatement.setString(8, yr);
                preparedStatement.setString(9, standing);
                preparedStatement.setString(10, idealDate);
                preparedStatement.setString(11, lastLogin);
                
                
                preparedStatement.executeUpdate();
            } else {
                System.out.println("User already exists in the database");
            }
                } catch (SQLException sqle) {
                        
                System.out.println (sqle.getMessage());
            } catch (ClassNotFoundException cnfe) {
                            
                System.out.println (cnfe.getMessage());
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (st != null) {
                        st.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException sqle) {
                   
                    System.out.println(sqle.getMessage());
                }
            }
            // --------------------------------------------------------------------->
        }
}
