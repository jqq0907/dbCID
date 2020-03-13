package CID;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class public_ {
	protected static Connection get_connection(String url,String tbname,String user,String pwd) {
		try {
			//System.out.print("sdfsdfsdf\n");
			String driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName).newInstance();
			Connection connection = DriverManager.getConnection(url+tbname,user,pwd);
			return connection;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
    protected static Statement get_statement(Connection connection) {
		try {
			Statement statement=connection.createStatement();
			return statement;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			return null;
		}
		
	}
    protected static void closeConn(Connection conn,Statement state){
		try{
			conn.close();
			state.close();
		}catch(Exception e)
		{
			e.printStackTrace();
			}
	}
	
    protected static List resultSetToList(ResultSet rs) throws java.sql.SQLException {   
        if (rs == null)   
            return Collections.EMPTY_LIST;   
        ResultSetMetaData md = rs.getMetaData(); //得到结果集(rs)的结构信息，比如字段数、字段名等   
        int columnCount = md.getColumnCount(); //返回此 ResultSet 对象中的列数   
        List list = new ArrayList();   
        Map rowData = new HashMap();   
        while (rs.next()) {   
         rowData = new HashMap(columnCount);   
         for (int i = 1; i <= columnCount; i++) {   
                 rowData.put(md.getColumnName(i), rs.getObject(i));   
         }   
         list.add(rowData);   
         /*System.out.println("list:" + list.toString()); */  
        }  
        return list;  
	}
    

    
    
    
    
    protected static Map ListSetToArray(List list){   
        if (list == null)   
            return null;
        
        Set GeneL=new HashSet();
        Set DiseaseL=new HashSet();
        Set cDNAL=new HashSet();
        Set DrugL=new HashSet();
        Set LevelL=new HashSet();
        
        for(Object object:list)
        {
        	Map map=(HashMap)object;
        	if(map.containsKey("Gene"))
        	{
        		GeneL.add(map.get("Gene"));
        	}
        	if(map.containsKey("Disease"))
        	{
        		DiseaseL.add(map.get("Disease"));
        	}
        	if(map.containsKey("cDNA"))
        	{
        		cDNAL.add(map.get("cDNA"));
        	}
			if(map.containsKey("Drug"))
			{
				DrugL.add(map.get("Drug"));
			}
        	if(map.containsKey("Level"))
        	{
        		LevelL.add(map.get("Level"));
        	}
        }
        
        Map map=new HashMap();
        if(!GeneL.isEmpty())
        	map.put("Gene", GeneL);
        if(!DiseaseL.isEmpty())
        	map.put("Disease", DiseaseL);
        if(!cDNAL.isEmpty())
        	map.put("cDNA", cDNAL);
		if(!DrugL.isEmpty())
			map.put("Drug", DrugL);
        if(!LevelL.isEmpty())
        	map.put("Level", LevelL);

        return map;  
	}
}
