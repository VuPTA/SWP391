<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
   <%
               String msg = (String)request.getAttribute("msg");
                if(msg == null) msg = "";
                
            %>
<body class="d-flex justify-content-center align-items-center vh-100">
<div class="card p-4 shadow">
    <h3 class="text-center">Quên mật khẩu</h3>
    <form action="forgot-password" method="post">
        <div class="mb-3">
            <input type="email" class="form-control" name="email" placeholder="Nhập email của bạn" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Gửi OTP</button>
        <%=msg%>
    </form>
</div>
</body>
</html>
