<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Product Form</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans">

<!-- Container for the form -->
<div class="max-w-lg mx-auto p-8 bg-white shadow-lg rounded-lg mt-12">
    <h2 class="text-2xl font-bold text-center text-gray-700 mb-6">Enter Product Details</h2>

    <!-- Product Form -->
    <form id="productForm" class="space-y-6">
        <div>
            <label for="productName" class="block text-gray-600">Product Name:</label>
            <input type="text" id="productName" name="productName" required 
                   class="w-full p-3 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <label for="productPrice" class="block text-gray-600">Product Price:</label>
            <input type="number" id="productPrice" name="productPrice" required 
                   class="w-full p-3 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <button type="submit" 
                    class="w-full py-3 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
                Submit
            </button>
        </div>
    </form>

    <!-- Response Message -->
    <p id="responseMessage" class="text-center mt-4 text-lg font-semibold"></p>
</div>

<script>
    // Handle form submission using AJAX
    $("#productForm").on("submit", function(event) {
        event.preventDefault();  // Prevent default form submission

        // Get form data
        var formData = {
            productName: $("#productName").val(),
            productPrice: $("#productPrice").val()
        };

        // AJAX request to submit the form
        $.ajax({
            url: "/saveProducts",
            type: "POST",
            data: formData,
            success: function(response) {
                // Show success or failure message based on response
                if (response.success) {
                    $("#responseMessage").html("<p class='text-green-600'>Product uploaded successfully!</p>");
                } else {
                    $("#responseMessage").html("<p class='text-red-600'>Product not uploaded.</p>");
                }
            },
            error: function() {
                // Handle AJAX errors
                $("#responseMessage").html("<p class='text-red-600'>An error occurred while uploading the product.</p>");
            }
        });
    });
</script>

</body>
</html>
