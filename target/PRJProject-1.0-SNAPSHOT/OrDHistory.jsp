<%-- 
    Document   : info
    Created on : Jun 23, 2023, 2:03:23 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.Product"%>
<%@page import="DAOs.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

      

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    </head>
    <body>

        <%
            if (session.getAttribute("quantri") == null) {
                Cookie[] cookies = request.getCookies();
                boolean foundCookie = false;
                if (cookies != null) {
                    for (Cookie c : cookies) {
                        if (c.getName().equals("quantri")) {
                            foundCookie = true;
                            break;
                        }
                    }
                }
//                if (!foundCookie && session.getAttribute("quantri") == null) {
//                    response.sendRedirect("/listProduct");
//                }
            }
        %>
        <jsp:include page="header.jsp" />
        <div class="container mt-4">
            <div class="row">
                <div class="row">
                    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                        <h1 class="text-center">Lịch sử mua hàng</h1>
                        <!-- Shopping cart table -->
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">TÊN SẢN PHẨM</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Ngày</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">MÀU SẮC</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">ĐƠN GIÁ</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">SÔ LƯỢNG</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">TỔNG</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light" colspan="3">
                                            <div class="py-2 text-uppercase">TRẠNG THÁI</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <p class="text-center" id="error-message" style="color: red;">${CheckM} </p>
                                    <c:forEach items="${listTails}" var="o" varStatus="status">
                                        <tr >
                                            <td class="align-middle"><a href="<%=request.getContextPath()%>/details/${infoProduct[status.index].product_id}"><img src="${infoProduct[status.index].product_pic}" alt="" width="100" class="img-fluid rounded shadow-sm"></td>
                                                    <th class="align-middle"><a class="text-dark" href="<%=request.getContextPath()%>/details/${infoProduct[status.index].product_id}">${infoProduct[status.index].product_name}</th>
                                            <th class="align-middle">${o.order_date}</th>
                                            <th class="align-middle">${infoProduct[status.index].product_color}</th>
                                            <td class="align-middle"><p>${o.unit_price}</p></td>
                                            <td class="align-middle"><p>${o.quantity}</p></td>
                                            <td class="align-middle"><p>${o.unit_price * o.quantity}</p></td>
                                            <td class="align-middle"><p>${o.order_status}</p></td>

                                            <c:if test="${o.order_status == 'Ðã giao hàng'}">
                                                <td class="align-middle"><img src="https://icons.veryicon.com/png/o/system/revision-background/order-details-order-status.png" alt="" width="30" class="img-fluid rounded shadow-sm"></td>
                                                </c:if>

                                            <c:if test="${o.order_status == 'Chờ xác nhận'}">
                                                <td class="align-middle"><img src="https://media.istockphoto.com/id/1175395428/vi/vec-to/bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-ph%C3%B2ng-ch%E1%BB%9D-v%E1%BB%9Bi-d%E1%BA%A5u-ki%E1%BB%83m-%C4%91%C6%B0%E1%BB%A3c-ph%C3%AA-duy%E1%BB%87t-x%C3%A1c-nh%E1%BA%ADn-th%E1%BB%B1c-hi%E1%BB%87n-%C4%91%C3%A1nh-d%E1%BA%A5u-bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-%C4%91%C3%A3.jpg?s=612x612&w=0&k=20&c=eIxTSEkpzUsZmyP_b4zwCrEaB4xX3YOlrnjJBcawauc=" alt="" width="50" class="img-fluid rounded shadow-sm"></td>
                                                <td class="align-middle"><a onclick="return confirm('Bạn có chắc muốn hủy đơn hàng không!')" class=" btn btn-danger mt-auto" href="/PRJProject/orderhistory?ppid=${o.order_id}">Hủy đơn</a></td>
                                            </c:if>

                                            <c:if test="${o.order_status == 'Đang vận chuyển'}">
                                                <td class="align-middle"><img src="https://vanchuyentrungquoc247.com/wp-content/uploads/2015/04/icon-giao-hang.png" alt="" width="30" class="img-fluid rounded shadow-sm"></td>
                                                </c:if>

                                            <c:if test="${o.order_status == 'Chờ vận chuyển'}">
                                                <td class="align-middle"><img src="https://cdn.ntlogistics.vn/images/NTX/new_images/dich-vu-chuyen-phat-nhanh-trong-ngay-luu-y-can-nho-01.jpg" alt="" width="50" class="img-fluid rounded shadow-sm"></td>
                                                <td class="align-middle"><a onclick="return confirm('Bạn có chắc muốn hủy đơn hàng không!')" class=" btn btn-danger mt-auto" href="/PRJProject/orderhistory?ppid=${o.order_id}">Hủy đơn</a></td>   
                                            </c:if>
                                            <c:if test="${o.order_status == 'Đã hủy'}">
                                                <td class="align-middle"><img src="https://cdn-icons-png.flaticon.com/512/190/190406.png" alt="" width="30" class="img-fluid rounded shadow-sm"></td>
                                                <td class="align-middle"><a class="btn mualai mt-auto" href="/PRJProject/orderhistory?againOID=${o.order_id}">Mua Lại</a></td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- End -->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
