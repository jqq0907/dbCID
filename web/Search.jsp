<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>dbCID</title>
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" href="css/home.css" />
	</head>

	<body>

		<div class="layui-container" style="min-width:1140px;">
			<div class="layui-row" id="header">
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" id="banner"></div>

				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" id="bar">
					<ul class="layui-nav" lay-filter="" id="navbar">
						<li class="layui-nav-item">
							<a href="index.jsp">Home</a>
						</li>
						<li class="layui-nav-item">
							<a href="About.jsp">About</a>
						</li>
						<li class="layui-nav-item">
							<a href="Download.jsp">Download</a>
						</li>
						<li class="layui-nav-item">
							<a href="Submit.jsp">Submit</a>
						</li>
						<li class="layui-nav-item">
							<a href="Contact.jsp">Contact</a>
						</li>
					</ul>

				</div>

			</div>

			<div class="layui-row" id="bodyer">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" style="margin:20px 0">
					<blockquote class="layui-elem-quote">
						<i class="layui-icon">&#xe602;</i> 
						<%=(request.getParameter("Disease")==null||request.getParameter("Disease")==""?"":("<i><b>Disease</b></i>:&nbsp;"+request.getParameter("Disease")+";&nbsp;"))%>
						<%=(request.getParameter("Gene")==null||request.getParameter("Gene")==""?"":("<i><b>Gene</b></i>:&nbsp;"+request.getParameter("Gene")+";&nbsp;"))%>
						<%=(request.getParameter("cDNA")==null||request.getParameter("cDNA")==""?"":("<i><b>Indel</b></i>:&nbsp;"+request.getParameter("cDNA")+";&nbsp;"))%>
						<%=(request.getParameter("Level")==null||request.getParameter("Level")==""?"":("<i><b>Level</b></i>:&nbsp;"+request.getParameter("Level")+";&nbsp;"))%>
						<%=(request.getParameter("Drug")==null||request.getParameter("Drug")==""?"":("<i><b>Drug</b></i>:&nbsp;"+request.getParameter("Drug")+";&nbsp;"))%>
						<%=(request.getParameter("userInput")==null||request.getParameter("userInput")==""?"":("<i><b>User input</b></i>:&nbsp;'"+request.getParameter("userInput")+"';&nbsp;"))%>
					</blockquote>
				</div>
				<fieldset class="layui-elem-field layui-field-title" style="margin-bottom:5px;margin-top:20px;">
					<legend>Search Result</legend>
				</fieldset>
				<table id="DataFrame"  class="layui-hide" ></table>
				
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" style="overflow-x:auto;text-align:center">
					<%
						String Gene=request.getParameter("Gene")==null?"":request.getParameter("Gene");
						String Disease=request.getParameter("Disease")==null?"":request.getParameter("Disease");
						if(Gene==""&&Disease!="")
						{
							
							/*  File file = new File();
							 if(file.exists())
							 { */
							 try{
								 String s=getServletContext().getRealPath("img/disease/"+Disease+".svg");
								 File file=new File(s);
								 if(file.exists())
								 {
								 %>
									<a target="_blank" href="img/disease/${param.Disease}.svg"><img src="img/disease/${param.Disease}.svg"  type="image/svg+xml"/></a>
									<div style="width:300px;height:35px;margin: 10px auto;">
											<div style="height:50%;widht:100%;float:left">
												<div style="width:15px;height:10px;background-color:blue;float:left;margin: 2px 0 2px 0;"></div>
												<span style="float:left;font-size:0.8em">&nbsp;Reference(s) with disease</span>
											</div>
											<div style="height:50%;widht:100%;float:right">
												<div style="width:15px;height:10px;background-color:red;float:left;margin: 2px 0 2px 0;"></div>
												<span style="float:left;font-size:0.8em">&nbsp;All reference(s)</span>
											</div>
									</div>
									
									<%}
							 }catch(Exception e){
								 
							 }
						}
						else if(Disease==""&&Gene!="")
						{
							%>
							<a target="_blank" href="img/gene/${param.Gene}.svg"><img src="img/gene/${param.Gene}.svg"  type="image/svg+xml" onerror="javascript:this.style.display='none'"/></a>
							<%
						}	
					%>
				</div>
			</div>
			
			
		</div>
		<div class="layui-row" id="footer">
				<%--<div class="link">
					Links:
					<a class="ow" href="http://bioinfo.ahu.edu.cn:8080/dbCPG/index.jsp" target="_blank">dbCPG</a>
					<div style="display:inline;">|</div>
					<a class="ow" href="http://bioinfo.ahu.edu.cn:8080/dbDSM/index.jsp" target="_blank">dbDSM</a>
				</div>--%>
				<div class="copyright">
					Copyright©
					<a class="ow" href="https://www.ahau.edu.cn/" target="_blank">AnHui Argricultural University</a> ©All Rights Reserved.
				</div>
			</div>
		<script src="layui/layui.all.js"></script>
		<script type="text/javascript" id="GeneLink">
				<a href="Search.jsp?Disease=&Gene={{d.Gene}}&cDNA=&Level=" style="color:#009688;" title="{{d.Gene}}">{{d.Gene}}</a>
		</script>

		<script type="text/javascript" id="GeneLink1">
				<a target="blank" href="https://www.ncbi.nlm.nih.gov/gene/{{d.ID}}" style="color:#006699;" title="{{d.Gene}}">{{d.Gene}}</a>
		</script>

		<script type="text/javascript" id="DiseaseLink">
				<a href="Search.jsp?Disease={{d.Disease}}&Gene=&cDNA=&Level=" style="color:#009688;" title="{{d.Disease}}">{{d.Disease}} ({{"DOID: "+d.DOID}})</a>
		</script>

		<script type="text/javascript" id="DiseaseLink1">
				<a target="blank" href="http://www.disease-ontology.org/?id=DOID:{{d.DOID}}" style="color:#006699;" title="{{d.Disease}}">{{d.Disease}} ({{"DOID: "+d.DOID}})</a>
		</script>

		<script type="text/javascript" id="cDNALink">
				<a href="Details.jsp?Disease={{d.Disease}}&Gene={{d.Gene}}&cDNA={{d.cDNA}}&Protein={{d.Protein}}" style="color:#009688;" title="{{d.cDNA}}">{{d.cDNA}}</a>
		</script>
		<script type="text/javascript" id="displayProtein">
		<a href="Details.jsp?Disease={{d.Disease}}&Gene={{d.Gene}}&cDNA={{d.cDNA}}&Protein={{d.Protein}}" style="color:#009688;" title="{{d.Protein}}">{{d.Protein}}</a>
		</script>
		<script type="text/javascript" id="displaygDNA">
		<a href="Details.jsp?Disease={{d.Disease}}&Gene={{d.Gene}}&cDNA={{d.cDNA}}&Protein={{d.Protein}}" style="color:#009688;" title="{{d.gDNA}}">{{d.gDNA}}</a>
		</script>
		<script type="text/javascript" id="displayDrug">
			<a href="Details.jsp?Disease={{d.Disease}}&Gene={{d.Gene}}&cDNA={{d.cDNA}}&Protein={{d.Protein}}" style="color:#009688;" title="{{d.Drug}}">{{d.Drug}}</a>
		</script>
		<script>
			table=layui.table;
			table.render({
				elem: '#DataFrame',
				url: 'questData',
				page: {
					layout:['prev', 'page', 'next','skip','limit','count'],
					limit:10,
					limits:[10,20,30,50,100],
					hash:'page',
					curr: location.hash.replace('#!page=', ''),},
				request: {pageName: 'page'
					  ,limitName:'limit',},
				where:{Gene:"<%=(request.getParameter("Gene")==null||request.getParameter("Gene")=="")?"":request.getParameter("Gene") %>",
					Disease:"<%=(request.getParameter("Disease")==null||request.getParameter("Disease")=="")?"":request.getParameter("Disease") %>",
					cDNA:"<%=(request.getParameter("cDNA")==null||request.getParameter("cDNA")=="")?"":request.getParameter("cDNA") %>",
					Level:"<%=(request.getParameter("Level")==null||request.getParameter("Level")=="")?"":request.getParameter("Level") %>",
					Drug:"<%=(request.getParameter("Drug")==null||request.getParameter("Drug")=="")?"":request.getParameter("Drug") %>",
					userInput:"<%=(request.getParameter("userInput")==null||request.getParameter("userInput")=="")?"":request.getParameter("userInput") %>",
				},
				cols: [
					[ //表头
						{
							field: 'Gene',
							title: 'Gene',
							sort: true,
							width:120,
							templet:"<%=(request.getParameter("Gene")==null||request.getParameter("Gene")=="")?"#GeneLink":"#GeneLink1"%>",
						}, {
							field: 'Disease',
							title: 'Disease',
							sort:true,
							templet:"<%=(request.getParameter("Disease")==null||request.getParameter("Disease")=="")?"#DiseaseLink":"#DiseaseLink1"%>",
						},{
							field: 'Drug',
							title: 'Drug',
							sort:true,
							templet:'#displayDrug',
						},{
							field: 'gDNA',
							title: 'gDNA',
							sort:true,
							templet:'#displaygDNA',
						}
						, {
							field: 'cDNA',
							title: 'cDNA',
							sort:true,
							templet:'#cDNALink',
						}, {
							field: 'Protein',
							title: 'Protein',
							sort:true,
							templet:"#displayProtein",
						}
						  , /* {
							field: 'PMIDNum',
							title: 'PMIDNum',
							sort:true,
							//templet:"#displayProtein",
						}   */
					]
				],
				/* 
				done: function(res, curr, count){
				    //如果是异步请求数据方式，res即为你接口返回的信息。
				    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
				    console.log(res);
				    
				    //得到当前页码
				    console.log(curr); 
				    
				    //得到数据总量
				    console.log(count);
				  } */
			});
		</script>
	</body>

</html>
