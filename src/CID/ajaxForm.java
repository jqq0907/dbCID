package CID;

import java.io.IOException;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ajaxForm
 */
@WebServlet("/ajaxForm")
public class ajaxForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajaxForm() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Disease=request.getParameter("Disease");
		String Gene=request.getParameter("Gene");
		String cDNA=request.getParameter("cDNA");
		String Level=request.getParameter("Level");
		String Drug=request.getParameter("Drug");
/*		Disease=Disease.replaceAll("'", "\\\\'");//我也不知道为什么要4个/
		Gene=Gene.replaceAll("'", "\\\\'");
		cDNA=cDNA.replaceAll("'", "\\\\'");
		Level=Level.replaceAll("'", "\\\\'");*/
		
		
		String sqlData="select DISTINCT id"
				+ ((Gene==""||Gene==null)?",Gene":"")
				+ ((Disease==""||Disease==null)?",Disease":"")
				+ (((cDNA==""||cDNA==null)&&(Gene!=""&&Gene!=null))?",cDNA":"")
				+ ((Drug==""||Drug==null)?",Drug":"")
				+ ((Level==""||Level==null)?",Level":"")
				+ " from tbcid where id like '%'"
				+ ((Gene==""||Gene==null)?"":(" and Gene=?"))
				+ ((Disease==""||Disease==null)?"":(" and Disease=?"))
				+ ((cDNA==""||cDNA==null)?"":(" and cDNA=?"))
				+ ((Drug==""||Drug==null)?"":(" and Drug=?"))
				+ ((Level==""||Level==null)?"":(" and Level=?"));

		try {
			Connection connection=public_.get_connection("jdbc:mysql://localhost:3306/", "dbcancer", "root", "root");
			ResultSet rSet;
			
			PreparedStatement preState = connection.prepareStatement(sqlData);
			List paraL=new ArrayList();
			if(Gene!=""&&Gene!=null){
				paraL.add(Gene);
			}
			if(Disease!=""&&Disease!=null){
				paraL.add(Disease);
			}
			if(cDNA!=""&&cDNA!=null){
				paraL.add(cDNA);
			}
			if(Drug!=""&&Drug!=null){
				paraL.add(Drug);
			}
			if(Level!=""&&Level!=null){
				paraL.add(Level);
			}
			
			for(int i=1;i<=paraL.size();i++)
			{
				preState.setString(i, (String) paraL.get(i-1));
			}
			rSet = preState.executeQuery(); 
			
			List list=public_.resultSetToList(rSet);
			Map map=public_.ListSetToArray(list);
			connection.close();
			preState.close();
			Writer writer=response.getWriter();
			writer.write(JSONObject.fromObject(map).toString());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
