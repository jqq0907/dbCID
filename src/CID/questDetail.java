package CID;

import java.awt.print.Printable;
import java.io.IOException;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class questDetail
 */
@WebServlet("/questDetail")
public class questDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public questDetail() {
        super();
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String Disease=request.getParameter("Disease");
		String Gene=request.getParameter("Gene");
		String cDNA=request.getParameter("cDNA");
		
/*		Disease=Disease.replaceAll("'", "\\\\'");//我也不知道为什么要4个/
		Gene=Gene.replaceAll("'", "\\\\'");
		cDNA=cDNA.replaceAll("'", "\\\\'");*/
		
		
		if((Disease==""||Disease==null)&&(Gene==""||Gene==null)&&(cDNA==""||cDNA==null))
		{
			Writer writer=response.getWriter();
			writer.write("None");
			
		}
		
		String sqlData="";
		
		

		try {
			Connection connection=public_.get_connection("jdbc:mysql://localhost:3306/", "dbcancer", "root", "root");
			sqlData="select DISTINCT "
					+ "geneid.ID,"
					+ "Disease,"
					+ "DOID,"
					+ "Chromosome,"
					+ "Protein,"
					+ "Type,"
					+ "tbcid.Gene,"
					+ "cDNA,"
					+ "Effect,"
					+ "Drug,"
					+ "gDNA,"
					+ "MIN(Level) as 'HighestLevel' "
					+ "from tbcid,geneid "
					+ "where geneid.Gene=tbcid.Gene"
					+(Gene==""?"":(" and tbcid.Gene=?"))
					+(Disease==""?"":(" and Disease=?"))
					+(cDNA==""?"":(" and cDNA=?"));
			PreparedStatement preState = connection.prepareStatement(sqlData);
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
			
			for(int i=1;i<=paraL.size();i++)
			{
				preState.setString(i, (String) paraL.get(i-1));
			}
			ResultSet rSet=preState.executeQuery();
			List list=public_.resultSetToList(rSet);
			Map map=(HashMap)list.get(0);
			
			
			sqlData="select DISTINCT "
					+ "Evidence,"
					+ "Level,"
					+ "Rule,"
					+ "PMID "
					+ "from tbcid where id like '%'"
					+(Gene==""?"":(" and Gene=?"))
					+(Disease==""?"":(" and Disease=?"))
					+(cDNA==""?"":(" and cDNA=?"))+" order by Level,PMID DESC";
			
		
			preState = connection.prepareStatement(sqlData);
			for(int i=1;i<=paraL.size();i++)
			{
				preState.setString(i, (String) paraL.get(i-1));
			}
			rSet=preState.executeQuery();
			list=public_.resultSetToList(rSet);
			
			List elist=new ArrayList();
			for(Object o:list)
			{
				Map tMap=(HashMap)o;
				List tl=new ArrayList();
				tl.add(tMap.get("PMID"));
				tl.add(tMap.get("Rule"));
				tl.add(tMap.get("Level"));
				tl.add(tMap.get("Evidence"));
				elist.add(tl);
			}
	    	
			map.put("Evidence", elist);
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
