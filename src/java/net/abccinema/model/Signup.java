
package net.abccinema.model;

/**
 *
 * @author dulit
 */
public class Signup {
        private String fullName;
    private int age;
    private String username;
    private String password;
    private String rePassword;
    private String phoneNumber;
    private String address;
    private String email;
    private String gender;

    // Default Constructor
    public Signup() {
    }

    // Parameterized Constructor
    public Signup(String fullName, int age, String username, String password, String rePassword, 
                  String phoneNumber, String address, String email, String gender) {
        this.fullName = fullName;
        this.age = age;
        this.username = username;
        this.password = password;
        this.rePassword = rePassword;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
        this.gender = gender;
    }

    // Getters and Setters
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

    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
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
        return "Signup{" + "fullName=" + fullName + ", age=" + age + ", username=" + username + ", password=" + password + ", rePassword=" + rePassword + ", phoneNumber=" + phoneNumber + ", address=" + address + ", email=" + email + ", gender=" + gender + '}';
    }

    void setId(int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


}
