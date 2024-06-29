 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Product Management</h1>

<form action="" method="post">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label for="id">Username:</label>
                    <input value="" name="id" type="text" class="form-control" id="id">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input value="" name="password" type="password" class="form-control" id="password" placeholder="Enter password">
                </div>
                <div class="form-group">
                    <label for="fullname">Fullname:</label>
                    <input value="" name="fullname" type="text" class="form-control" id="fullname">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input value="" name="email" type="email" class="form-control" id="email" placeholder="Enter email">
                </div>
                    <br>
                <div class="form-group">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="admin" id="admin1" ${form.getAdmin()?'checked':''} value="true">
                        <label class="form-check-label" for="admin1">Admin</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="admin" id="admin2" ${form.getAdmin()?'':'checked'} value="false">
                        <label class="form-check-label" for="admin2">User</label>
                    </div>
                </div>
                    <br>
                <div class="btn-group">
                    <button formaction="/user1/create" class="btn btn-info">Create</button>
                    <button formaction="/user1/update" class="btn btn-warning">Update</button>
                    <button formaction="/user1/delete" class="btn btn-danger">Delete</button>
                    <button formaction="/user1/index" class="btn btn-success">Reset</button>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- table -->
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>User</th>
            <th>Password</th>
            <th>Fullname</th>
            <th>Email</th>
            <th>Role</th>
            <th>Edit</th>
        </tr>
    </thead>
    <tbody>
    
            <tr>
                <td>001</td>
                <td>Vutran0803</td>
                <td>123</td>
                <td>Trần Quang Vũ</td>
                <td>quangvutran08032004@gmail.com</td>
                <td>admin</td>
                <td>
                  <button class="btn btn-info">
					<a href="/user1/edit/${item.getId()}"
						style="color: white; text-decoration: none;">Edit</a>
				</button>
            </tr>
      
    </tbody>
    </table>