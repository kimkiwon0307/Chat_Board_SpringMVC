<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="../includes/header.jsp"%>
</head>
<body>
	<h1>아이디 찾기</h1>
	<div>
		<label>가입할때 적은 이메일주소를 적어주세요.</label> 
		<input type="text" id="input_mail" required="required">
		<button id="btn_findId">아이디 찾기</button>
	</div>
	<div id="findIdDiv">
	</div>
<script> 
	$(document).ready(function(){
		
		var findIdDiv = $("#findIdDiv");
		var html = "";
		
		$("#btn_findId").on("click",function(){
			
		var m_mail =  $("#input_mail").val();
		
		
		var data = {"m_mail" : m_mail};		
		
			   $.ajax({
        		  type : 'post',
        		  url : '/member/findId',
        		  data : JSON.stringify(data), 
        		  contentType : "application/json; charset=utf-8",
        		  success : function(data){
        			 alert("성공");
        			  // 넘어온 JSON 데이터를 객체로 변경
	        	     var m_nicks = JSON.parse(data);
        			 
        			 for(var i = 0; i < m_nicks.length; i++){
        				 
	        			var m_nick = m_nicks[i];
        				
	        			html = "<div>" + m_nicks[i] + "</div>";
	        			
	        			findIdDiv.append(html);
	        			
        			 }
        			  	
        		  }
        		   
        	  }); 
			
			
		})
		
		
	})
	

</script>


</body>


</html>