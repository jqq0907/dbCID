package CID;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class submit
 */
@WebServlet("/submit")
public class submit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public submit() {
        super();
     }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Disease=request.getParameter("Disease");
		String Gene=request.getParameter("Gene");
		String Indel=request.getParameter("Indel");
		String Reference=request.getParameter("Reference");
		String Email=request.getParameter("Email");
		String More=request.getParameter("More");
		
		String sqlupdate="insert into "
				+ "tbsubmit(Email,Disease,Gene,Indel,Reference,More) "
				+ "values("
				+ (Email==null?"NULL":("\""+Email+"\""))
						+ ","
				+ (Disease==null?"NULL":("\""+Disease+"\""))
						+ ","
				+ (Gene==null?"NULL":("\""+Gene+"\""))
						+ ","
				+ (Indel==null?"NULL":("\""+Indel+"\""))
						+ ","
				+ (Reference==null?"NULL":("\""+Reference+"\""))
						+ ","
				+ (More==null?"NULL":("\""+More+"\""))
						+ ")";
		
		Connection connection=public_.get_connection("jdbc:mysql://localhost:3306/", "dbcancer", "root", "root");
		Statement statement=public_.get_statement(connection);
		
		try {
			statement.executeUpdate(sqlupdate);
			public_.closeConn(connection, statement);
			response.sendRedirect("Submit.jsp?success=1");
		} catch (SQLException e) {
			public_.closeConn(connection, statement);
			response.sendRedirect("Submit.jsp?success=2");
			e.printStackTrace();
		}
		
		

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
