package net.abccinema.model;

public class Movie {
    private int id;
    private String title;
    private String imageUrl;
    private String category;
    private String timeSlots;          // New field for time slots
    private double adultTicketPrice;   // New field for adult ticket price
    private double childTicketPrice;   // New field for child ticket price

    // Updated Constructor
    public Movie(int id, String title, String imageUrl, String category, String timeSlots, double adultTicketPrice, double childTicketPrice) {
        this.id = id;
        this.title = title;
        this.imageUrl = imageUrl;
        this.category = category;
        this.timeSlots = timeSlots;
        this.adultTicketPrice = adultTicketPrice;
        this.childTicketPrice = childTicketPrice;
    }

    public Movie(int aInt, String string, String string0, String string1) {
       
    }

    // Getters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getImageUrl() { return imageUrl; }
    public String getCategory() { return category; }
    public String getTimeSlots() { return timeSlots; }
    public double getAdultTicketPrice() { return adultTicketPrice; }
    public double getChildTicketPrice() { return childTicketPrice; }
}
