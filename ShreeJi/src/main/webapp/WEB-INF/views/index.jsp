<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.shreeJi.entites.Products" %>
<%@ page import = "java.util.*" %>
<% List<Products> products = (List)request.getAttribute("products"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Shreejji Shop</title>
  <link href="https://fonts.googleapis.com/css2?family=Baloo+2&family=Pacifico&family=Poppins&display=swap" rel="stylesheet">
  
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    function filterProducts() {
      var searchQuery = document.getElementById("searchInput").value.toLowerCase();
      var productCards = document.getElementsByClassName("product-card");
      
      for (var i = 0; i < productCards.length; i++) {
        var productName = productCards[i].getElementsByClassName("product-name")[0].textContent.toLowerCase();
        if (productName.includes(searchQuery)) {
          productCards[i].style.display = "block";
        } else {
          productCards[i].style.display = "none";
        }
      }
    }

    function submitSearch() {
      var searchQuery = document.getElementById("searchInput").value;
      // Make an AJAX request to the server with the search query
      var xhr = new XMLHttpRequest();
      xhr.open("GET", "/search?query=" + encodeURIComponent(searchQuery), true);
      xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
          // Update the product list with the response data
          document.getElementById("productList").innerHTML = xhr.responseText;
        }
      };
      xhr.send();
    }
  </script>
</head>
<body class="bg-gray-100">

  <!-- Navbar -->
  <nav class="bg-red-900 text-white p-4 flex items-center justify-start gap-2 shadow-md">
    <img src="./shreejilogo.png" alt="Shreejji Logo" class="h-10 w-10 mr-1">
    <span class="text-2xl font-bold">Shreejji</span>
  </nav>

  <div class="relative w-full h-60 bg-cover bg-center" style="background-image: url('./shreejji-shop.png');">
    <div class="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
      <h1 class="text-white text-4xl font-bold" style="font-family: 'Baloo 2', cursive;">Welcome to Shreejji Store!</h1>
    </div>
  </div>

  <!-- Search Bar -->
  <div class="p-4 flex justify-center">
    <input type="text" id="searchInput" placeholder="Search for a product..." class="w-full max-w-xl p-3 rounded-md border border-gray-300 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" onkeyup="filterProducts()"/>
    
  </div>

  <!-- Product List -->
  <div id="productList" class="p-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
    <%
      if (products != null && !products.isEmpty()) {
        for (Products p : products) {
    %>
      <div class="product-card bg-white rounded-xl shadow-md p-4 hover:shadow-lg transition">
        <h2 class="text-lg font-semibold product-name"><%= p.getProductName() %></h2>
        <p class="text-blue-700 font-bold">&#8377;<%= p.getProductPrice() %></p>
      </div>
    <%
        }
      } else {
    %>
      <div class="col-span-full text-center text-red-700 font-semibold text-xl">
        No items uploaded.
      </div>
    <%
      }
    %>
  </div>

</body>
</html>
