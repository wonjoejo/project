<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>login.jsp</title>
  </head>
  <body>
    <h1>/WEB-INF/views/member/login.jsp</h1>

    <hr />

    <form action="/member/loginPost" method="POST">
      <fieldset>
        <legend>Login Form</legend>

        <div><input type="text" name="member_id" placeholder="ID" /></div>
        <div>
          <input type="password" name="password" placeholder="Password" />
        </div>
        <div>Remember-me<input type="checkbox" name="rememberMe" /></div>

        <p>&nbsp;</p>

        <div><button type="submit">Login</button></div>
      </fieldset>
    </form>
  </body>
</html>
