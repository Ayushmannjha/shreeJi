package com.shreeJi.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shreeJi.entites.Products;
import java.util.List;


@Repository
public interface ProductsRepo extends JpaRepository<Products, Integer>{
List<Products> findByProductName(String productName);
List<Products> findAll();
}
