package com.fpoly.entitys;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Customers")
public class Customer implements Serializable {

	@Id
	@Column(name="CustomerID", columnDefinition = "nvarchar(50)")
	String CustomerID;
	
	@Column(name="CustomerName", columnDefinition = "nvarchar(50)")
	String CustomerName;
	
	String PhoneNumber;
	
	@Column(name="Address", columnDefinition = "nvarchar(50)")
	String Address;
	
	@Column(name="Email", columnDefinition = "nvarchar(50)")
	String Email;
	
	Integer Age;
	
	@OneToOne
	@JoinColumn(name= "Email")
	private Account account;
}
