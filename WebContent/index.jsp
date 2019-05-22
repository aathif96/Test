<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<%@	page import = "com.test.models.Item" %>
<%@	page import = "javax.sql.*" %>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>index</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	
	<body>
		<jsp:include page="includes/item_modal.jsp" />
		<jsp:include page="includes/delete_modal.jsp" />
	
	<button type="button" class="btn btn-primary" onclick="openInsertModal()">Insert New</button>
	
	<%
	
		

		Item item = new Item();
		String itemsGrid = item.getItems();
		out.print(itemsGrid);
	
	%>


		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/validation.js"></script>
		
		<script>
		
			function editItem(){
				var id = $('#item_id').val();
				$('#editModal').modal('hide');
				$.ajax({
					url:'http://localhost:8080/Test/',
					type:'',
					data:'',
					success:function(response){
						console.log(response);
					},
					error:function(error){
						console.log(error.responseText);
					}
					
				});
				alert(id);
			}
			
			function deleteItem(){
				var id = $('#delete_id').val();
				$('#deleteModal').modal('hide');
				alert(id);
			}
			
			function openInsertModal(){
				$('#editModal').modal('show');
			}
			
			function openEditItem(id){
				$('#item_id').val(id);
				$('#editModal').modal('show');
			}
			
			function openDeleteItem(id){
				$('#delete_id').val(id);
				$('#deleteModal').modal('show');
			}
		</script>
	</body>
</html>