package com.shreeJi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shreeJi.entites.Products;
import com.shreeJi.services.ProductsServices;

@Controller
public class ProductController {
	@Autowired
	ProductsServices sr;
	
	@GetMapping("/")
	public String index(Model m){
		List<Products> products = sr.getAllProducts();
		if(products!=null) {
			m.addAttribute("products", products);
		}
		
		return "index";
	}
	@GetMapping("/upload")
	public String homes(){
		return "upload";
	}
	 @PostMapping("/saveProducts")
	    @ResponseBody
	    public Map<String, Object> saveProduct(@RequestParam("productName") String productName,
	                                           @RequestParam("productPrice") Double productPrice) {
	        Map<String, Object> response = new HashMap<>();
	        Products product = new Products();
	        product.setProductName(productName);
	        product.setProductPrice(productPrice);
	        // Call your service method to save the product
	         Products p = sr.saveProducts(product);

	        // Add success or failure message to the response map
	        if (p!=null) {
	            response.put("success", true);
	        } else {
	            response.put("success", false);
	        }

	        return response;  // Return the response as JSON
	    }
}
