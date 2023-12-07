/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author tolyh
 */
public class Account {
    private String userName;
    private String password;
    private String fullName;
    private float wallet;

    public Account() {
    }

    public Account(String userName, String password, String fullName, float wallet) {
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.wallet = wallet;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public float getWallet() {
        return wallet;
    }

    public void setWallet(float wallet) {
        this.wallet = wallet;
    }
    
    
}
