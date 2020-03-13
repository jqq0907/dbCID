<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		<div class="layui-container" style="min-width:1140px">
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
				<div class="layui-col-xs10 layui-col-sm10 layui-col-md10 layui-col-lg10 layui-col-xs-offset1 layui-col-sm-offset1 layui-col-md-offset1 layui-col-lg-offset1" style="margin-bottom:20px;margin-top:20px;">

					<fieldset class="layui-elem-field layui-field-title">
						<legend>Properties</legend>
					</fieldset>
					<table id="Details" class="layui-table">
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr class="Disease">
								<td>Disease</td>
								<td class="Disease"></td>
							</tr>
							<tr class="DOID">
								<td>DOID</td>
								<td class="DOID"></td>
							</tr>
							<tr class="Chromosome">
								<td>Chromosome</td>
								<td class="Chromosome"></td>
							</tr>
							<tr class="Gene">
								<td>Gene</td>
								<td class="Gene"></td>
							</tr>
							<tr class="gDNA">
								<td>gDNA</td>
								<td class="gDNA"></td>
							</tr>
							<tr class="cDNA">
								<td>cDNA</td>
								<td class="cDNA"></td>
							</tr>
							<tr class="Protein">
								<td>Protein</td>
								<td class="Protein"></td>
							</tr>
							<tr class="Type">
								<td>Type</td>
								<td class="Type"></td>
							</tr>
							<tr class="Effect">
								<td>Effect</td>
								<td class="Effect"></td>
							</tr>
							<tr class="Drug">
								<td>Drug</td>
								<td class="Drug"></td>
							</tr>
							<tr class="HighestLevel">
								<td>Highest level of evidence(s)</td>
								<td class="HighestLevel"></td>
							</tr>
							<tr>
								<td>Evidence(s)</td>
								<td style="padding:0;margin:0;">
									<table class="layui-table" style="margin:-1px 0">
										<colgroup>
									<col width="50" />
											<col width="30" />
											<col width="30" />
											<col />
										</colgroup>
										<thead>
											<tr>
												<td>PMID</td>
												<td>Rule</td>
												<td>Level</td>
												<td>Evidence</td>
											</tr>
										</thead>
										<tbody class="Evidence">
											
										</tbody>
									</table>
									
								</td>
							</tr>

						</tbody>

					</table>
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" style="overflow-x:auto;text-align:center">
					<%
						String str=request.getParameter("Gene")+"_"+request.getParameter("Protein")+".svg";
						str=str.replaceAll("\\*", "_");
					%>
					<a target="_blank" href="img/indel/<%=str%>"><img src="img/indel/<%=str%>" type="image/svg+xml" onerror="javascript:this.style.display='none'" /></a>

				</div>
				</div>
				
			</div>

			<div class="layui-row" id="footer">
				<%--<div class="link">
					Links:
					<a class="ow" href="http://bioinfo.ahu.edu.cn:8080/dbCPG/index.jsp" target="_blank">dbCPG</a>
					<div style="display:inline;">|</div>
					<a class="ow" href="http://bioinfo.ahu.edu.cn:8080/dbDSM/index.jsp" target="_blank">dbDSM</a>
					<!-- <div style="display:inline;">|</div>
				<a class="ow" href="http://bioinfo.ahu.edu.cn:8080/Melanoma/index.jsp" target="_blank">Melanoma</a> -->
				</div>--%>
				<div class="copyright">
					Copyright©
					<a class="ow" href="https://www.ahau.edu.cn/" target="_blank">AnHui Argricultural University</a> ©All Rights Reserved.
				</div>
				<div class="use">
					<!-- Website content is for educational and research purposes only and is not intended to be used for medical advice, diagnosis or treatment. -->
				</div>
			</div>
		</div>

		<script src="layui/layui.all.js"></script>
		<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
		<script>
			window.onload = function() {
			
				$.ajax({
					type: "get",
					url: "questDetail",
					data: "Disease="+<%="\""+(request.getParameter("Disease"))+"\""%>+"&"+"Gene="+<%="\""+(request.getParameter("Gene"))+"\""%>+"&"+ "cDNA="+<%="\""+(request.getParameter("cDNA"))+"\""%> ,
					success: function(msg) {
						json_ = jQuery.parseJSON(msg);
						data=json_;
						console.log(json_);
						keys=['Disease','DOID','Chromosome','Gene','gDNA','cDNA','Protein','Type','Effect','Drug','HighestLevel','Evidence']
						for(keyid in keys)
						{
							if(keys[keyid]=="Drug"&&json_[keys[keyid]]==null)
							{
								$("."+keys[keyid])[0].setAttribute("class","layui-hide");
								continue;
							}
							
							if(keys[keyid]=="Gene")
							{
								var href="https://www.ncbi.nlm.nih.gov/gene/"+json_["ID"];
								$("."+keys[keyid])[1].innerHTML+="<a target='_blank'  href='"+href+"' style='cursor:pointer;color:#009688;'>"+json_[keys[keyid]]+"</a>";
								continue;
							}
							if(keys[keyid]=="Disease")
							{
								var href="http://www.disease-ontology.org/";
								$("."+keys[keyid])[1].innerHTML+="<a target='_blank'  href='"+href+"' style='cursor:pointer;color:#009688;'>"+json_[keys[keyid]]+"</a>";
								continue;
							}
							if(keys[keyid]=="Evidence")
							{
								list=json_[keys[keyid]];
								//console.log(list);
								for(tlist in list)
								{
									console.log(tlist);
									href="https://www.ncbi.nlm.nih.gov/pubmed/?term="+list[tlist][0];
									sentence=list[tlist][3].replace(/\|/g, "<br>")//正则替换所有|
									if(tlist==0)
										$("."+keys[keyid])[0].innerHTML+="<tr>"
																			 +"<td><a target='_blank' href="+href+" style='cursor:pointer;color:#009688;'>"+list[tlist][0]+"</td>"
																			 +"<td>"+list[tlist][1]+"</td>"
																			 +"<td>"+list[tlist][2]+"</td>"
																			 +"<td>"+sentence+"</td>"
																		 +"</tr>";
									else
										$("."+keys[keyid])[0].innerHTML+="<tr class='layui-hide'>"
											 +"<td><a target='_blank' href="+href+" style='cursor:pointer;color:#009688;'>"+list[tlist][0]+"</td>"
											 +"<td>"+list[tlist][1]+"</td>"
											 +"<td>"+list[tlist][2]+"</td>"
											 +"<td>"+sentence+"</td>"
										 +"</tr>";
								}
								if(list.length>1)
									$("."+keys[keyid])[0].innerHTML+="<tr><td colspan='4'><p onclick='seeMore(this)'><a style='margin:2px;cursor:pointer;text-decoration:underline'>Click to see all "+(list.length)+"</a></p></td></tr>";
								continue;
							}
							$("."+keys[keyid])[1].innerHTML+=json_[keys[keyid]];
						}
					}
				});
			};
			s="";
			function seeMore(this_){
				
				t=this_.parentNode.parentNode;
				s=t;
				while(t)
				{
					t=t.previousSibling;
					$(t).removeClass("layui-hide");
				}
				$(s).addClass("layui-hide");
			}
		
		</script>
	</body>

</html>