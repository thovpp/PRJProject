/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAOs.EmployeeDAO;
import DAOs.FavoriteDAO;
import DAOs.RatingDAO;
import java.time.LocalDate;
import java.io.FileOutputStream;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import DAOs.accountDAO;
import DAOs.categoryDAO;
import DAOs.commentDAO;
import DAOs.customerDAO;
import DAOs.orderDAO;
import DAOs.orderdetailsDAO;
import DAOs.productDAO;
import DAOs.supplierDAO;
import Models.Account;
import Models.Category;
import Models.Customer;
import Models.Order;
import Models.Comment;
import Models.Employee;
import Models.OrderDeltail;
import Models.Product;
import Models.Supplier;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.net.URLDecoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import javax.websocket.Session;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class ManagerControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//         try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CategoryControl</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CategoryControl at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        //tao session dua tren cookie
        HttpSession session = request.getSession();
        if (session.getAttribute("quantri") == null) {
            String us = "";
            Cookie[] cook = request.getCookies();
            boolean foundCookie = false;
            if (cook != null) {
                for (Cookie c : cook) {
                    if (c.getName().equals("quantri")) {
                        foundCookie = true;
                        us = c.getValue();
                        break;
                    }
                }
                accountDAO acdao = new accountDAO();
                Account ac = acdao.getAccountByUS(us);
                if (ac != null) {
                    if (ac.getIsAdmin() == 1) {
                        session.setAttribute("quantri", ac);
                    } else {
                        response.sendRedirect("/PRJProject/home");
                    }
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        supplierDAO sDAO = new supplierDAO();
        productDAO dao = new productDAO();
        categoryDAO catedao = new categoryDAO();
        List<Product> listp = dao.getAllProductActive();
        List<Category> listc = catedao.getAllCategory();
        List<Supplier> listS = sDAO.getAllSupplierActive();
        for (Product o : listp) {
            if (o.getStock_quantity() == 0 && !(o.getProduct_status().equals("Ngừng bán"))) {
                dao.UpdateProduc_Statustoutofstock(o.getProduct_id());
            }
        }
        request.setAttribute("listP", listp);
        request.setAttribute("listC", listc);
        request.setAttribute("listS", listS);
        String path = request.getRequestURI();

        switch (path) {
            case "/PRJProject/manager":
                request.setAttribute("mana", "choose");
                request.getRequestDispatcher("/managerProduct.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/stopselling":

                request.setAttribute("stop", "choose");
                List<Product> Pstop = dao.getAllProductByAdstop();
                request.setAttribute("liststop", Pstop);
                request.getRequestDispatcher("/stopselling.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/ProductApproval":
                request.setAttribute("approval", "choose");
                List<Product> PApproval = dao.getAllProductByAdwait();
                request.setAttribute("listapproval", PApproval);
                request.getRequestDispatcher("/ProductApproval.jsp").forward(request, response);
                break;

            case "/PRJProject/manager/outofstock":
                request.setAttribute("outofstock", "choose");
                List<Product> listoutofstock = dao.getAllProductByAdoutofstock();
                request.setAttribute("listoutofstock", listoutofstock);
                request.getRequestDispatcher("/outofstock.jsp").forward(request, response);
                break;

            case "/PRJProject/manager/New":

                request.getRequestDispatcher("/themmoi.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/ShowOrder":
                orderDAO ordao = new orderDAO();
                List<Order> orderList = ordao.getAllOrder();
                request.setAttribute("ord", "choose");
                request.setAttribute("listOr", orderList);
                request.getRequestDispatcher("/showOrder.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/Account":
                accountDAO acdao = new accountDAO();
                List<Account> listA = acdao.getAllAccount();
                request.setAttribute("ac", "choose");
                request.setAttribute("listAc", listA);
                request.getRequestDispatcher("/managerAccount.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/Account/NewAccount":
                request.setAttribute("ac", "choose");
                request.getRequestDispatcher("/addAccount.jsp").forward(request, response);
                break;

            case "/PRJProject/manager/monthRevenue":
                orderDAO or = new orderDAO();
                List<Order> listRevenue = or.monthlyRevenue();
                request.setAttribute("mth", "choose");
                request.setAttribute("listRevenue", listRevenue);
                request.getRequestDispatcher("/MonthRevenue.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/top5Customer":
                customerDAO custdao = new customerDAO();
                List<Customer> listTop5cus = custdao.getTop5Customer();
                request.setAttribute("cus", "choose");
                request.setAttribute("listTop5cus", listTop5cus);
                request.getRequestDispatcher("/top5Cus.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/supplier":
                supplierDAO supDAO = new supplierDAO();
                List<Supplier> suplist = supDAO.getAllSupplier();
                request.setAttribute("supList", suplist);
                request.setAttribute("s", "choose");
                request.getRequestDispatcher("/ManageSupplier.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/supplier/NewSupplier":
                try {
                request.setAttribute("s", "choose");
                request.getRequestDispatcher("/AddSupplier.jsp").forward(request, response);
            } catch (Exception e) {
            }
            break;
            case "/PRJProject/manager/employee":
                EmployeeDAO eDAO = new EmployeeDAO();
                List<Employee> elist = eDAO.getAllEmployee();
                request.setAttribute("eList", elist);
                request.setAttribute("e", "choose");
                request.getRequestDispatcher("/ManageEmployee.jsp").forward(request, response);
                break;
            case "/PRJProject/manager/employee/NewEmployee":
                request.setAttribute("e", "choose");
                request.getRequestDispatcher("/AddEmoloyee.jsp").forward(request, response);
                break;

        }
        String[] s = path.split("/");
        String action = s[s.length - 2]; // lay sau dau "/"
        String pro_id = URLDecoder.decode(s[s.length - 1], "UTF-8");
        switch (action) {
            case "Edit":
                try {
                int pid = Integer.parseInt(pro_id);
                productDAO pdao = new productDAO();
                Product p = pdao.getProductByPID(pid);
                if (p == null) {
                    response.sendRedirect("/PRJProject/manager");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("IDProduct", p);
                    request.getRequestDispatcher("/update.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
            break;

            case "Delete":
//                try {
//                int PID = Integer.parseInt(pro_id);
//                HttpSession session = request.getSession();
//                Account acf = (Account) session.getAttribute("quantri");
//                productDAO daoDel = new productDAO();
//                commentDAO comdao = new commentDAO();
//                RatingDAO ratingDao = new RatingDAO();
//                FavoriteDAO fDAO = new FavoriteDAO();
//                orderdetailsDAO taildaoo = new orderdetailsDAO();
//                List<Comment> comments = comdao.selectListCommentOfProduct(PID);
//                for (Comment comment : comments) {
//                    comdao.DeleteCommentByPrimaryKey(comment.getComment_id());
//                }
//                fDAO.DeleteFavorites(acf.getAccount_id(), PID);
//                ratingDao.deleteRatingProductByProductId(PID);
//                taildaoo.DeleteDetailsByPID(PID);
//                daoDel.DeleteProduct(pro_id);
//
//                response.sendRedirect("/PRJProject/manager");
//            } catch (Exception ex) {
//
//            }
                
                try {
                int PID = Integer.parseInt(pro_id);
                HttpSession session = request.getSession();
                Account acf = (Account) session.getAttribute("quantri");
                productDAO daoDel = new productDAO();
                int kq = 0;
                kq = daoDel.DelProduct_ByUpdate(PID);
                response.sendRedirect("/PRJProject/manager/stopselling");
            } catch (Exception e) {
            }
            break;

            case "DeleteComment":
                int commentIdParam = Integer.parseInt(pro_id);
                if (commentIdParam != 0) {
                    productDAO pp = new productDAO();
                    commentDAO cmdao = new commentDAO();
                    int productId = pp.getProductIdByCommentId(commentIdParam);
                    Comment comment = cmdao.selectById(commentIdParam);
                    if (comment.isIs_reply()) {
                        cmdao.DeleteCommentByPrimaryKey(commentIdParam);
                    } else {
                        cmdao.DeleteAllCommentReply(commentIdParam);
                        cmdao.DeleteCommentByPrimaryKey(commentIdParam);
                    }
                    // After deletion, you can redirect or refresh the page to update the comment list.
                    String redirectUrl = "/PRJProject/manager/Info/" + productId;
                    response.sendRedirect(redirectUrl);
                }
                if (!response.isCommitted()) {
                    response.sendRedirect("newPage.jsp");
                } else {
                    // Xử lý hoặc ghi log lỗi nếu cần thiết
                }
                break;

            case "DeleteAccount":
                try {
                int ac_id = Integer.parseInt(pro_id);
                commentDAO commdao = new commentDAO();
                accountDAO aadao = new accountDAO();
                Account aa = aadao.getAccountByAcID(ac_id);
                commdao.DeleteCommentByUs(aa.getUsername());
                orderdetailsDAO taildao = new orderdetailsDAO();
                orderDAO ordao = new orderDAO();
                int or_id = ordao.getOrderByAC(ac_id);
                taildao.DeleteDetails(or_id);
                ordao.DeleteOrder(or_id);
                accountDAO daoac = new accountDAO();
                daoac.DeleteAccount(ac_id);
                response.sendRedirect("/PRJProject/manager/Account");
            } catch (Exception e) {
            }
            break;

            case "EditAccount":
                try {
                int ac_id = Integer.parseInt(pro_id);
                accountDAO adao = new accountDAO();
                Account ac = adao.getAccountByAcID(ac_id);
                HttpSession session = request.getSession();
                request.setAttribute("ac", "choose");
                session.setAttribute("checkS", ac.getIsSell());
                session.setAttribute("checkA", ac.getIsAdmin());
                session.setAttribute("EditAC", ac);
                request.getRequestDispatcher("/editAccountByAD.jsp").forward(request, response);
            } catch (Exception e) {
            }
            break;

            case "Info":
                try {
                productDAO daoInfo = new productDAO();
                int pid = Integer.parseInt(pro_id);
                Product pInfo = daoInfo.getProductByPID(pid);
                if (pInfo == null) {
                    response.sendRedirect("/listProduct");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("InfoProduct", pInfo);
                    request.setAttribute("mana", "choose");
                    request.getRequestDispatcher("/info.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
            }
            break;

            case "Comment":
                try {
                int id = Integer.parseInt(pro_id);

                commentDAO comdaooo = new commentDAO();

                Comment c = comdaooo.getCommentById(id);

                request.setAttribute("cm", c);
                HttpSession session = request.getSession();
                session.setAttribute("CMT", id);
                request.getRequestDispatcher("/updateComment.jsp").forward(request, response);

            } catch (NumberFormatException e) {
            }
            break;

            case "Details":
              try {
                int detailID = Integer.parseInt(pro_id);
                productDAO POdao = new productDAO();

                orderdetailsDAO dtdao = new orderdetailsDAO();
                List<OrderDeltail> detailList = dtdao.getOrderdetailByOID(detailID);
                request.setAttribute("listTails", detailList);
                String proName = "";
                List<Product> adao = new ArrayList<>();
                for (int i = 0; i < detailList.size(); i++) {
                    Product ppdao = POdao.getProductByPID(detailList.get(i).getProduct_id());
                    adao.add(ppdao);
                }
                HttpSession session = request.getSession();
                request.setAttribute("ord", "choose");
                session.setAttribute("proID", pro_id);
                request.setAttribute("infoProduct", adao);
                request.getRequestDispatcher("/showOrderDetails.jsp").forward(request, response);
                break;
            } catch (Exception e) {
            }

            case "EditStatus":
                try {
                int oid = Integer.parseInt(pro_id);
                orderDAO odao = new orderDAO();
                orderdetailsDAO dtailDAO = new orderdetailsDAO();
                List<Order> ord = odao.getOrderByID(oid);
                List<OrderDeltail> ordetail = dtailDAO.getOrderdetailByOID(oid);
                if (ord == null) {
                    response.sendRedirect("/PRJProject/manager/ShowOrder");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("IDOrd", ord);
                    request.setAttribute("checkS", ord.get(0).getOrder_status());
                    request.setAttribute("Otail", ordetail);
                    request.getRequestDispatcher("/updateStatusOrd.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
            break;

            case "EditSupplier":
                try {
                int supID = Integer.parseInt(pro_id);
                supplierDAO supdao = new supplierDAO();
                Supplier sup = supdao.getSupplierBySID(supID);
                HttpSession session = request.getSession();
                session.setAttribute("Sup", sup);
                request.setAttribute("s", "choose");
                request.getRequestDispatcher("/EditSupplier.jsp").forward(request, response);
            } catch (Exception e) {
            }
            break;

            case "DeleteSupplier":
                try {
                int supID = Integer.parseInt(pro_id);
                supplierDAO supdao = new supplierDAO();
                supdao.DeleteSupplier(supID);
                request.setAttribute("s", "choose");
                response.sendRedirect("/PRJProject/manager/supplier");
            } catch (Exception e) {
            }
            break;

            case "DeleteEmployee":
                try {
                int empID = Integer.parseInt(pro_id);
                EmployeeDAO empDAO = new EmployeeDAO();
                empDAO.DeleteEmployee(empID);
                request.setAttribute("e", "choose");
                response.sendRedirect("/PRJProject/manager/employee");
            } catch (Exception e) {
            }
            break;

            case "EditEmployee":
                try {
                int ac_id = Integer.parseInt(pro_id);
                accountDAO adao = new accountDAO();
                EmployeeDAO edao = new EmployeeDAO();
                Employee e = edao.getEmployeeByAcID(ac_id);
                Account ac = adao.getAccountByAcID(ac_id);
                HttpSession session = request.getSession();
                request.setAttribute("e", "choose");
                session.setAttribute("EditEmp", e);
                session.setAttribute("EditAC", ac);
                request.getRequestDispatcher("/UpdateEmployee.jsp").forward(request, response);
            } catch (Exception e) {
            }
            break;

            case "fileExcel":
              try {
                // tao workbook moi 
                Workbook workbook = new XSSFWorkbook();

                // Tạo một trang tính mới 
                Sheet sheet = workbook.createSheet("Hóa đơn");

                Row headerRow = sheet.createRow(0);
                headerRow.createCell(0).setCellValue("Họ và Tên");
                headerRow.createCell(1).setCellValue("Tên Sản Phẩm");
                headerRow.createCell(2).setCellValue("Màu Sắc");
                headerRow.createCell(3).setCellValue("Đơn Giá");
                headerRow.createCell(4).setCellValue("Số Lượng");
                headerRow.createCell(5).setCellValue("Tổng");

                int rowCount = 1; // bat dau tu dong thu 2 (sau dong tieu de)
                try {
                    int detailID = Integer.parseInt(pro_id);
                    customerDAO cusdao = new customerDAO();
                    int cusid = cusdao.getCustomerIDByOR(detailID);
                    double total = 0;
                    String cusname = cusdao.getCustomerNameByID(cusid);
                    productDAO POdao = new productDAO();

                    orderdetailsDAO dtdao = new orderdetailsDAO();
                    List<OrderDeltail> detailList = dtdao.getOrderdetailByOID(detailID);
                    request.setAttribute("listTails", detailList);
                    String proName = "";
                    List<Product> adao = new ArrayList<>();
                    for (int i = 0; i < detailList.size(); i++) {
                        Product ppdao = POdao.getProductByPID(detailList.get(i).getProduct_id());
                        adao.add(ppdao);
                    }
                    for (int i = 0; i < detailList.size(); i++) {
                        Row row = sheet.createRow(rowCount++);
                        row.createCell(0).setCellValue(cusname);
                        row.createCell(1).setCellValue(adao.get(i).getProduct_name());
                        row.createCell(2).setCellValue(adao.get(i).getProduct_color());
                        row.createCell(3).setCellValue(adao.get(i).getPrice());
                        row.createCell(4).setCellValue(detailList.get(i).getQuantity());
                        double totalPrice = adao.get(i).getPrice() * detailList.get(i).getQuantity();
                        total += totalPrice;
                    }
                    Row totalRow = sheet.createRow(rowCount++);
                    Cell totalCell = totalRow.createCell(5);
                    totalCell.setCellValue(total);
                    // ghi file
                    try {
                        LocalDate curdate = LocalDate.now();
                        String date = curdate.toString();
                        String filePath = "C:\\Users\\Admin\\Documents\\HoaDonWebBanGiay\\" + date + "_" + detailID + "hoadon.xlsx";
                        FileOutputStream fileOut = new FileOutputStream(filePath);
                        workbook.write(fileOut);
                        fileOut.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("proID", pro_id);
                    request.setAttribute("infoProduct", adao);
                    request.setAttribute("messAdd", "Xuất dữ liệu sang File Excel Thành Công");
                    request.setAttribute("ord", "choose");
                    request.getRequestDispatcher("/showOrderDetails.jsp").forward(request, response);
                } catch (Exception e) {
                }
            } catch (Exception e) {
            }
        }

//        request.getRequestDispatcher("/managerProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("Add")) {
            try {
                String product_name = request.getParameter("pro_name");
                int stock_quantity = Integer.parseInt(request.getParameter("pro_quan"));
                int price = Integer.parseInt(request.getParameter("pro_price"));
                Part part = request.getPart("pro_pic");
                String fileName = part.getSubmittedFileName();
                if (!(fileName.endsWith(".jpg") || fileName.endsWith(".png") || fileName.endsWith(".webp"))) {
                    productDAO dao = new productDAO();
                    categoryDAO catedao = new categoryDAO();
                    List<Product> listp = dao.getAllProduct();
                    List<Category> listc = catedao.getAllCategory();

                    request.setAttribute("listP", listp);
                    request.setAttribute("listC", listc);
                    String path = request.getRequestURI();
                    request.setAttribute("mes", "Vui lòng chọn file có đuôi .jpg, png hoặc webp");
                    request.getRequestDispatcher("/managerProduct.jsp").forward(request, response);
                    return;
                }
                String uploadPath = "D:\\PRJ301\\PRJProject\\src\\main\\webapp\\" + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                String filePath = uploadPath + "/" + fileName;
                part.write(filePath);
                String product_pic = "/PRJProject/images" + "/" + fileName;
                String des = request.getParameter("pro_des");
                String product_color = request.getParameter("pro_color");
                String product_status = request.getParameter("pro_status");
                int supplier_id = Integer.parseInt(request.getParameter("supplier"));
                int category_id = Integer.parseInt(request.getParameter("category"));
                productDAO dao = new productDAO();
                Product p = new Product(product_name, product_pic, product_color, price, stock_quantity, des, category_id, supplier_id);
                int kq = dao.AddNewProduct(p);
                if (kq != 0) {
                    response.sendRedirect("/PRJProject/manager/ProductApproval");
                } else {
                    response.sendRedirect("/PRJProject/manager/New");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //update
        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("Update")) {
            try {
                HttpSession session = request.getSession();
                Product pid = (Product) session.getAttribute("IDProduct");
                String product_name = request.getParameter("pro_name");
                String product_status = request.getParameter("pro_status");
                int stock_quantity = Integer.parseInt(request.getParameter("pro_quan"));
                int price = Integer.parseInt(request.getParameter("pro_price"));
                Part part = request.getPart("pro_pic");
                String fileName = part.getSubmittedFileName();

                String product_pic = pid.getProduct_pic();
                if (fileName != null && !fileName.isEmpty()) {

                    if (!(fileName.endsWith(".jpg") || fileName.endsWith(".png") || fileName.endsWith(".webp"))) {
                        productDAO dao = new productDAO();
                        categoryDAO catedao = new categoryDAO();
                        List<Product> listp = dao.getAllProduct();
                        List<Category> listc = catedao.getAllCategory();

                        request.setAttribute("listP", listp);
                        request.setAttribute("listC", listc);
                        String path = request.getRequestURI();
                        request.setAttribute("mes", "Vui lòng chọn file có đuôi .jpg, png hoặc webp");
                        try {
                            productDAO pdao = new productDAO();
                            Product p = pdao.getProductByPID(pid.getProduct_id());
                            if (p == null) {
                                response.sendRedirect("/PRJProject/manager");
                            } else {
                                session.setAttribute("IDProduct", pid);
                                request.getRequestDispatcher("/update.jsp").forward(request, response);
                            }
                        } catch (Exception e) {
                        }
                        request.getRequestDispatcher("/update.jsp").forward(request, response);
                        return;
                    }

                    String uploadPath = "D:\\PRJ301\\PRJProject\\src\\main\\webapp\\" + "images";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }
                    String filePath = uploadPath + "/" + fileName;
                    part.write(filePath);
                    product_pic = "/PRJProject/images" + "/" + fileName;
                }

                String des = request.getParameter("pro_des");
                String product_color = request.getParameter("pro_color");
                int category_id = Integer.parseInt(request.getParameter("category"));
                productDAO dao = new productDAO();
                boolean checkupdate = true;
                if (product_status.isEmpty()) {
                    product_status = pid.getProduct_status();
                }

                if (product_status.equals("Chờ duyệt") && stock_quantity == 0) {
                    if (pid.getProduct_status().equals("Hết hàng")) {
                        request.setAttribute("checkerr", "Bạn chưa cập nhật lại số lượng sản phẩm trong kho");
                        categoryDAO catedao = new categoryDAO();
                        List<Category> listc = catedao.getAllCategory();
                        try {
                            Product pp = dao.getProductByPID(pid.getProduct_id());
                            if (pp != null) {
                                checkupdate = false;
                                request.setAttribute("listC", listc);
                                session.setAttribute("IDProduct", pp);
                                request.getRequestDispatcher("/update.jsp").forward(request, response);
                            }
                        } catch (Exception ex) {
                        }
                    }
                }
                if (product_status.equals("Đang hoạt động") && stock_quantity == 0) {
                    if (pid.getProduct_status().equals("Hết hàng")) {
                        request.setAttribute("checkerr", "Bạn chưa cập nhật lại số lượng sản phẩm trong kho");
                        try {
                            categoryDAO catedao = new categoryDAO();
                            List<Category> listc = catedao.getAllCategory();
                            Product pp = dao.getProductByPID(pid.getProduct_id());
                            if (pp != null) {
                                checkupdate = false;
                                session.setAttribute("IDProduct", pp);
                                request.setAttribute("listC", listc);
                                request.getRequestDispatcher("/update.jsp").forward(request, response);
                            }
                        } catch (Exception ex) {
                        }
                    }
                }

                if (product_status.equals("Chờ duyệt") && stock_quantity == 0) {
                    request.setAttribute("checkerr", "Bạn chưa cập nhật lại số lượng sản phẩm trong kho");
                    categoryDAO catedao = new categoryDAO();
                    List<Category> listc = catedao.getAllCategory();
                    try {
                        Product pp = dao.getProductByPID(pid.getProduct_id());
                        if (pp != null) {
                            checkupdate = false;
                            request.setAttribute("listC", listc);
                            session.setAttribute("IDProduct", pp);
                            request.getRequestDispatcher("/update.jsp").forward(request, response);
                        }
                    } catch (Exception ex) {
                    }
                }

                if (product_status.equals("Đang hoạt động") && stock_quantity == 0) {
                    request.setAttribute("checkerr", "Bạn chưa cập nhật lại số lượng sản phẩm trong kho");
                    try {
                        categoryDAO catedao = new categoryDAO();
                        List<Category> listc = catedao.getAllCategory();
                        Product pp = dao.getProductByPID(pid.getProduct_id());
                        if (pp != null) {
                            checkupdate = false;
                            session.setAttribute("IDProduct", pp);
                            request.setAttribute("listC", listc);
                            request.getRequestDispatcher("/update.jsp").forward(request, response);
                        }
                    } catch (Exception ex) {
                    }
                }

                Product p = new Product(pid.getProduct_id(), product_name, product_pic, product_color, price, stock_quantity, des, category_id, product_status);
                int kq = 0;
                if (checkupdate) {
                    kq = dao.UpdateProduct(p);
                }
                if (kq != 0) {
                    if (product_status.equals("Chờ duyệt")) {

                        response.sendRedirect("/PRJProject/manager/ProductApproval");
                    }
                    if (product_status.equals("Ngừng bán")) {
                        response.sendRedirect("/PRJProject/manager/stopselling");
                    }
                    if (product_status.equals("Hết hàng")) {
                        dao.UpdateProductoutofstock(pid.getProduct_id());
                        response.sendRedirect("/PRJProject/manager/outofstock");
                    }
                    response.sendRedirect("/PRJProject/manager");
                } else {
                    response.sendRedirect("/PRJProject/manager/edit/" + pid.getProduct_id());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("addAdmin")) {
            try {
                int kq = 0;
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                String re_pass = request.getParameter("re_pass");
                String email = request.getParameter("email");
                String check = request.getParameter("check");
                int partCheck = Integer.parseInt(check);
                String phone = request.getParameter("phone");
                String fullname = request.getParameter("fullname");
                int checkname = 0;
                accountDAO acdao = new accountDAO();
                List<Account> list = acdao.getAllAccount();
                for (Account o : list) {
                    if (o.getUsername().equals(user)) {
                        checkname = 1;
                    }
                }
                if (checkname == 1) {
                    request.setAttribute("messCPF", "Tên đăng nhập đã tồn tại");
                    request.setAttribute("ac", "choose");
                    request.getRequestDispatcher("addAccount.jsp").forward(request, response);
                }
                if (re_pass.equals(pass)) {

                    if (partCheck == 1) {
                        Account ac = new Account(user, getMD5Hash(pass), phone, email, 0, 1, fullname);
                        accountDAO dao = new accountDAO();
                        kq = dao.addAccountByAdmin(ac);
                    } else {
                        if (partCheck == 0) {
                            Account ac = new Account(user, getMD5Hash(pass), phone, email, 1, 0, fullname);
                            accountDAO dao = new accountDAO();
                            kq = dao.addAccountByAdmin(ac);
                        }
                    }

                    if (kq != 0) {
                        request.setAttribute("messAdd", "Xin chúc mừng! bạn đã cập nhật tài khoản thành công.");
                        response.sendRedirect("/PRJProject/manager/Account");
                    } else {
                        request.setAttribute("messCPF", "Đăng ký tài khoản thất bại");
                        request.setAttribute("ac", "choose");
                        request.getRequestDispatcher("addAccount.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("messCPF", "Nhập lại! Mật khẩu không đúng.");
                    request.setAttribute("ac", "choose");
                    request.getRequestDispatcher("addAccount.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
        }
        //updateByAD
        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("editAccountByAD")) {
            try {
                int kq = 0;
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                String re_pass = request.getParameter("re_pass");
                String email = request.getParameter("email");
                String check = request.getParameter("check");
                int partCheck = Integer.parseInt(check);
                String phone = request.getParameter("phone");
                String fullname = request.getParameter("fullname");
                String status = request.getParameter("status");
                boolean Status = true;
                if (status.equals("1")) {
                    Status = true;
                }
                if (status.equals("0")) {
                    Status = false;
                }
                int checkname = 0;
                HttpSession session = request.getSession();
                Account ad = (Account) session.getAttribute("EditAC");
                accountDAO acdao = new accountDAO();
                List<Account> list = acdao.getAllAccount();
                for (Account o : list) {
                    if (o.getUsername().equals(user)) {
                        checkname = 1;
                    }
                }
                if (user.equals(ad.getUsername())) {
                    checkname = 0;
                }
                if (checkname == 1) {
                    request.setAttribute("messCPF", "Tên đăng nhập đã tồn tại");
                    request.setAttribute("ac", "choose");
                    request.getRequestDispatcher("editAccountByAD.jsp").forward(request, response);
                }
                if (re_pass.equals(pass)) {

                    if (partCheck == 1) {
                        if (re_pass.isEmpty() || pass.isEmpty()) {
                            pass = ad.getPassword();
                            Account ac = new Account(ad.getAccount_id(), user, pass, phone, email, 0, 1, fullname, Status);
                            accountDAO dao = new accountDAO();
                            kq = dao.UpdateAccountByAD(ac);
                        } else {
                            Account ac = new Account(ad.getAccount_id(), user, getMD5Hash(pass), phone, email, 0, 1, fullname, Status);
                            accountDAO dao = new accountDAO();
                            kq = dao.UpdateAccountByAD(ac);
                        }

                    } else {
                        if (partCheck == 0) {
                            if (re_pass.isEmpty() || pass.isEmpty()) {
                                pass = ad.getPassword();
                                Account ac = new Account(ad.getAccount_id(), user, pass, phone, email, 1, 0, fullname, Status);
                                accountDAO dao = new accountDAO();
                                kq = dao.UpdateAccountByAD(ac);
                            } else {
                                Account ac = new Account(ad.getAccount_id(), user, getMD5Hash(pass), phone, email, 1, 0, fullname, Status);
                                accountDAO dao = new accountDAO();
                                kq = dao.UpdateAccountByAD(ac);
                            }
                        }
                    }

                    if (kq != 0) {
                        request.setAttribute("messAdd", "Xin chúc mừng! bạn đã cập nhật tài khoản thành công.");
                        response.sendRedirect("/PRJProject/manager/Account");
                    } else {
                        request.setAttribute("messCPF", "Cập nhật tài khoản thất bại");
                        request.setAttribute("ac", "choose");
                        request.getRequestDispatcher("editAccountByAD.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("messCPF", "Nhập lại! Mật khẩu không đúng.");
                    request.setAttribute("ac", "choose");
                    request.getRequestDispatcher("editAccountByAD.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
        }

        //EditComment
        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("EditCommentByAD")) {
            try {
                HttpSession session = request.getSession();
                int id = (int) session.getAttribute("CMT");

//                String id = request.getParameter("updateId");
//                int cmtid = Integer.parseInt(id);
                String commentText = request.getParameter("commentText");

                commentDAO d = new commentDAO();
                productDAO p = new productDAO();
                int productId = p.getProductIdByCommentId(id);
                d.UpdateCommentText(id, commentText);
                response.sendRedirect("/PRJProject/manager/Info/" + productId);
            } catch (Exception e) {
            }
        }

        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("Update Status")) {
            try {
                HttpSession session = request.getSession();
                List<Order> or = (List<Order>) session.getAttribute("IDOrd");
                String status = request.getParameter("category");
                orderDAO ordao = new orderDAO();
                int kq = 0;
                kq = ordao.UpdateStatus(status, or.get(0).getOrder_id());
                if (kq != 0) {
                    response.sendRedirect("/PRJProject/manager/ShowOrder");
                } else {
                    response.sendRedirect("/PRJProject/manager");
                }
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }

        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("UpdateSupplier")) {
            try {
                String sup_name = request.getParameter("sup_name");
                String sup_address = request.getParameter("sup_address");
                String sup_phone = request.getParameter("sup_phone");
                String sup_email = request.getParameter("sup_email");
                String sup_status = request.getParameter("sup_status");
                HttpSession session = request.getSession();
                Supplier sup = (Supplier) session.getAttribute("Sup");
                boolean status = false;
                if (sup_status.equals("1")) {
                    status = true;
                }

                supplierDAO supDAO = new supplierDAO();
                Supplier suppp = new Supplier(sup.getSupplier_id(), sup_name, sup_address, sup_phone, sup_email, status);
                int kq = 0;
                kq = supDAO.UpdateSupplier(suppp);
                if (kq != 0) {
                    response.sendRedirect("/PRJProject/manager/supplier");
                }
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }

        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("AddSupplier")) {
            try {
                String sup_name = request.getParameter("sup_name");
                String sup_address = request.getParameter("sup_address");
                String sup_phone = request.getParameter("sup_phone");
                String sup_email = request.getParameter("sup_email");
                String sup_status = request.getParameter("sup_status");
                HttpSession session = request.getSession();
                supplierDAO supDAO = new supplierDAO();
                Supplier suppp = new Supplier(sup_name, sup_address, sup_phone, sup_email, true);
                int kq = 0;
                kq = supDAO.addSupplierByAdmin(suppp);
                response.sendRedirect("/PRJProject/manager/supplier");
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }

        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("addEmoloyee")) {
            try {
                int kq = 0;
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                String re_pass = request.getParameter("re_pass");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String fullname = request.getParameter("fullname");
                String emp_status = request.getParameter("emp_status");
                String emp_position = request.getParameter("emp_position");
                int checkname = 0;
                accountDAO acdao = new accountDAO();
                List<Account> list = acdao.getAllAccount();
                for (Account o : list) {
                    if (o.getUsername().equals(user)) {
                        checkname = 1;
                    }
                }
                if (checkname == 1) {
                    request.setAttribute("messCPF", "Tên đăng nhập đã tồn tại");
                    request.setAttribute("e", "choose");
                    request.getRequestDispatcher("AddEmoloyee.jsp").forward(request, response);
                }
                if (re_pass.equals(pass)) {
                    Account ac = new Account(user, getMD5Hash(pass), phone, email, 1, 0, fullname);
                    EmployeeDAO edao = new EmployeeDAO();
                    kq = edao.addEmployee(ac, emp_position, emp_status);
                    if (kq != 0) {
                        request.setAttribute("messAdd", "Xin chúc mừng! bạn đã cập nhật tài khoản thành công.");
                        response.sendRedirect("/PRJProject/manager/employee");
                    } else {
                        request.setAttribute("messCPF", "Đăng ký tài khoản thất bại");
                        request.setAttribute("e", "choose");
                        request.getRequestDispatcher("AddEmoloyee.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("messCPF", "Nhập lại! Mật khẩu không đúng.");
                    request.setAttribute("e", "choose");
                    request.getRequestDispatcher("AddEmoloyee.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
        }

        //updateByAD
        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("UpdateEmoloyee")) {
            try {
                int kq = 0;
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                String re_pass = request.getParameter("re_pass");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String fullname = request.getParameter("fullname");
                String emp_status = request.getParameter("emp_status");
                String emp_position = request.getParameter("emp_position");
                int checkname = 0;
                HttpSession session = request.getSession();
                Account ad = (Account) session.getAttribute("EditAC");
                accountDAO acdao = new accountDAO();
                List<Account> list = acdao.getAllAccount();
                for (Account o : list) {
                    if (o.getUsername().equals(user)) {
                        checkname = 1;
                    }
                }
                if (user.equals(ad.getUsername())) {
                    checkname = 0;
                }
                if (checkname == 1) {
                    request.setAttribute("messCPF", "Tên đăng nhập đã tồn tại");
                    request.setAttribute("e", "choose");
                    request.getRequestDispatcher("UpdateEmployee.jsp").forward(request, response);
                }
                if (re_pass.equals(pass)) {
                    if (re_pass.isEmpty() || pass.isEmpty()) {
                        pass = ad.getPassword();
                        if (emp_status.equals("Nghỉ việc")) {
                            Account ac = new Account(ad.getAccount_id(), user, pass, phone, email, 1, 0, fullname, false);
                            EmployeeDAO edao = new EmployeeDAO();
                            kq = edao.UpdateEmoloyee(ac, emp_position, emp_status);
                        } else {
                            Account ac = new Account(ad.getAccount_id(), user, pass, phone, email, 1, 0, fullname, ad.isStatus());
                            EmployeeDAO edao = new EmployeeDAO();
                            kq = edao.UpdateEmoloyee(ac, emp_position, emp_status);
                        }
                    } else {
                        if (emp_status.equals("Nghỉ việc")) {
                            Account ac = new Account(ad.getAccount_id(), user, getMD5Hash(pass), phone, email, 1, 0, fullname, false);
                            EmployeeDAO edao = new EmployeeDAO();
                            kq = edao.UpdateEmoloyee(ac, emp_position, emp_status);
                        } else {
                            Account ac = new Account(ad.getAccount_id(), user, getMD5Hash(pass), phone, email, 1, 0, fullname, ad.isStatus());
                            EmployeeDAO edao = new EmployeeDAO();
                            kq = edao.UpdateEmoloyee(ac, emp_position, emp_status);
                        }
                    }

                    if (kq != 0) {
                        request.setAttribute("messAdd", "Xin chúc mừng! bạn đã cập nhật tài khoản thành công.");
                        response.sendRedirect("/PRJProject/manager/employee");
                    } else {
                        request.setAttribute("messCPF", "Cập nhật tài khoản thất bại");
                        request.setAttribute("e", "choose");
                        request.getRequestDispatcher("UpdateEmployee.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("messCPF", "Nhập lại! Mật khẩu không đúng.");
                    request.setAttribute("e", "choose");
                    request.getRequestDispatcher("UpdateEmployee.jsp").forward(request, response);
                }
            } catch (Exception e) {
            }
        }

    }

    private String getMD5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder hexString = new StringBuilder();

            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
