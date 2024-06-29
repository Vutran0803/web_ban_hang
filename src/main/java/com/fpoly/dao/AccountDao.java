package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.entitys.Account;

public interface AccountDao extends JpaRepository<Account, String> {

    List<Account> findByEmail(String email);

    List<Account> findByRole(boolean role);
}
