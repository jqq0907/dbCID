package CID;

import java.io.IOException;
import java.io.Writer;
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
 * Servlet implementation class download
 */
@WebServlet("/download")
public class download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ip="";
		if (request.getHeader("x-forwarded-for") == null) 
		{
			ip=request.getRemoteAddr();
		} 
		else
		{
			ip=request.getHeader("x-forwarded-for");
		}
		String fileName=request.getParameter("fileName");
		String sqlData="insert into "
				+ "tbdownload(ip,fileName) "
				+ "values("
				+ "\""+ip+"\","
				+ (fileName==null?"NULL":("\""+fileName+"\""))
				+ ")";
		
		Connection connection=public_.get_connection("jdbc:mysql://localhost:3306/", "dbcancer", "root", "root");
		Statement statement=public_.get_statement(connection);
		
		try {
			statement.executeUpdate(sqlData);
			
			if(fileName!=null)
			{
				fileName=new String(fileName.getBytes("ISO-8859-1"),"utf-8");
				response.setContentType("application/x-download");
				String filedownload = "download/" +fileName;
				String filedisplay = fileName;
				String filenamedisplay = java.net.URLEncoder.encode(filedisplay,"UTF-8");
				response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);
				try
				  {
					  RequestDispatcher dis = request.getRequestDispatcher(filedownload);
					  if(dis!= null)
					  {
						  dis.forward(request,response);
					  }
					  response.flushBuffer();
				  }
				  catch(Exception e)
				  {
					 Writer writer=response.getWriter();
					 writer.write(e.getMessage());
					  e.printStackTrace();
				  }
				  finally
				  {

				  }
				
			}	
		} catch (SQLException e) {
			Writer writer=response.getWriter();
			 writer.write(e.getMessage());
			e.printStackTrace();
		}
		public_.closeConn(connection, statement);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
