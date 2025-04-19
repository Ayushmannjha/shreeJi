package com.shreeJi.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shreeJi.entites.Products;
import com.shreeJi.repo.ProductsRepo;

@Service
public class ProductsServices {
@Autowired	
private ProductsRepo repo;

public Products saveProducts(Products product){
	return repo.save(product);
}
public  List<Products> getProducts(String product){
	return repo.findByProductName(product);
}
public List<Products> getAllProducts(){
	return repo.findAll();
}
}
