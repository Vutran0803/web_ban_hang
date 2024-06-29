<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>Product Management</h1>

<form action="" method="post">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group">
					<label for="productName">Product Name:</label> <input value=""
						name="productName" type="text" class="form-control"
						id="productName">
				</div>
				<div class="form-group">
					<label for="productPrice">Price:</label> <input value=""
						name="productPrice" type="text" class="form-control"
						id="productPrice">
				</div>
				<div class="form-group">
					<label for="productQuantity">Quantity:</label> <input value=""
						name="productQuantity" type="text" class="form-control"
						id="productQuantity">
				</div>
				<div class="form-group">
					<label for="productImage">Image:</label> <input value=""
						name="productImage" type="file" class="form-control"
						id="productImage">
				</div>
				<div class="form-group">
					<label for="productDescription">Description:</label>
					<textarea name="productDescription" class="form-control"
						id="productDescription"></textarea>
				</div>
				<br>
				<div class="btn-group">
					<button formaction="/product/create" class="btn btn-info">Add</button>
					<button formaction="/product/update"
						class="btn btn-warning edit-btn">Update</button>
					<button formaction="/product/delete" class="btn btn-danger">Delete</button>
					<button formaction="/product/index" class="btn btn-success">Reset</button>
				</div>
			</div>
		</div>
	</div>
</form>

<!-- table -->
<table class="table">
	<thead>
		<tr>
			<th>Product Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Image</th>
			<th>Description</th>
			<th>Edit</th>
		</tr>
	</thead>
	<tbody>

		<tr>
			<td>Giay TA11</td>
			<td>449.000 VNĐ</td>
			<td>1000</td>
			<td><img src="/image/TA1.jpg" alt=""
				style="width: 100px; height: 80px;"></td>
			<td>TA11 PRO</td>
			<td>
				<button class="btn btn-info">
					<a href="/user1/edit/${item.getId()}"
						style="color: white; text-decoration: none;">Edit</a>
				</button>
			</td>
		</tr>

	</tbody>



</table>