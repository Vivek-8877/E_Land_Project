<%@page import="java.util.Collections"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user =(User) session.getAttribute("current-user");
    if(user==null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if(user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin !! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container admin">
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            <!--1st row-->
            <div class="row mt-2">
                <!--1st col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/users.png" alt="user"/>
                            </div>
                            <h1>12345</h1>
                            <h1 class="text-uppercase text-muted">User</h1>
                        </div>
                    </div>
                </div>
                
                <!--2nd col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/category.png" alt="user"/>
                            </div>
                            <h1>12345</h1>
                            <h1 class="text-uppercase text-muted">Category</h1>
                        </div>
                    </div>
                </div>
                
                <!--3rd col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/products.png" alt="user"/>
                            </div>
                            <h1>12345</h1>
                            <h1 class="text-uppercase text-muted">Product</h1>
                        </div>
                    </div>
                </div>
            </div>
            
            <!--2nd row-->
            <div class="row mt-2">
                
                <!--1st col-->
                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/add-category.png" alt="user"/>
                                <p class="mt-2">Click here to add new category</p>
                                <h1>Add Category</h1>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <!--2nd col-->
                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/add-product.png" alt="user"/>
                                <p class="mt-2">Click here to add new products</p>
                                <h1>Add Product</h1>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        <!-- add category modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                
                  <form action="ProductOperationServlet" method="post">
                      
                      <input type="hidden" name="operation" value="addcategory"/>
                      
                      <div class="form-group">
                          <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required=""/>
                      </div>
                      
                      <div class="form-group">
                          <textarea style="height:300px;" class="form-control" placeholder="Enter Category Discription" name="catDescription" required=""></textarea>
                      </div>
                      
                      <div class="container text-center">
                          <button class="btn btn-outline-success">Add Category</button>
                          <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
                      </div>
                      
                  </form>
                  
              </div>
            </div>
          </div>
        </div>
        <!--end category modal-->
        
        
        
        
        
        <!-- add product modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                
                  <form action="ProductOperationServlet" method="post">
                      
                      <input type="hidden" name="operation" value="addproduct"/>
                      
                      <div class="form-group">
                          <input type="text" class="form-control" name="productTitle" placeholder="Enter Product Name" required=""/>
                      </div>
                      
                      <div class="form-group">
                          <textarea style="height:150px;" class="form-control" placeholder="Enter Product Discription" name="productDescription" required=""></textarea>
                      </div>
                      
                      <div class="form-row">
                        <div class="form-group col-md-6">
                            <input type="number" class="form-control" id="inputEmail" name="productPrice" placeholder="Product Price" required="">
                        </div>
                          
                        <div class="form-group col-md-6">
                          <!--<label for="inputPassword4">Password</label>-->
                          <input type="number" class="form-control" id="inputPassword" name="productDiscount" placeholder="Product Discount" required="">
                        </div>
                      </div>
                      
                      
                      <div class="form-row">
                        <div class="form-group col-md-6">
                            <input type="number" class="form-control" id="inputPassword4" name="productQuantity" placeholder="Product Quantity" required="">
                        </div>
                          
                          
                        
                        <%
                        
                        CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                        List<Category> cList = cDao.getCategories();
//                        Collections.sort(cList,new Sortbyname());
                        
                        %>
                        <select class="form-control col-md-6" id="inlineFormCustomSelectPref" name="productCategoryID" required>
                            <option value="" selected>Choose Category type...</option>
                            <%
                            for(Category c : cList) {
                            %>
                                <option value="<%= c.getCategoryId() %>"> <%= c.getCategoryTitle() %></option>
                            <%
                            }
                            %>
<!--                            <option value="" selected>Choose Category type...</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>-->
                        </select>
                      </div>
                      
                      
                      <div class="form-group">
                        <label for="photo">Product Photo</label>
                        <input type="file" class="form-control-file" name="productPhoto" id="photo">
                      </div>
                      
                      
                      <div class="container text-center">
                          <button class="btn btn-outline-success">Add Product</button>
                          <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
                      </div>
                      
                  </form>
                  
              </div>
            </div>
          </div>
        </div>
        <!--end product modal-->
        
        
        
        
    </body>
</html>
