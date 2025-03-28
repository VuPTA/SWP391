<%-- 
    Document   : accountDetails
    Created on : Feb 12, 2025, 4:35:26 AM
    Author     : ADMIN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%
    Account account = (Account) request.getAttribute("accountdetail");
    if (account == null) {
        response.sendRedirect("listAccounts");
        return;
    }
%>
<%
              String msg = (String)request.getAttribute("msg");
               if(msg == null) msg = "";
                
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Users / Profile - NiceAdmin Bootstrap Template</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- ======= Header ======= -->
        <jsp:include page="/common/header.jsp"></jsp:include><!-- End Header -->

            <!-- ======= Sidebar ======= -->
        <jsp:include page="/common/sidebar.jsp"></jsp:include><!-- End Sidebar-->
            <main id="main" class="main">
                <div class="card-body pt-3">
                    <!-- Bordered Tabs -->
                    <ul class="nav nav-tabs nav-tabs-bordered">

                        <li class="nav-item">
                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                        </li>

                        <!--                <li class="nav-item">
                                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                                        </li>-->

                        <!--                <li class="nav-item">
                                          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Settings</button>
                                        </li>
                        
                                        <li class="nav-item">
                                          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                                        </li>-->

                    </ul>
                    <div class="tab-content pt-2">

                        <div class="tab-pane fade show active profile-overview" id="profile-overview">
                        <%=msg%>
                        <h5 class="card-title">Profile Details</h5>

                        <div class="row">
                            <div class="col-lg-3 col-md-4 label ">Full Name</div>
                            <div class="col-lg-9 col-md-8"><%= account.getName() %></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-4 label ">Gender</div>
                            <div class="col-lg-9 col-md-8"><%= account.getGender() %></div>
                        </div>               
                        <div class="row">
                            <div class="col-lg-3 col-md-4 label">Phone</div>
                            <div class="col-lg-9 col-md-8"><%= account.getPhone() %></div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3 col-md-4 label">Email</div>
                            <div class="col-lg-9 col-md-8"><%= account.getEmail() %></div>
                        </div>

                    </div>

                    <!--                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
                    
                                         Profile Edit Form 
                                        <form action="updateProfile" method="post">
                                                                <div class="row mb-3">
                                                                  <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <img src="assets/img/profile-img.jpg" alt="Profile">
                                                                    <div class="pt-2">
                                                                      <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                                                                      <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                                                                    </div>
                                                                  </div>
                                                                </div>
                    
                                            <div class="row mb-3">
                                                <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input hidden="" name="accountId" type="text" class="form-control" id="fullName" value=<%= account.getAccountId() %>>
                                                    <input name="newName" type="text" class="form-control" id="fullName" value=<%= account.getName() %>>
                                                </div>
                                            </div>
                                            
                                                                <div class="row mb-3">
                                                                  <label for="about" class="col-md-4 col-lg-3 col-form-label">About</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <textarea name="about" class="form-control" id="about" style="height: 100px">Sunt est soluta temporibus accusantium neque nam maiores cumque temporibus. Tempora libero non est unde veniam est qui dolor. Ut sunt iure rerum quae quisquam autem eveniet perspiciatis odit. Fuga sequi sed ea saepe at unde.</textarea>
                                                                  </div>
                                                                </div>
                                            
                                                                <div class="row mb-3">
                                                                  <label for="company" class="col-md-4 col-lg-3 col-form-label">Company</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <input name="company" type="text" class="form-control" id="company" value="Lueilwitz, Wisoky and Leuschke">
                                                                  </div>
                                                                </div>
                                            
                                                                <div class="row mb-3">
                                                                  <label for="Job" class="col-md-4 col-lg-3 col-form-label">Job</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <input name="job" type="text" class="form-control" id="Job" value="Web Designer">
                                                                  </div>
                                                                </div>
                                            
                                                                <div class="row mb-3">
                                                                  <label for="Country" class="col-md-4 col-lg-3 col-form-label">Country</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <input name="country" type="text" class="form-control" id="Country" value="USA">
                                                                  </div>
                                                                </div>
                                            
                                                                <div class="row mb-3">
                                                                  <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <input name="address" type="text" class="form-control" id="Address" value="A108 Adam Street, New York, NY 535022">
                                                                  </div>
                                                                </div>
                    
                                            <div class="row mb-3">
                                                <label for="Gender" class="col-md-4 col-lg-3 col-form-label">Gender</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <select name="newGender" class="form-select" id="Gender">
                                                        <option value="Nam" <%= account.getGender().equals("Nam") ? "selected" : "" %>>Nam</option>
                                                        <option value="Nữ" <%= account.getGender().equals("Nữ") ? "selected" : "" %>>Nữ</option>
                                                    </select>
                                                </div>
                                            </div>
                    
                                            <div class="row mb-3">
                                                <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="newPhone" type="text" class="form-control" id="Phone" value=<%= account.getPhone() %>>
                                                </div>
                                            </div>
                    
                    
                    
                                            <div class="row mb-3">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="newEmail" type="email" class="form-control" id="Email" value=<%= account.getEmail() %>>
                                                </div>
                                            </div>
                    
                                                                <div class="row mb-3">
                                                                  <label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Twitter Profile</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <input name="twitter" type="text" class="form-control" id="Twitter" value="https://twitter.com/#">
                                                                  </div>
                                                                </div>
                                            
                                                                <div class="row mb-3">
                                                                  <label for="Facebook" class="col-md-4 col-lg-3 col-form-label">Facebook Profile</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <input name="facebook" type="text" class="form-control" id="Facebook" value="https://facebook.com/#">
                                                                  </div>
                                                                </div>
                                            
                                                                <div class="row mb-3">
                                                                  <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <input name="instagram" type="text" class="form-control" id="Instagram" value="https://instagram.com/#">
                                                                  </div>
                                                                </div>
                                            
                                                                <div class="row mb-3">
                                                                  <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
                                                                  <div class="col-md-8 col-lg-9">
                                                                    <input name="linkedin" type="text" class="form-control" id="Linkedin" value="https://linkedin.com/#">
                                                                  </div>
                                                                </div>
                    
                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </form> End Profile Edit Form 
                    
                                    </div>-->

                    <div class="tab-pane fade pt-3" id="profile-settings">

                        <!-- Settings Form -->
                        <form>

                            <div class="row mb-3">
                                <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Email Notifications</label>
                                <div class="col-md-8 col-lg-9">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="changesMade" checked>
                                        <label class="form-check-label" for="changesMade">
                                            Changes made to your account
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="newProducts" checked>
                                        <label class="form-check-label" for="newProducts">
                                            Information on new products and services
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="proOffers">
                                        <label class="form-check-label" for="proOffers">
                                            Marketing and promo offers
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="securityNotify" checked disabled>
                                        <label class="form-check-label" for="securityNotify">
                                            Security alerts
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form><!-- End settings Form -->

                    </div>

                    <div class="tab-pane fade pt-3" id="profile-change-password">
                        <!-- Change Password Form -->
                        <form>

                            <div class="row mb-3">
                                <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="password" type="password" class="form-control" id="currentPassword">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="newpassword" type="password" class="form-control" id="newPassword">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                <div class="col-md-8 col-lg-9">
                                    <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Change Password</button>
                            </div>
                        </form><!-- End Change Password Form -->

                    </div>

                </div><!-- End Bordered Tabs -->
                <div class="text-center mt-3">
                    <a href="warehouses" class="btn btn-secondary">Return</a>
                </div>
            </div>
        </main><!-- End #main -->
        <!-- ======= Footer ======= -->
        <jsp:include page="/common/footer.jsp"></jsp:include>
    </body>
</html>
