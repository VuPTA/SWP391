<%-- 
    Document   : changepass
    Created on : Mar 24, 2025, 8:53:12 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đặt lại mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form action="changepass" method="post">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Đặt lại mật khẩu</h2>
        <div class="card p-4 shadow-sm">
            <div class="mb-3">
                   <%
               String msg = (String)request.getAttribute("msg");
                if(msg == null) msg = "";
                
            %>
            <%=msg%><br>
                <label for="newPassword" class="form-label">Mật khẩu mới:</label>
                <div class="input-group">
                    <input name="newpass" type="password" class="form-control" id="newPassword" placeholder="Nhập mật khẩu mới..." required="">
                    <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('newPassword', this)">
                        <i class="bi bi-eye"></i>
                    </button>
                </div>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Xác nhận mật khẩu:</label>
                <div class="input-group">
                    <input name="renewpass" type="password" class="form-control" id="confirmPassword" placeholder="Nhập lại mật khẩu..." required="">
                    <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('confirmPassword', this)" >
                        <i class="bi bi-eye"></i>
                    </button>
                </div>
            </div>
                <button class="btn btn-primary w-100" onclick="submitForm()">Xác nhận</button>
        </div>
    </div>
</form>
    <script>
        function togglePassword(fieldId, button) {
            let input = document.getElementById(fieldId);
            let icon = button.querySelector("i");
            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("bi-eye");
                icon.classList.add("bi-eye-slash");
            } else {
                input.type = "password";
                icon.classList.remove("bi-eye-slash");
                icon.classList.add("bi-eye");
            }
        }

        function submitForm() {
            let newPassword = document.getElementById("newPassword").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            
            if (newPassword === "" || confirmPassword === "") {
                alert("Vui lòng nhập đầy đủ thông tin!");
                return;
            }
            
            if (newPassword !== confirmPassword) {
                alert("Mật khẩu xác nhận không khớp!");
                return;
            }
            
            alert("Mật khẩu đã được đặt lại thành công!");
        }
    </script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

