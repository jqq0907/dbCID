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
		<div class="layui-container" style="min-width:1140px;">
			<div class="layui-row" id="header">
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" id="banner"></div>

				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" id="bar">
					<ul class="layui-nav" lay-filter="" id="navbar">
						<li class="layui-nav-item layui-this">
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

				<div class="layui-col-xs8 layui-col-sm8 layui-col-md8 layui-col-lg8" id="panel-left">

					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" id="overview" style="margin-bottom:20px;margin-top:20px;">
						<fieldset class="layui-elem-field layui-field-title">
							<legend><i>Overview</i></legend>
						</fieldset>
						<div class="layui-text">
						The database of Cancer driver InDels (dbCID) is a highly curated database of driver indels (insertions and deletions) that are likely to engage in cancer development, progression, or therapy. dbCID currently contains 194 experimentally supported and 701 putative driver indels derived by manual curation of literature. The database is organized to provide informaton about cancer driver indels and interpretations in a consistent way, as well as allowing users to submit entries. It can be a valuable resource for cancer researchers and also a benchmark database for development and evaluation of methods for predicting the effects of cancer indels.	
						</div>
					</div>

					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12" id="overview">

						<fieldset class="layui-elem-field" style="">
							<legend>Browse</legend>
							<form id="select" class="layui-form" target="_top" action="Search.jsp" style="margin-right: 10%;">
								<div class="layui-form-item layui-hide">
									<div class="layui-input-block">
										<input id="hideU" type="text" required lay-verify="required" placeholder="Type a disease, gene or mutation here" autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">Disease</label>
									<div class="layui-input-block">
										<select id="Disease" name="Disease" lay-filter="Disease">
											<option value="">Select Disease</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">Gene</label>
									<div class="layui-input-block">
										<select id="Gene" name="Gene" lay-filter="Gene">
											<option value="">Select Gene</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item ">
									<label class="layui-form-label">cDNA</label>
									<div class="layui-input-block">
										<select id="cDNA" name="cDNA" lay-filter="cDNA">
											<option value="">Select Gene First</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">Drug</label>
									<div class="layui-input-block">
										<select id="Drug" name="Drug" lay-filter="Drug">
											<option value="">Select Drug </option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">Level</label>
									<div class="layui-input-block">
										<select id="Level" name="Level" lay-filter="Level">
											<option value="">Select Evidence Level</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="*">Submit</button>
										<button type="reset" class="layui-btn layui-btn-primary" lay-filter="reset" id="reset" onclick="formClick(this,selectId,'reset')">Reset</button>
									</div>
								</div>
							</form>
						</fieldset>
						<fieldset class="layui-elem-field" style="">
							<legend>Search</legend>
							<form id="input" class="layui-form" target="_top" action="Search.jsp" style="margin-right: 10%;">
								<div class="layui-form-item">
									<div class="layui-input-block">
										<input id="userInput" type="text" name="userInput" required lay-verify="required" placeholder="Type a disease, gene or indel here" autocomplete="off" class="layui-input">
										<div class="layui-text">
										<p style="margin:4px 0 4px 0">Example:
											<a onclick="exampleFun(this)" style="cursor:pointer;color:#009688;">Breast Cancer</a>;
											<a onclick="exampleFun(this)" style="cursor:pointer;color:#009688;">ATM</a>;
											<a onclick="exampleFun(this)" style="cursor:pointer;color:#009688;">g.108302974delT</a>;
											<a onclick="exampleFun(this)" style="cursor:pointer;color:#009688;">c.5441delT</a>;
											<a onclick="exampleFun(this)" style="cursor:pointer;color:#009688;">p.L1814Wfs*14</a>
										</p>
										</div>
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="*">Submit</button>
										<button type="reset" class="layui-btn layui-btn-primary" lay-filter="reset" id="reset" onclick="formClick(this,selectId,'reset')">Reset</button>
									</div>
								</div>
							</form>
						</fieldset>

					</div>

				</div>
				<div class="layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4" id="panel-right" style="margin-bottom:20px;margin-top:65px;">
					<table class="layui-table" style="margin-bottom:0px;">
						<thead>
							<tr>
								<th colspan="3" style="font-size:20px">Database Statistics</th>
							</tr>
							<tr>
								<th>Feature</th>
								<th>Type</th>
								<th>Count</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="8">Variants</td>
								<td>FS-deletion</td>
								<td>517</td>
							</tr>
							<tr>
								<td>FS-insertion</td>
								<td>92</td>
							</tr>
							<tr>
								<td>FS-duplication</td>
								<td>102</td>
							</tr>
							<tr>
								<td>FS-complex</td>
								<td>27</td>
							</tr>
							<tr>
								<td>IF-insertion</td>
								<td>88</td>
							</tr>
							<tr>
								<td>IF-deletion</td>
								<td>28</td>
							</tr>
							<tr>
								<td>IF-duplication</td>
								<td>10</td>
							</tr>
							<tr>
								<td>IF-complex</td>
								<td>31</td>
							</tr>
							<tr>
								<td>Disease</td>
								<td></td>
								<td>57</td>
							</tr>
							<tr>
								<td>Gene</td>
								<td></td>
								<td>67</td>
							</tr>
							<tr>
								<td>Publication</td>
								<td></td>
								<td>270</td>
							</tr>

						</tbody>
					</table>
					<div class="layui-text">
						FS: frameshift; IF: inframe; complex: insertion occurs simultaneously with deletion
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
		<script src="layui/layui.all.js"></script>
		<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
		<script>
			form = layui.form;
			var selectId = new Array();

			function formClick(select, selectId, value) {
				if($.inArray(select, selectId) == -1) {
					/* 	if(value==""||value==null)
							return */
					if(select.getAttribute("id") == "reset") {
						document.getElementById("hideU").value = "";
						document.getElementById("Disease").options.length = 1;
						document.getElementById("Gene").options.length = 1;
						document.getElementById("cDNA").options.length = 1;
						document.getElementById("Drug").options.length = 1;
						document.getElementById("Level").options.length = 1;

						selectId = [];
					} else {
						selectId.push(select);
					}

				}

				for(var i = $.inArray(select, selectId) + 1; i < selectId.length; i++) {
					selectId[i].options.length = 1;
				}
				for(var i = selectId.length - 1; i >= $.inArray(select, selectId); i--) {
					if($(selectId[i]).val() == "") {
						selectId.splice(i, 1);

					}

				}

				if(select.getAttribute("id") == "Gene" && $(select).val() == "") {
					document.getElementById("cDNA").options.length = 1;
					document.getElementById("cDNA").options[0].innerHTML = "Select Gene First";
				} else if(select.getAttribute("id") == "Gene") {
					document.getElementById("cDNA").options[0].innerHTML = "Select Indel";
				}
				//console.log($('#select').serialize());
				$.ajax({
					type: "get",
					url: "ajaxForm",
					data: $('#select').serialize(),
					success: function(msg) {
						json_ = jQuery.parseJSON(msg);
						//console.log(json_);
						for(selectName in json_) {
							//console.log(selectName);
							var tempSelect = document.getElementById(selectName);
							tempSelect.options.length = 1;
							json_[selectName].sort();
							for(optionId in json_[selectName]) {
								var tempOption = new Option(json_[selectName][optionId], json_[selectName][optionId]);
								tempSelect.appendChild(tempOption);
								tempOption.innerHTML = json_[selectName][optionId];
								tempOption.value = json_[selectName][optionId];
							}
						}
						form.render('select');
					}
				});

				/* if($(document.getElementById("Gene")).val()!=""&&data.value!=null)
				{
					console.log(document.getElementById("cDNA").options[0]);
				} */

				form.render('select');
			};
			window.onload = function() {

				formClick(document.getElementById("reset"), selectId, "reset");

				form.on('select(Disease)', function(data) {
					document.getElementById("hideU").value = "1";
					formClick(document.getElementById("Disease"), selectId, data.value);
				});
				form.on('select(Gene)', function(data) {
					document.getElementById("hideU").value = "1";
					formClick(document.getElementById("Gene"), selectId, data.value);

				});
				form.on('select(cDNA)', function(data) {
					document.getElementById("hideU").value = "1";
					formClick(document.getElementById("cDNA"), selectId, data.value);
				});
				form.on('select(Drug)', function(data) {
					document.getElementById("hideU").value = "1";
					formClick(document.getElementById("Drug"), selectId, data.value);
				});
				form.on('select(Level)', function(data) {
					document.getElementById("hideU").value = "1";
					formClick(document.getElementById("Level"), selectId, data.value);
				});
				/* form.on('select(reset)', function(data) {
					formClick(document.getElementById("reset"));
				}); */
				
			};
			function exampleFun(t) {
				$("#userInput").val("");
				$("#userInput").val($(t).text());
			};
		</script>
	</body>

</html>
