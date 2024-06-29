package com.fpoly.entitys;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name="BillDetails")
public class BillDetail implements Serializable{
	@Id
	String BillDetailID;
	
	String BillID;
	
	String ProductID;
	
	@Column(name="CustomerName",columnDefinition = "nvarchar(50)")
	String CustomerName;
	
	String PhoneNumber;
	
	@Column(name="Address",columnDefinition = "nvarchar(50)")
	String Address;
	
	@Column(name="CategoryName",columnDefinition = "nvarchar(20)")
	String CategoryName;
	
	Double TotalPrice;
	
	Integer QuantityBuy;
	
	@ManyToOne @JoinColumn(name="BillID")
	Bill bill;
}
