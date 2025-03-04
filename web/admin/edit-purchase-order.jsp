<%-- 
    Document   : create-bin
    Created on : Mar 2, 2025, 11:52:04 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Forms / Validation - NiceAdmin Bootstrap Template</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <base href="${pageContext.request.contextPath}/">
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

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: NiceAdmin
        * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
        * Updated: Apr 20 2024 with Bootstrap v5.3.3
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <!-- ======= Header ======= -->
        <jsp:include page="../common/header.jsp"></jsp:include><!-- End Header -->

            <!-- ======= Sidebar ======= -->
        <jsp:include page="../common/sidebar.jsp"></jsp:include><!-- End Sidebar-->

            <main id="main" class="main">

                <div class="pagetitle">
                    <h1>Edit Purchase Order</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Purchase Orders</li>
                            <li class="breadcrumb-item active">Edit Purchase Order</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Edit Purchase Order</h5>

                                    <form class="row g-3 needs-validation" novalidate action="edit-purchase-order" method="post">
                                        <!-- Supplier -->
                                        <div class="col-md-6">
                                            <input type="hidden" class="form-control" id="poId" name="poId" value="${po.poId}">
                                        <input type="hidden" class="form-control" id="createdBy" name="createdBy" value="${po.createdBy}">
                                        <input type="hidden" class="form-control" id="createdDate" name="createdDate" value="${po.createdDate}">
                                        <label for="supplierID" class="form-label">Supplier</label>
                                        <select class="form-select" id="supplierID" name="supplierID" required ${po.status eq 'Completed' ? 'disabled' : ''}>
                                            <option selected disabled value="">Choose a Supplier...</option>
                                            <c:forEach items="${suppliers}" var="s">
                                                <option value="${s.supplierName}" ${po.supplier eq s.supplierName ? 'selected' : ''}>${s.supplierName}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a Supplier.</div>
                                    </div>

                                    <!-- Expected Date -->
                                    <div class="col-md-6">
                                        <label for="expectedDate" class="form-label">Expected Date</label>
                                        <input type="date" class="form-control" id="expectedDate" name="expectedDate" required value="${po.expectedDate}" ${po.status eq 'Completed' ? 'disabled' : ''}>
                                        <div class="invalid-feedback">Please select a valid date.</div>
                                    </div>
                                    <!-- Status -->
                                    <div class="col-md-12">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select" id="status" name="status" required ${po.status eq 'Completed' ? 'disabled' : ''}>
                                            <option value="Pending" ${po.status eq 'Pending' ? 'selected' : '' }>Pending</option>
                                            <option value="Completed" ${po.status eq 'Completed' ? 'selected' : '' }>Completed</option>
                                        </select>
                                    </div>

                                    <!-- Search Products -->
                                    <div class="col-md-6">
                                        <label class="form-label">Search Product</label>
                                        <input type="text" class="form-control" id="searchProduct" placeholder="Type to search..." ${po.status eq 'Completed' ? 'disabled' : ''}>
                                        <ul class="list-group mt-2" id="productList" style="display: none; position: absolute; z-index: 1000;"></ul>
                                    </div>

                                    <!-- Purchase Items Table -->
                                    <div class="col-12">
                                        <label class="form-label">Purchase Items</label>
                                        <table class="table table-bordered" id="purchaseItemsTable">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Quantity</th>
                                                    <th>Unit Price</th>
                                                    <th>Total</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Rows will be added dynamically -->
                                                <c:forEach items="${po.purchaseItems}" var="pi">
                                                    <tr>
                                                        <td>${pi.product.pvName} - ${pi.product.color} - ${pi.product.size}
                                                            <input type="hidden" name="productID[]" value="${pi.productVariantId}">
                                                            <input type="hidden" name="price[]" value="${pi.unitPrice}">
                                                        </td>
                                                        <td><input type="number" class="form-control quantity" name="quantity[]" min="1" value="${pi.quantity}" required ${po.status eq 'Completed' ? 'disabled' : ''}></td>
                                                        <td class="unitPrice">${pi.unitPrice}</td>
                                                        <td class="totalPrice">${pi.unitPrice * pi.quantity}</td>
                                                        <td><button type="button" class="btn btn-danger btn-sm removeRow" ${po.status eq 'Completed' ? 'disabled' : ''}>Remove</button></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit" ${po.status eq 'Completed' ? 'disabled' : ''}>Save Purchase Order</button>
                                        <a class="btn btn-danger" href="purchase-orders">Cancel</a>
                                    </div>
                                </form>



                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    let now = new Date();

                    // Chuyển sang múi giờ Việt Nam (GMT+7)
                    let vietnamTime = new Date(now.getTime() + (7 * 60 * 60 * 1000));

                    // Định dạng thành YYYY-MM-DDTHH:MM để đặt vào min
                    let formattedNow = vietnamTime.toISOString().slice(0, 10);

                    document.getElementById("expectedDate").setAttribute("min", formattedNow);
                });
            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const searchProduct = document.getElementById("searchProduct");
                    const productList = document.getElementById("productList");
                    const tableBody = document.querySelector("#purchaseItemsTable tbody");

                    //dữ liệu sản phẩm 
                    var products = [];
            <c:forEach items="${products}" var="o">
                    products.push({
                        id: "${o.productVariantID}",
                        name: "${o.pvName}",
//                        image: "${o.image}",
                        image: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhITExIVFRUVFxUXFRcVFxUVEhgVFRUWFxUWFxcYHSggGBolHRUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGBAQFSsZHR0rLS0rKystKy0rKy0rKy0rLS0tLTctNystLSsrLSstLSstKy03Ky0rKy0rLS0tLSs3K//AABEIAMIBAwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAABQMEAQIGBwj/xABCEAABBAADBQQFCgUDBAMAAAABAAIDEQQhMQUSQVFhBiJxgRMykaHBBxQjM1JigrHR8EJzsrPhcqLxFVNjkiQ0Q//EABkBAAMBAQEAAAAAAAAAAAAAAAABAgMFBP/EAB8RAQEAAgIDAQEBAAAAAAAAAAABAhEhMQMSQQRRE//aAAwDAQACEQMRAD8A9xQhCAEIQgPj7aY+nxH86b+45asap9pN/wDkT/zZf7jloxqAyxqnaFoKCzRPQJBvvclLFHeqjLmtHXkiRxORyHJClj5wG91os6dEyw2GGRed48Pu+HRLsBD3geSbtIGZNJU4sRxnRXIi1vrHgqceKLxusFPHqk8eg6owWDc9wdn4ngeIS0Zrh2h5DhdVx/fRSwAl9lti91v3a1NK6yNsQG+QOA58xQ81Wdje9ULQ0k5uPrf4S9LlVY+XHG6+mOHgjgjPpCBdkg6nySvE9oNGYdu6HGiR62fVaPwzpWPo7xzvjmrnZ3sySWPkO7RBriV6vF4sJN15/wBXmz3Jjvl0e23mPCPI9ZsdDndUuBGPeXu3i7ecPrLzrgG8iuw7UYiWQOgiYCSWiyfC/BQbL7Ibrt6R5JNd0ZgEcQeC8WXb24XCY7y5rl8A2SVojay7dbpKsEDIeB6L0DZ2yRGwF3kK06+KZYDZkcYAoDlf6Kw6PfPQe/qisrltXiaSKANc1cw2HdqT4Z8FKyhkApQU90mwFf5WzSowVI1IMk2tg1YAUgQFvCjuqZRYb1VKtp0yoQhCYCEIQAhCEAIQhAfJG0h9PP8AzZf7jlDvcApNpg+nn/my/wBxyjjYfBINhTdSt2OLzQyHvWBG0ZnMqaNvLuj3oNkYYaDUq8/CAPtxyyy55Lq+zHYuOYNe6Rxsf/mG6Hm43n0pdHiPk9hcQW4hwrKnNa73ghT7KmNeYS4sjJjQM1vDh3uG873ruMZ2Amjsxlsw1y7r/wD1PwKWDYs2TTG4Z0Rumx4jl1RsapdhoWRt35XVxrj5JvJtAuYHRNoGg4kDeBOjq0F6eJB4png+wjppRJIO7QqjVitK5j96J5tr/p2y2RnFOcPSFzW7rC45AF2Q4Am/EpxNlcJN6SRjS2y5zgOeeYJ86Cc4LslOCwlriXV7Tz8l6XsDZ+EMbZsPuvjkJka5p3mku1I5eHBOSAEWnjqXbiZNlmKrbRrOviquyXufISdATXKgu+oEEEWCk2MwRYD6NmZOg/NVjnqUssfbLZdBhWguf/ESc/gpw6tFHOx0Ys88+gWI5vJedombl4qZhKiaQsT4oRsdI801oslOTYTucBm4geKnieDoQeoXncgxG0CXhh3Be6Ce6PLi5S9i5Hw4t0Bui3vDWncNNFr/AJcdruHD0MNUgVDF7Uiiye8X9kZu9gVEbXllJEMVD7T/ANP8rORmelwAskDxVM7aYTuxh0jvuju+bjkqcWxi83PIXm73dGDyTiCJrRTWgDomFnZrnllyANNnIG6HDPmraiw+ilWk6Z0IQhMBCEIAQhCAEIQgPk7ajQJ57/7sv9blW370U+0obnm3jf0sv9xy1ZGEjYhj4/mrUcawxqsMYlab0b5NJgGFrt4tB67oP7C7z563SqXmOwduiKNsMLN52ri48eQ5BdngpJSN5z2gV3g1oIHi51n3KK0h2515Vnw/5WuKkjgY6WU5DPvVQUuC77QWgkc9B71y3yi7BxeJYwRPBYDb4gd0urP1uPDLJAIsd8o8z3FuEw5c1pOe6fDIXSWYrtW3GM+b7Rw7XDOjRa9jiKtpObXeHnkuY7QRTRRuLmPjLRW6QWgHgRwoqODEOlhY2TMtaaJq61ou1IHInLOqSLcOcBsTaWAfv7LxW/C5wO48gCrH1jHdw9XNo1yXteH2oX1dXxrS15Z8lMzp5XwONhjb8r0K9bh2K1vFO7pWSLML1tNMBZOgWzMNXFUdowOIOWWnkUaDhdv/ACo7L3HgTOlNEBsbH2T0c4BvnaSdg+2WMxuLYxuEBwpLt+Uh2+0UaO/e5dgd0AlZ2r2MwGFDpTh2AZnvFzmjjk1xIC52Tt9IzuYdtNbpQyHgKpHHyB7FiWGN+TSW62l+1xHO30by8CwaYO9Y0GYXFbA+VFwc1mKYQDQDtPbYXdY17XNEkZ7pzOeRtJUVv+oehbuRx7jQNT+ZPNJsLi3vlEMZDN92e53bvMkuGZHmmOJMUgLb3T1Ne9UuxuALcVM5wP0YIBrUuyB9gPtRbTdRgNgxR0SN49dLTcZCgFCHLcOSQkClYomFTRphbw+ilUcGikWs6ZhCEJgIQhACEIQAhCEB8qbSb9PN/Nk/rct8PED4qPasoE03P0kmXH13KGMOd90e9JRl8zeNGk+GakZgpP4mOA8Cq0DN3S/am+ycNLK8Na53WnVQ4nVTTkNOz2ybO84lrB4izyK6dm1A5wY2hGzUCqc69OFpftbGuiY1jHuFDM3ZPkmXZ3eLWvfIdLIJ4Hib0UVcjocJiJn2A2gNM6y8Babx4ff9bM8c8/cqmCcXZjIc3UL8E0jlAyCUGSF+w4ninjeBBBDqIo6iiEtPYDAXvegb4DIewLow5RuxIHEe1aajPkt2P2WwuFeXwRBjiKNXVeCodre0RwootcNKeR9HXHvaA9CnUmL47za6aqliNqsoguGmmRHsU5Xjhfj4yls25PB9qxIGva85kjpY1TXY3a1srwzeBvK+FjVc3jNnxPmHot1jLJIaKbZPAdc10mxeyODia2oWu67zj7c81nj7bdDzXw+nXKh8q+yJZ8F9A0vcXt3t0WQzi6l4m0zYTec0OjezeGYo6d4EEURR0zGa+p4pWeqKFZUocVgIZPXjaepGftW2nLfNGFaJWAPFhwt18CeLa0IXefJxtRxjkwsht0Zc0E+qQPVI8l3m0+zMXrRxsPQ7o99JPGWt7jomMo8KaQelKK0xjlduwuY4t/i15O8gOHVdh2Kw7mwW8kl5sWb7oFD32k23cJG9zHudVEd7R1Xm13PXIrrsK8Fo3aqsq5KVW8LbVuCoQVIES7SlYVMwpdLjo2es8XyGZVaTbg/gaT46K5CdRhzkpUu2HiDJHvGr3jp5JitJ0zCEITAQhCAEIQgBCEID5bxkEXp5snA+kk5Oz3zZzr81LBCOD2eDgQfyr3rTHj6ab+ZJ/W5RmVrdSkcMoMIXaMDv9Lmk+wG11XZvB+jY+R0TgdBdg/kuCZiHuNMFeVrr9jQPexkIcbJtxs5N8RxyKmrx5WcLgvncuUTwAcze6w9D3e8u1hwzYhuhhPQaXpyyV/YmA9Eyrc483FxNeammYeZ+H6LOrVocQ663Dlqbv4K5h8UAbP6lUXNHGz+XkpG4gDQAeWanZ6XsTib1vw/wlG08duDhZ0A1W0+MoEpPNJvmzwRs5EEe195xa4kEX0Kr4vaTWD1q8+azitnhxN+SiOwYy3MA52P+eKe1ahbg8c10h/YPNddhMcWDu6fZGi5TF7Eythqv2FnCbVLKa9pvmAaP6I2Mpt32H2rpvNy+1xCb4XGAjLMe9cLgMcXjeaeNfn+ib4eW6q78/wAlXsyuLoMS9zc25jrfvzXN7UdYsRjM94jePnQKY/OrYQe6eeVHyKRGaiWkAg8NM+OTt6vNK0SEG08S6NjhuON3mN6j7QaVvs3t9jGnfD886GeYGeXkoNsQM3BuuDCbon1eYzs0OtpH2fwU3pGsr1t6i0gsPXebkU5NlXpj9qg4YSsyLjQBokHeIOV60EllxU0pA33O47rRXuCux7KDGhpJe7ibIANaBNNmQNjjNEb51Jzz4eQXNsy/LjfSe9yyVv2cw0Z5HxVljxdcEyZsS7JfmTlQ5phh9iRtq+946LpzLhBn2W+o/E74Juq2AYGspoAF6DRWVpEUIQhMghCEAIQhACEIQHyvtCOR003Aelk8++VnD7Mcdch4pni2EzS8PpH/ANRUrW6AZkqaaXZuHGjWihxOQvnZXebAwIjLS4i+DWDnzOi5PAlrSO9RGr6ujyYXUB4+xejbIiaWNcM/HdOfOwpy6aYmDZTVkGvEqGSQnU5IxMvnWnJVXylZVbWWQKBz7Q42jcWZ1FIL8tPFRthVoMW7Y05Qr+jyUUjKCY7ijexUeyoxZGwluIwd0aXRPZkqc0GSJBsvwTgw7ugKcRURY4fu0kxGHOanwcjgAnsqcPxFjOj7bPs4pbjoGPFDI5013P7rsh+R01VgQl3A81f2XsZ0h72TR+6TSU7C2C/EE717gyO9r1GgvwN+K7bY/Z+DDCo2AHieJTLDwNY0BooBbkq5NRlaW7UwTS11U01qkjZct2NhfWpaCBfi6gnmOn3b/JLoyXE2SFh5/Lj4sLnl1FSbaNbN9yMcjb3e6h70eiB9eR7+gIY3/bn70NxBGRzpaF96LD83l82dvvjJPlirIf7IYBHTRQs8z+auqhsU3H5n4K+ulj0xoQhCYCEIQAhCEAIQhAfNe0MQBLKACT6R+n+srGLL2jdBDSfWIzIH2QeB5nyTKeICWU/+R9eO8VQe0ucaUr0zsfCtYbzz1Nm6+K9P7LzExA04DOt6rPUkLg9lYJzj6tgajj7CvQtjsLW1u0PClOVVFx7So9wjgrFoIWa1J7EWrDmqNzFFgahbNWtLIUqSKJz1m1E945oDVz7UZWwFqSOMuIAFpykrR4J0hposp9s7s7QBefIJls7BiJudWdSrXpwFrJ/Wdtaw4FjRQaPYp2sA0UfzkKOTEBVuJ1VklYtUxiEHEI2NFG2ZbfXAKk2fdzvztQbawj3PP0z2g5gNDR7yCks+wWu9Zzn/AOsl3+FGWOOU1ZszSfbEDbuVt8gbd7AqrdugkCKKSQnQ1uj/AHKBmyA2t0NHhkrmDwe64ElOSScG7DsvI90NyNDXbzsg7eyy4puluwfqvMpktp0zoQhCZBCEIAQhCAEIQgPnjHyPMkgDcvSPH+4pxsfBNoBwzPMX7xomcmyC6V1NI7ztKJ1uy06rrtibCADS5rfYR7jooaNdjdn2Ma17gDxHTz5dFa2hKQMk2lbQySrGR3anKnCg4pw4WFs3GjqFiZnRVXhZ1cXjPyR6Tml3o1o6YhRyrRmXLQvS355zWfnISGl90irSAKMTWsF4QNJg8J52faLJ1oLnbC67Y8TY4g77WearCcpySYnGC+PsVQ4nqVPisQClUsptWmLZmcVj0mdE+SpCdayS1mg15s6sQ5pG3Eq/hsVdZpxNX8Zhg9vUJI9lFOoJs1rj8FlvNF9E7CJAFu1YkbRQ1yk3U7A+q/EUySzs6bh/Efgma3x6Z0IQhMghCEAIQhACEIQCyCFhzoHNXQEqe1zT3RxV6CQkZijyUNNMytS6ePqmaw5imw3NYqJw6qiW9F1kkAVDEYEHgFNiiAilUmI4ptioK4FKZo/+CpsNWdFeijfErBb09miw7MHNRcT2qsaRotvSEaqzE3JZc1To9o4Z811zZ7jZX2R1XHOjo5J1snGn1Xm70OSrEqvvzVWZW5qCXyzclWyYBUWIfYpRmUqFzyeBVEidJRU+FxPsVV8JPBbjIIB9hp9CnEE2VLmsNlSaQ4ocVUqaV9oxKx1s3d08a06Lnnzyk5vPlQK7+RglYW89PFchjMP6NxaeGp/TognY9h7+bZkk77tczwXQJF2M/wDr/jd8E9Ws6RQhCEyCEIQAhCEAIQhAQOjC13FISsKFxosoKEKYIWhYt7Ru2ihRxEIPEeaU4rZrTyPguiMSqYjBA5530UWHK5bEYIt096qGE8QujlgI6/mqz4AeHtUqJQ2lo5p8UxkwxvLRRGA8FNgUQytVJGM8laEPRZEQR0FpsTi0ZqIspW8JLwIUssSIC10QUZjV17KULwmFUhVZmEkV5q+5qjpMmsa3MlcVEVq56Bo1wGLpRbZw1kPFZ6/sqlC8Xmrcj98Uq+E6HsiKg/G74J0lPZltQ1953wTZazplewhCEyCEIQAhCEAIQhAVyVglYK0Kho2tG8tQsFM29rdpUIK2BU0k9rRwWocs2kNK8wPJUZGA8E2cq8zVNioUOgrjaglZ5FMXxAnIqGVnMpKLXx0tPFMHRjgqsoUUId4c1NFMRwNdVCJB/CL8FvGXHhSAt5FQSRq7hcPYsrEzaTplro1A9tJnkVWmjR7FoueoHlW51SkVBkOVyCTJLwrkGiZOw7Mn6H8TvgmyUdmPqfxO+CbrbHpjl2EIQmQQhCAEIQgBCEICoVilkoCjbUEKNSOKitAZQUItAYordppaoQEhcFh7FrSj9LWqmiMSt5BVnwb2qvXeiic3mpsUXzM3QqDjvJjjxlVqphYb/VZ3s0LYDwoBW8PhOZtWYoFY3aTkDQ5KpKVJLLmq07rCKcaMFKOVbMKikUGp4hqpShMntVGVqvEqqhuattUMTc1PSpLr+y/1H4nfBN0o7L/Ufid8E3W+PTHLsIQhMghCEAIQhACEIQFVy1QhZNGHKEoQrMBSBCEgEBCEBstcTohCiiI4VvKhCXxRXtTgpMCO6EIUfT+LYRJohCoi+fVRFYQpU1dooHLCFBIyq0qEKsQiYtkIVk67sv8AU/id8E3Qhb49McuwhCEyCEIQH//Z",
                        color: "${o.color}",
                        size: "${o.size}",
                        price: ${o.price},
                        quantity: ${o.quantity},
                        category: "${o.category.categoryName}",
                        product: "${o.product.productName}"
                    });
            </c:forEach>

                    // Tìm kiếm sản phẩm
                    searchProduct.addEventListener("input", function () {
                        const searchText = this.value.toLowerCase();
                        productList.innerHTML = "";
                        if (searchText.length === 0) {
                            productList.style.display = "none";
                            return;
                        }

                        const filteredProducts = products.filter(p => p.name.toLowerCase().includes(searchText));

                        filteredProducts.forEach(p => {
                            const li = document.createElement("li");
                            li.classList.add("list-group-item", "list-group-item-action");
                            li.innerHTML =
                                    "<div style='display: flex; align-items: center; gap: 10px;'>" +
                                    "<img src='" + p.image + "' alt='" + p.name + "' style='width: 50px; height: 50px; object-fit: cover; border-radius: 5px;'>" +
                                    "<div>" +
                                    "<strong>" + p.name + "</strong> - $" + (p.price ?? 0) + "<br>" +
                                    "<small>" +
                                    "Color: " + p.color + " | Size: " + p.size + " | Quantity: " + p.quantity + "<br>" +
                                    "Category: " + p.category + " | Product: " + p.product +
                                    "</small>" +
                                    "</div>" +
                                    "</div>";
                            li.dataset.id = p.id;
                            li.dataset.name = p.name;
                            li.dataset.price = p.price;
                            li.addEventListener("click", function () {
                                addProductToTable(p.id, p.name, p.price, p.color, p.size);
                                searchProduct.value = "";
                                productList.style.display = "none";
                            });
                            productList.appendChild(li);
                        });

                        productList.style.display = "block";
                    });

                    // Thêm sản phẩm vào bảng
                    function addProductToTable(id, name, price, color, size) {
                        const existingRow = document.querySelector(`tr[data-id="` + id + `"]`);
                        if (existingRow) {
                            let quantityInput = existingRow.querySelector(".quantity");
                            quantityInput.value = parseInt(quantityInput.value) + 1;
                            updateTotals();
                            return;
                        }

                        const newRow = document.createElement("tr");
                        newRow.dataset.id = id;
                        newRow.innerHTML = `
                    <td>` + name + " - " + color + " - " + size + `<input type="hidden" name="productID[]" value="` + id + `"><input type="hidden" name="price[]" value="` + price + `"></td>
                    <td><input type="number" class="form-control quantity" name="quantity[]" min="1" value="1" required></td>
                    <td class="unitPrice">` + price + `</td>
                    <td class="totalPrice">` + price + `</td>
                    <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                `;
                        tableBody.appendChild(newRow);
                        updateTotals();
                    }

                    // Cập nhật tổng tiền
                    function updateTotals() {
                        document.querySelectorAll("#purchaseItemsTable tbody tr").forEach(row => {
                            const quantity = parseFloat(row.querySelector(".quantity").value) || 0;
                            const unitPrice = parseFloat(row.querySelector(".unitPrice").textContent) || 0;
                            const total = (quantity * unitPrice).toFixed(2);

                            // Gán total vào ô totalPrice (là <td>, không phải input)
                            row.querySelector(".totalPrice").textContent = total;
                        });
                    }


                    // Xóa sản phẩm
                    tableBody.addEventListener("click", function (e) {
                        if (e.target.classList.contains("removeRow")) {
                            e.target.closest("tr").remove();
                            updateTotals();
                        }
                    });

                    tableBody.addEventListener("input", function (e) {
                        if (e.target.classList.contains("quantity")) {
                            updateTotals();
                        }
                    });

                    // Ẩn dropdown khi click bên ngoài
                    document.addEventListener("click", function (e) {
                        if (!searchProduct.contains(e.target) && !productList.contains(e.target)) {
                            productList.style.display = "none";
                        }
                    });
                });
        </script>
    </body>

</html>
