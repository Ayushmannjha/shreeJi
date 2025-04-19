package com.shreeJi.entites;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="products")
@Setter
@Getter
public class Products {
@Id	
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;

private String productName;
private double productPrice;
}
