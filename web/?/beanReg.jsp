<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!doctype html>   
<html><head><meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script>function fnError() {alert("내용을 모두 입력하세요"); history.back();} </script>
<style>
* {padding:0; margin:0; }
body {font-family: Verdana, sans-serif; font-size:0.8em}
header,nav,section,article,aside,footer {border:1px solid gray; margin:5px; padding:8px}
nav ul{margin:0; padding:0;}
nav ul li{display:inline; margin:5px}
a:link { color:blue; text-decoration:none; }
a:visited { color:purple;text-decoration:none;}
a:hover { text-decoration:underline; }
a:active { color:red; text-decoration:none; }
section{height:450px;}
.id_form{width:50px;}
.label_form{display: inline-block; width:55px; height:14px; color:red;padding:5px;}
.button_form { width:60px; margin-left:5px; }
.fset {padding:15px; }
#dupBtn { height:25px;}
ul.level_1 > li {list-style:none; display:inline-block;vertical-align:bottom;}
ul.level_1 > li > ul {list-style:none; }
.level_2 li { padding-top:5px; }
.level_2 span { display:inline-block; width:70px; }
.level_2 input { width:100px; }
#loginBtn button { margin-left:5px; height:42px;}
#find_form{width:150px; height:20px; color:red;}
table, th, td {  border:1px solid black; border-collapse: collapse; }  
table {width:100%; height:80%; }
th, td { text-align:center; padding:10px; vertical-align:bottom;}
tr:nth-child(odd) {  background-color: lightgray; }
th { background-color: gray; color:white;}
table.ex1 { table-layout: auto; } 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){
  $('#stud_id').blur(function(){          //클릭이벤트 도 가능
    $.ajax({
      type:"POST",
      url:"./idcheck.jsp",
      data:{
        "stud_id": $('#stud_id').val()
      },
      success:function(data){
        console.log($.trim(data));
        if($.trim(data) == "YES"){
          //alert('사용가능');           
          $('#idcheck').html('<b style="font-size:14px;color:blue">가능</b>');
          $('#regBtn').attr('disabled',false);
        } else {
		  //alert('사용불가');
          $('#idcheck').html('<b style="font-size:14px;color:red">불가</b>');
          $('#regBtn ').attr('disabled',true);
        }
      }
    });
  });
});
</script><title>로그인 실습</title>

<jsp:useBean id="dto" class="studuserpkg.StuduserDTO"/>
<jsp:setProperty name="dto" property="*"/>
</head>
<body><header><h2>실습을 환영합니다</h2></header>
<nav><ul><li><a href="./beanLogin.html">로그인</a></li><li><a href="./beanReg.html">회원등록</a></li></ul></nav>
<section>
<fieldset class="fset"><legend>등록 결과</legend>
<% if(dto.getStud_id()==null || dto.getStud_passwd()==null || dto.getStud_name()==null || dto.getStud_phone()==null || dto.getStud_gender()==null || dto.getStud_email()==null || dto.getStud_id().trim().equals("") || dto.getStud_passwd().trim().equals("") || dto.getStud_name().trim().equals("") || dto.getStud_phone().trim().equals("") || dto.getStud_gender().trim().equals("") || dto.getStud_email().trim().equals("")) { %>
<section><script>fnError();</script></section>
<% return; 
} 
%>
<% String [] uHobby = dto.getStud_hobby(); String [] sHobby = {"","",""};
	if(uHobby!=null){
		for(int i=0;i<uHobby.length;i++){
			if(uHobby[i].equals("낚시")) { uHobby[0]="낚시"; 
			}else if(uHobby[i].equals("바둑")) { uHobby[1]="바둑"; 
			}else if(uHobby[i].equals("독서")) { uHobby[2]="독서"; 
			}
		}
	} %>
	<div style="overflow-x:auto; overflow-y:auto;">
	<table class="ex1">
	<tr><th>아이디</th><th>이름</th><th>전화</th><th>이메일</th><th>취미</th></tr>
	<tr><td><%=dto.getStud_id()%></td><td><%=dto.getStud_name()%></td>
	<td><%=dto.getStud_phone()%></td><td><%=dto.getStud_email()%></td>
	<td><%=sHobby[0]%><%=sHobby[1]%><%=sHobby[2]%></td></tr>
	</table></div>
</fieldset></section><footer><p>&copy; 20XX Made by Korea. All rigth reserced.</p></footer></body></html>
