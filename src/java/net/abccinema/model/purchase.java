package net.abccinema.model;

/**
 * Model class for purchase details.
 */
public class purchase {

    private int id;
    private int userId;
    private String user_name;
    private String phoneNumber;
    private String user_email;
    private int adultTickets;
    private int childTickets;
    private double totalAmount;
    private String paymentMethod;
    private int m_id;
    private String m_timeslot;
    private String seat_numbers;

    // Constructor
    public purchase() {}

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int id) {
        this.userId = userId;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getAdultTickets() {
        return adultTickets;
    }

    public void setAdultTickets(int adultTickets) {
        this.adultTickets = adultTickets;
    }

    public int getChildTickets() {
        return childTickets;
    }

    public void setChildTickets(int childTickets) {
        this.childTickets = childTickets;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public String getM_timeslot() {
        return m_timeslot;
    }

    public void setM_timeslot(String m_timeslot) {
        this.m_timeslot = m_timeslot;
    }

    public String getSeat_numbers() {
        return seat_numbers;
    }

    public void setSeat_numbers(String seat_numbers) {
        this.seat_numbers = seat_numbers;
    }

    @Override
    public String toString() {
        return "purchase{" + "id=" + id + ", user_Id=" + userId + ", user_name=" + user_name + ", phoneNumber=" + phoneNumber + ", user_email=" + user_email + ", adultTickets=" + adultTickets + ", childTickets=" + childTickets + ", totalAmount=" + totalAmount + ", paymentMethod=" + paymentMethod + ", m_id=" + m_id + ", m_timeslot=" + m_timeslot + ", seat_numbers=" + seat_numbers + '}';
    }
}
