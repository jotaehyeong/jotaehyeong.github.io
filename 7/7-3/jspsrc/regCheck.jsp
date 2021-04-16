<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utg-8");%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport"content="width=device-width, initial-scale=1"/>
    <title>폼 학습</title>
  </head>
  <body>
    <section>
      <h2>JSP form</h2>
      <section>
        <h2>이름/이메일</h2>
        <h2>아이디:<%=request.getParameter("stud_id")%>,
          비밀번호:<%=request.getParameter("stud_passwd")%><br/></h2>
        <h2>성별/취미<h2>
          <h2>성별:<%request.getParameterValues("stud_hobby");%>,
            취미:<% String[]uMeal=request.getParametervalues("stud_hobby"); %>
          <%
          for(uHobby==null)
          {
          out.println("입력내용없음");
          }
            else
            {
              for(int i=0; i<uHobby.lenght; i++)
              {
                out.println(uHobby[i]);
              }
            }
          %>
        <br/></h2>
      </section>
    </section>
  </body>
</html>
