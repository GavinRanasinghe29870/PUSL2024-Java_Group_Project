package net.abccinema.model;

public class adminBooking {
    private int bookingId;
    private String name;
    private String phoneNumber;
    private String email;
    private int adultTickets;
    private int childTickets;
    private float totalAmount;
    private String paymentMethod;
    private int movieId;
    private String movieTimeSlot;
    private String seatNumbers;
    private String bookDate;

    public adminBooking() {}

    public adminBooking(int bookingId, String name, String phoneNumber, String email, int adultTickets, int childTickets, float totalAmount, String paymentMethod, int movieId, String movieTimeSlot, String seatNumbers, String bookDate) {
        this.bookingId = bookingId;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.adultTickets = adultTickets;
        this.childTickets = childTickets;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.movieId = movieId;
        this.movieTimeSlot = movieTimeSlot;
        this.seatNumbers = seatNumbers;
        this.bookDate = bookDate;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getMovieTimeSlot() {
        return movieTimeSlot;
    }

    public void setMovieTimeSlot(String movieTimeSlot) {
        this.movieTimeSlot = movieTimeSlot;
    }

    public String getSeatNumbers() {
        return seatNumbers;
    }

    public void setSeatNumbers(String seatNumbers) {
        this.seatNumbers = seatNumbers;
    }

    public String getBookDate() {
        return bookDate;
    }

    public void setBookDate(String bookDate) {
        this.bookDate = bookDate;
    }

    @Override
    public String toString() {
        return "adminBooking{" +
                "bookingId=" + bookingId +
                ", name='" + name + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", adultTickets=" + adultTickets +
                ", childTickets=" + childTickets +
                ", totalAmount=" + totalAmount +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", movieId=" + movieId +
                ", movieTimeSlot='" + movieTimeSlot + '\'' +
                ", seatNumbers='" + seatNumbers + '\'' +
                ", bookDate='" + bookDate + '\'' +
                '}';
    }
}
