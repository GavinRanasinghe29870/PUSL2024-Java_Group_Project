package net.abccinema.model;

/**
 *
 * @author kavis
 */
public class SeatBooking {
    
    private int movieID;
    private int seatID;
    private String showTime;
    private int userID;

    public SeatBooking() {
    }

    public SeatBooking(int movieID, int seatID, String showTime, int userID) {
        this.movieID = movieID;
        this.seatID = seatID;
        this.showTime = showTime;
        this.userID = userID;
    }

    public int getMovieID() {
        return movieID;
    }

    public int getSeatID() {
        return seatID;
    }

    public String getShowTime() {
        return showTime;
    }

    public int getUserID() {
        return userID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return "SeatBooking{" + "movieID=" + movieID + ", seatID=" + seatID + ", showTime=" + showTime + ", userID=" + userID + '}';
    }
    
    
}
