package com.fpoly.entitys;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {

    @Id
    @Column(name = "Email", columnDefinition = "nvarchar(50)")
    private String email;

    @Column(name = "Password", columnDefinition = "varchar(20)", nullable = false)
    private String password;

    @Column(name = "Role", columnDefinition = "bit")
    private boolean role;

    @OneToOne(mappedBy = "account")
    private Customer customer;
}
