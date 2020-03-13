package CID;

import java.awt.print.Printable;
import java.io.IOException;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Param;
import org.w3c.dom.ls.LSInput;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class questData
 */
@WebServlet("/questData")
public class questData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public questData() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		/*get some Param from jsp*/
		int pageName=(int) (request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page")));
		int limitName=(int)(request.getParameter("limit")==null?10:Integer.valueOf(request.getParameter("limit")));
		
		String Disease=request.getParameter("Disease");
		String Gene=request.getParameter("Gene");
		String cDNA=request.getParameter("cDNA");
		String Level=request.getParameter("Level");
		String Drug=request.getParameter("Drug");
		String userInput=request.getParameter("userInput");
		
	/*	Disease=Disease.replaceAll("'", "\\\\'");//我也不知道为什么要4个/
		Gene=Gene.replaceAll("'", "\\\\'");
		cDNA=cDNA.replaceAll("'", "\\\\'");
		Level=Level.replaceAll("'", "\\\\'");
		userInput=userInput.replaceAll("'", "\\\\'");*/
		
		
		/*Set sql string*/
		try {
			Connection connection=public_.get_connection("jdbc:mysql://localhost:3306/", "dbcancer", "root", "root");
			PreparedStatement preState;
			String sqlData="",sqlCount="";
			ResultSet rSetlength;
			ResultSet rSet;
			if(userInput==""||userInput==null){
				sqlData="select DISTINCT Gene,Disease,gDNA,cDNA,Protein,Drug,count(PMID) as PMIDNum from tbcid where id like '%'"
						+(Gene==""?"":(" and Gene=?"))
						+(Disease==""?"":(" and Disease=?"))
						+(cDNA==""?"":(" and cDNA=?"))
						+(Level==""?"":(" and Level=?"))
						+(Drug==""?"":(" and Drug=?"))
						+" group by Gene,Disease,cDNA ORDER BY Gene,Disease,cDNA";
				sqlCount="SELECT COUNT(*)  as lineCount FROM ("+sqlData+") as a";
				
				
				List paraL=new ArrayList();
				if(Gene!=""){
					paraL.add(Gene);
				}
				if(Disease!=""){
					paraL.add(Disease);
				}
				if(cDNA!=""){
					paraL.add(cDNA);
				}
				if(Level!=""){
					paraL.add(Level);
				}
				if(Drug!=""){
					paraL.add(Drug);
				}
				preState = connection.prepareStatement(sqlCount);
				for(int i=1;i<=paraL.size();i++)
				{
					preState.setString(i, (String) paraL.get(i-1));
				}
				rSetlength = preState.executeQuery();
				
				sqlData+=" limit ?,?";
				preState = connection.prepareStatement(sqlData);
				int i=1;
				for(;i<=paraL.size();i++)
				{
					preState.setString(i, (String) paraL.get(i-1));
				}
				preState.setInt(i, limitName*(pageName-1));
				preState.setInt(i+1, limitName);
				rSet = preState.executeQuery();
				
				
				
			}
			else{
				sqlData="select DISTINCT Gene,Disease,gDNA,Protein,cDNA,Drug,count(PMID) as PMIDNum from ("
						+"(select DISTINCT Gene,Disease,gDNA,cDNA,Protein,Drug,PMID from tbcid where Gene like ?)"
						+" union (select DISTINCT Gene,Disease,gDNA,cDNA,Protein,Drug,PMID from tbcid where Disease like ?)"
						+" union (select DISTINCT Gene,Disease,gDNA,cDNA,Protein,Drug,PMID from tbcid where cDNA like ?)"
						+" union (select DISTINCT Gene,Disease,gDNA,cDNA,Protein,Drug,PMID from tbcid where gDNA like ?)"
						+" union (select DISTINCT Gene,Disease,gDNA,cDNA,Protein,Drug,PMID from tbcid where Protein like ?)) as aa "
						+" group by Gene,Disease,gDNA,cDNA,Protein ORDER BY Gene,Disease,cDNA";
				sqlCount="SELECT COUNT(*)  as lineCount FROM ("+sqlData+") as a";
				
				preState = connection.prepareStatement(sqlCount);
				preState.setString(1, userInput);
				preState.setString(2, userInput);
				preState.setString(3, userInput);
				preState.setString(4, userInput);
				preState.setString(5, userInput);
				rSetlength = preState.executeQuery();
				
				
				sqlData+=" limit ?,?";
				preState = connection.prepareStatement(sqlData);
				userInput="%"+userInput+"%";
				preState.setString(1, userInput);
				preState.setString(2, userInput);
				preState.setString(3, userInput);
				preState.setString(4, userInput);
				preState.setString(5, userInput);
				preState.setInt(6, limitName*(pageName-1));
				preState.setInt(7, limitName);
				rSet = preState.executeQuery();
				
				
				
			}
			
			
			/*get result length*/
			List listL=public_.resultSetToList(rSetlength);
			int listLength=Integer.valueOf(((HashMap)listL.get(0)).get("lineCount").toString());
			//System.out.println(listLength);
			/*Set which lines to get*/
			
			//
			List list=public_.resultSetToList(rSet);
			
			/*try to send Result data to jsp*/
			Map map=new HashMap();
			map.put("code", 0);
			map.put("msg", "");
			map.put("count", listLength);
			map.put("data", list);
			for (Object l:list
				 ) {
				System.out.println(l.toString());
			}
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
