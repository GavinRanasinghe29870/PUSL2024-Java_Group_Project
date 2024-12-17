/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package net.abccinema.model;

/**
 *
 * @author dulit
 */
public class User {
    private int userId;
    private String fullName;
    private int age;
    private String username;
    private String password;
    private int phoneNumber;
    private String address;
    private String email;
    private String gender;

    public User() {
    }

    public User(int userId, String fullName, int age, String username, String password, int phoneNumber, String address, String email, String gender) {
        this.userId = userId;
        this.fullName = fullName;
        this.age = age;
        this.username = username;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
        this.gender = gender;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", fullName=" + fullName + ", age=" + age + ", username=" + username + ", password=" + password + ", phoneNumber=" + phoneNumber + ", address=" + address + ", email=" + email + ", gender=" + gender + '}';
    }

    
    
    
    
}
