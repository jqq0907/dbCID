<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>dbCID</title>
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" href="css/global.css" />
		<link rel="stylesheet" href="css/home.css" />

<style>

hr{
    margin-top: 20px;
    margin-bottom:  20px;
}
blockquote{
	font-size:1.3em;
}
</style>
	</head>

	<body>
		<div class="layui-container" style="min-width: 1140px;">
			<div class="layui-row" id="header">
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" id="banner"></div>

				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" id="bar">
					<ul class="layui-nav" lay-filter="" id="navbar">
						<li class="layui-nav-item">
							<a href="index.jsp">Home</a>
						</li>
						<li class="layui-nav-item layui-this">
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

				<div class="layui-main site-inline" id="site-tree">
					<div class="site-tree">
						<fieldset class="layui-elem-field layui-field-title" style="margin-bottom:5px;margin-top:20px;">
							<legend><i>Catalog</i></legend>
						</fieldset>
						<ul class="layui-tree">
							<li>
								<h2 onclick="javascript:location.href='#About-dbCID';">About dbCID</h2>
							</li>
							<li>
								<h2 onclick="javascript:location.href='#Web-Browser-Requirements';">Web Browser Requirements</h2>
							</li>
							<li>
								<h2 onclick="javascript:location.href='#Evidence-System';">Evidence System</h2>
							</li>

							<li>
								<h2 onclick="javascript:location.href='#Usage';">Usage</h2>
							</li>
							<li class="site-tree-noicon">
								<a href="#Browse">
									<cite>1. Browse</cite>
									<em></em>
								</a>
							</li>
							<li class="site-tree-noicon">
								<a href="#Search">
									<cite>2. Search</cite>
									<em></em>
								</a>
							</li>
							<li class="site-tree-noicon">
								<a href="#Download">
									<cite>3. Download</cite>
									<em></em>
								</a>
							</li>
							<li class="site-tree-noicon">
								<a href="#Contact">
									<cite>4. Contact</cite>
									<em></em>
								</a>
							</li>
							<li>
								<h2 onclick="javascript:location.href='#Database-Summary';">Database Summary</h2>
							</li>
							<li>
								<h2 onclick="javascript:location.href='#Version';">Version</h2>
							</li>
						</ul>
					</div>
					<div class="site-content">

						<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:5px;margin-top:20px;" id="About-dbCID">
							<legend>About dbCID</legend>
						</fieldset> -->
						<blockquote class="layui-elem-quote"  id="About-dbCID">
							About dbCID
						</blockquote>
						<div class="layui-text" style="margin-bottom:7px">
							While recent advances in next generation sequencing technologies have enabled the creation of a multitude of databases in cancer genomic, there is no comprehensive database focusing on the annotation of driver indel yet. Therefore, we created the dbCID which is a collection of known indels that likely to be engaged in cancer development, progression or therapy. It currently contains experimentally supported and putative driver indels derived from manual curation of literature. For each indel, we have curated the position information (genomic, coding DNA, and protein levels), specific diseases, drug sensitivity information (partial) as well as evidence sentences. Evidence information is classified using the levels and rules of Evidence System. The database can be used to improve the training of prediction algorithms and evaluate the methods for predicting the effects of variations.
						</div>
						<div class="layui-text" style="margin-bottom:7px">
							To obtain genomic positions, we used TransVar (<a href="http://bioinformatics.mdanderson.org/transvarweb/" target="_blank">http://bioinformatics.mdanderson.org/transvarweb/</a>) through entering genes and their associated cDNA changes and mapped them to the results of the longest possible transcripts. Genomic positions that failed to match the canonical cDNA at the specified site were substituted by a dot (.). To acquire standard disease terminology, 
							we mapped the related disease onto DOIDs (Disease Ontology IDs, <a href="http://www.disease-ontology.org/" target="_blank">http://www.disease-ontology.org/</a>).
						</div>
						<div class="layui-text" style="margin-bottom:7px">
							Please cite the paper, if you are using the information in the database:
						</div>
						<div class="layui-text" style="margin-bottom:7px">
							Yue Z, Zhao L, Cheng N, et al. <b>dbCID: a manually curated resource for exploring the driver indels in human cancer.</b> Briefings in bioinformatics, 2018. doi:10.1093/bib/bby059.
						</div>
						<div class="layui-text" style="margin-bottom:7px;text-indent: 1em;">
							Datasets used in this article: 
							<p style="text-indent: 2em;">Download the <a href="download/Training dataset.xlsx" style="color:#009688;">training dataset</a> for developing the prediction algorithm.</p>
							<p style="text-indent: 2em;">Download the <a href="download/Datasets used in Figure 3.xlsx"  style="color:#009688;">datasets</a> used in Figure 3.</p>
						</div>

						<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:5px;margin-top:20px;" id="Web-Browser-Requirements">
							<legend>Web Browser Requirements</legend>
						</fieldset> -->
						<hr class="layui-bg-green">
						<blockquote class="layui-elem-quote" id="Web-Browser-Requirements">
							Web Browser Requirements
						</blockquote>
						<div class="layui-text">
							The dbCID requires a modern web browser with JavaScript and cookies enabled. To view the complex details, pop-ups must not be blocked. The following browsers have been thoroughly tested with dbCID:
							<ul>
								<li>Mozilla Firefox, version 4 or above</li>
								<li>Internet Explorer, versions 9 or above</li>
								<li>Chrome, version 5 or above</li>
							</ul>
							The latest version of Firefox and Chrome is recommended for visualization.
						</div>

						<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:5px;margin-top:20px;" id="Evidence-System">
							<legend>Evidence System</legend>
						</fieldset> -->
						<hr class="layui-bg-green">
						<blockquote class="layui-elem-quote" id="Evidence-System">
							Evidence System
						</blockquote>
						<div class="layui-text">
							<b>Rules for indel Entry into dbCID.</b>
							<table class="layui-table" lay-skin="nob" style="margin-top:0;">
								<colgroup>
									<col width="150">
									<col>
								</colgroup>
								<thead>
									<tr style="border-top:1px solid;border-bottom:1px solid;">
										<th>Rule No.</th>
										<th>Details</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Rule 1</td>
										<td>Induced development, recurrence or metastasis of cancer.</td>
									</tr>
									<tr>
										<td>Rule 2</td>
										<td>Associated with increased sensitivity or resistance to a drug.</td>
									</tr>
									<tr>
										<td>Rule 3</td>
										<td>Induced change of function of gene product significantly.</td>
									</tr>
									<tr>
										<td>Rule 4</td>
										<td>Had a higher recurrence frequency in cancer patients compared to the case of healthy controls.</td>
									</tr>
									<tr style="border-bottom:1px solid;">
										<td>Rule 5</td>
										<td>Located in an important region in gene or protein, such as a binding or catalytic site.</td>
									</tr>

								</tbody>
							</table>
						</div>
						<br>
						<div class="layui-text">
							<b>Levels of evidence for indels in dbCID.</b>
							<table class="layui-table" lay-skin="nob" style="margin-top:0;">
								<colgroup>
									<col width="150">
									<col>
								</colgroup>
								<thead>
									<tr style="border-top:1px solid;border-bottom:1px solid;">
										<th>Level No.</th>
										<th>Details</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Level 1<br>(<i>in vivo</i>)</td>
										<td> Indel is regarded as a driver based on evidence from functional experiments <i>in vivo</i>.</td>
									</tr>
									<tr>
										<td>Level 2<br>(<i>In vitro</i>)</td>
										<td> Indel is regarded as a driver based on evidence from functional experiments <i>In vitro</i>.</td>
									</tr>
									<tr style="border-bottom:1px solid;">
										<td>Level 3<br>(Putative)</td>
										<td> Indel is a putative driver based on evidence such as a high recurrence frequency in cancer patients, an important location of protein and so on.</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:5px;margin-top:20px;" id="Usage">
							<legend>Usage</legend>
						</fieldset> -->
						<hr class="layui-bg-green">
						<blockquote class="layui-elem-quote" id="Usage">
							Usage
						</blockquote>
						<div class="layui-text">
							In dbCID, we tried to make it powerful and convenient to be used. This Usage is prepared for the online service. The dbCID provides the browse function, search function and download function at present.
						</div>
						<div class="layui-text">
							Capitalised titles correspond to column headings in the web page tables:
						</div>
						<div class="layui-text">
							<ul>
								<li>GENE: The official gene symbol</li>
								<li>DISEASE: disease terminology in Disease Ontology</li>
								<li>DOID: Disease Ontology identifier</li>
								<li>Type: deletion, insertion, duplication or complex (insertion occurs simultaneously with deletion)</li>
								<li>Effect: frameshift or inframe</li>
								<li>Drug: sensitive or resistant to a certain drug</li>
								<li>HIGHEST LEVEL: The highest evidence level of indels across specified both disease and gene</li>
							</ul>
						</div>
						<br/>
						<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12">
						<div class="layui-text" id="Browse">
							<h3>1. Browse</h3> 
							You can select one or more of the four options listed in the browse area (Diease, Gene, Indel and Evidence). The Indel option only can be available after a gene is selected.
						</div>
						<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12 imgtext">
							<div style="/* float:left;  */clear: both;" align="center">
								<img src="img/browse.png" width="800px" alt="" hspace="8"><br />
							</div>
						</div>
						<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12 imgtext">
							<div style="/* float:left;  */clear: both;" align="center">
								<img src="img/browse_ATM.png" width="800px" alt="" hspace="8"><br />
							</div>
						</div>
						</div>
						
						<br/>
						<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12">
						<div class="layui-text" id="Search">
							<h3>2. Search</h3> 
							You can input one keyword to search the dbCID. The search fields include disease name, gene name or indel (gDNA, cDNA or protein sequences). Only the GRCh38 genome assembly is supported.
						</div>
						<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12 imgtext">
							<div style="/* float:left;  */clear: both;" align="center">
								<img src="img/search.png" width="800px" alt="" hspace="8"><br />
							</div>
						</div>
						</div>
						<br/>
						<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12">
						<div class="layui-text" id="Download">
							<h3>3. Download</h3> 
							We provide the option to download the full database. If you'd like to download it, please click to download the data for each level.
						</div>
						<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12 imgtext">
							<div style="/* float:left;  */clear: both;" align="center">
								<img src="img/download.png" width="800px" alt="" hspace="8"><br />
							</div>
						</div>
						</div>
						<br/>
						<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12">
						<div class="layui-text" id="Contact">
							<h3>4. Contact</h3> 
							I have a few questions which are not listed above, how can I contact the authors of dbCID?<br/>
							Please contact Dr. Junfeng Xia (Email: jfxia@ahu.edu.cn) for details.
						</div>
						</div>
						
						<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:5px;margin-top:20px;" id="Database-Summary">
							<legend>Database Summary (current version)</legend>
						</fieldset> -->
						<hr class="layui-bg-green">
						<blockquote class="layui-elem-quote" id="Database-Summary">
							Database Summary (current version)
						</blockquote>
						<div class="layui-text">
							(A) Database statistics
							<table class="layui-table" lay-skin="nob" style="margin-top:0;">
								
								<thead>
									<tr style="border-top:1px solid;border-bottom:1px solid;">
										<td>Gene</td>
										<td>Indel</td>
										<td>Disease</td>
										<td>PMID</td>
										<td>Entry</td>
										<td>Level 1<br>(<i>in vivo</i>)</td>
										<td>Level 2<br>(<i>In vitro</i>)</td>
										<td>Level 3<br>(putative)</td>
									</tr>
								</thead>
								<tbody>
									<tr  style="border-bottom:1px solid;">
										<td>67</td>
										<td>895</td>
										<td>57</td>
										<td>270</td>
										<td>1569</td>
										<td>68</td>
										<td>196</td>
										<td>1305</td>
									</tr>
								</tbody>
							</table>
							
							(B) Type distribution of unique indels
							<table class="layui-table" lay-skin="nob" style="margin-top:0;margin-bottom:0px;">
								
								<thead>
									<tr style="border-top:1px solid;border-bottom:1px solid;">
										<td></td>
										<td>Deletion</td>
										<td>Insertion</td>
										<td>Duplication</td>
										<td>Complex</td>
										<td>Total</td>
									</tr>
								</thead>
								<tbody>
									<tr><td>FS</td><td>	517</td><td>92</td><td>102</td><td>27</td><td>738</td></tr>
									<tr><td>IF</td><td>88</td><td>28</td><td>10</td><td>31</td><td>157</td></tr>
									<tr style="border-bottom:1px solid;"><td>Total</td><td>605</td><td>120</td><td>112</td><td>58</td><td>895</td></tr>
								</tbody>
							</table>
							<div class="layui-text">
								FS: frameshift; IF: inframe; Complex: insertion occurs simultaneously with deletion
							</div>
						</div>
						
						
						<!-- <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:5px;margin-top:20px;" id="Version">
							<legend>Version</legend>
						</fieldset> -->
						<hr class="layui-bg-green">
						<blockquote class="layui-elem-quote" id="Version">
							Version
						</blockquote>
						<div class="layui-text">
							The current version number is 1.0 - January, 2018. The most recent update to data was on January 10th, 2018.
						</div>
					</div>
				</div>
			</div>
			</div>

		</div>

		<div class="layui-row" id="footer">
			<%--	<div class="link">
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
		<script src="js/jquery-1.9.1.min.js"></script>
		<script>
			var rollSet = $('#site-tree');
			var offset = rollSet.offset();
			var fwidth = $("#footer").height();
			console.log(fwidth);
			$(window).scroll(function() {
				var scrollTop = $(window).scrollTop();
				var scrollBtm = $(document).height() - $(window).scrollTop() - rollSet.height();

				if(offset.top < scrollTop) {
					//console.log(scrollTop+","+offset.top+","+scrollBtm+","+fwidth);
					if(scrollBtm > fwidth) {
						rollSet.addClass('site-fix');
					} else {
						//rollSet.removeClass('site-fix');
					}

				} else {
					rollSet.removeClass('site-fix');
				}
				if(document.getElementById("site-tree").getBoundingClientRect().top < 0) {
					rollSet.addClass('site-fix');
				} else {
					rollSet.removeClass('site-fix');
				}
			})
		</script>
	</body>

</html>
