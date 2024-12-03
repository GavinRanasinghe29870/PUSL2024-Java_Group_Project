package net.abccinema.model;


public class Testimonials {
    
    private String fullName;
    private String message;
    private String rating;

    public Testimonials() {
    }

    public Testimonials(String fullName, String message, String rating) {
        this.fullName = fullName;
        this.message = message;
        this.rating = rating;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getFullName() {
        return fullName;
    }

    public String getMessage() {
        return message;
    }

    public String getRating() {
        return rating;
    }

    @Override
    public String toString() {
        return "Testimonials{" + "fullName=" + fullName + ", message=" + message + ", rating=" + rating + '}';
    }
    
}