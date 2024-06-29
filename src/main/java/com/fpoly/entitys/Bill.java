package com.fpoly.entitys;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name="Bills")
public class Bill implements Serializable{
	@Id
	String BillID;
	
	String CustomerID;
	
	@Temporal(TemporalType.DATE)
	@Column(name="CreateDate")
	Date CreateDate = new Date();
	
	@OneToMany(mappedBy="bill")
	List<BillDetail> billDetails;
}
