package net.abccinema.model;

/**
 *
 * @author MSI
 */
public class adminBooking {
    private int bookingId;
    private String name;
    private int adultSeat;
    private int childSeat;
    private String movieName;
    private float totalPrice;

    public adminBooking() {
    }

    public adminBooking(int bookingId, String name, int adultSeat, int childSeat, String movieName, float totalPrice) {
        this.bookingId = bookingId;
        this.name = name;
        this.adultSeat = adultSeat;
        this.childSeat = childSeat;
        this.movieName = movieName;
        this.totalPrice = totalPrice;
    }

    public int getBookingId() {
        return bookingId;
    }

    public String getName() {
        return name;
    }

    public int getAdultSeat() {
        return adultSeat;
    }

    public int getChildSeat() {
        return childSeat;
    }

    public String getMovieName() {
        return movieName;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAdultSeat(int adultSeat) {
        this.adultSeat = adultSeat;
    }

    public void setChildSeat(int childSeat) {
        this.childSeat = childSeat;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "adminBooking{" + "bookingId=" + bookingId + ", name=" + name + ", adultSeat=" + adultSeat + ", childSeat=" + childSeat + ", movieName=" + movieName + ", totalPrice=" + totalPrice + '}';
    }
    
    
}
