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
						<li class="layui-nav-item">
							<a href="index.jsp">Home</a>
						</li>
						<li class="layui-nav-item">
							<a href="About.jsp">About</a>
						</li>
						<li class="layui-nav-item">
							<a href="Download.jsp">Download</a>
						</li>
						<li class="layui-nav-item layui-this">
							<a href="Submit.jsp">Submit</a>
						</li>
						<li class="layui-nav-item">
							<a href="Contact.jsp">Contact</a>
						</li>
					</ul>

				</div>

			</div>

			<div class="layui-row" id="bodyer">
				<div class="layui-col-xs10 layui-col-sm10 layui-col-md10 layui-col-lg10 layui-col-sm-offset1 layui-col-md-offset1 layui-col-lg-offset1" id="overview" style="margin-bottom:20px;margin-top:20px;">
						<fieldset class="layui-elem-field layui-field-title">
							<legend><i>Welcome to submit new entries to the database</i></legend>
						</fieldset>
						<div class="layui-col-xs10 layui-col-sm10 layui-col-md10 layui-col-lg10 layui-col-sm-offset1 layui-col-md-offset1 layui-col-lg-offset1" id="overview">
							<form class="layui-form layui-form-pane" action="submit" method="get">

								<div class="layui-form-item">
									<label class="layui-form-label">Disease</label>
									<div class="layui-input-block">
										<input type="text" name="Disease" placeholder="" autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">Gene</label>
									<div class="layui-input-block">
										<input type="text" name="Gene" placeholder="" autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">Indel</label>
									<div class="layui-input-block">
										<input type="text" name="Indel" placeholder="" autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">Reference</label>
									<div class="layui-input-block">
										<input type="text" name="Reference" placeholder="" autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">E-mail(*)</label>
									<div class="layui-input-block">
										<input type="text" name="Email"  lay-verify="email" placeholder="" autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">More introduction (limited to 500 words)</label>
									<div class="layui-input-block">
										<textarea name="More" placeholder="" lay-verify="limitLength" maxlength="500" class="layui-textarea"></textarea>
									</div>
								</div>

								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="formDemo">Submit</button>
										<button type="reset" class="layui-btn layui-btn-primary">Reset</button>
									</div>
								</div>
							</form>
						</div>
					</div>
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
		<script src="layui/layui.all.js"></script>
		<script>
			layui.use('element', function() {
				var element = layui.element;
			});
			
			
			form = layui.form;
			form.verify({
				  limitLength: [
				    /^[\w\W]{0,500}$/
				    ,'More than 500 words'
				  ] 
				});
			status="<%=request.getParameter("success")%>";
			if(status==1)
				layer.msg('Thank you for your submission!');
			else if(status==2)
				layer.msg('The submission failed!');
			
			
			
			
		
		</script>
	</body>

</html>
