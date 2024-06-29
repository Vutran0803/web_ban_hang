package com.fpoly.entitys;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable {

    @Id
    @Column(name = "ProductID", columnDefinition = "nvarchar(20)", nullable = false)
    private String productID;

    @Column(name = "ProductName", columnDefinition = "nvarchar(50)", nullable = false)
    private String productName;

    @Column(name = "Content", columnDefinition = "nvarchar(100)", nullable = false)
    private String content;

    @Column(name = "Price", nullable = false)
    private double price;

    @Column(name = "CreateDate")
    @Temporal(TemporalType.DATE)
    private Date createDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CategoryID", nullable = false)
    private Category category;

    @Column(name = "Image", columnDefinition = "varchar(255)")
    private String image;

    @Column(name = "Image1", columnDefinition = "varchar(255)")
    private String image1;

    @Column(name = "Image2", columnDefinition = "varchar(255)")
    private String image2;

    @Column(name = "Image3", columnDefinition = "varchar(255)")
    private String image3;

    @Column(name = "PercentageDiscount", nullable = false)
    private int percentageDiscount;

    @Column(name = "Likes")
    private Integer likes;

    @Column(name = "Sold")
    private Integer sold;

    @Column(name = "Quantity")
    private Integer quantity;

    @Column(name = "Condition")
    private Boolean condition;
}
