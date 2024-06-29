package com.fpoly.entitys;


import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable {

    @Id
    @Column(name = "CategoryID", columnDefinition = "nvarchar(20)")
    private String categoryID;

    @Column(name = "CategoryName", columnDefinition = "nvarchar(20)", nullable = false)
    private String categoryName;

    @OneToMany(mappedBy = "category")
    private List<Product> products;
}
