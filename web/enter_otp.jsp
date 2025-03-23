<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Xác nhận OTP</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
   <%
               String msg = (String)request.getAttribute("msg");
                if(msg == null) msg = "";
                
            %>
<body class="d-flex justify-content-center align-items-center vh-100">
<div class="card p-4 shadow">
    <h3 class="text-center">Xác nhận OTP</h3>
    <form action="verify-otp" method="post">
        <div class="mb-3">
            <input type="text" class="form-control" name="otp" placeholder="Nhập OTP" required>
        </div>
        <button type="submit" class="btn btn-success w-100">Xác nhận</button>
         <%=msg%>
    </form>
</div>
</body>
</html>
