package net.abccinema.model;

/**
 *
 * @author gavin
 */
public class buytickets {

    private int id;
    private String Name;
    private String Description;
    private String imageName;
    private String timeSlots;
    private String StartDate;
    private String EndDate;
    private String genres;
    private String cast;
    private String directors;
    private String writers;
    private String producers;
    private String music;
    private String ticketPriceAdult;
    private String ticketPriceChild;

    public buytickets() {
    }

    public buytickets(int id, String Name, String Description, String imageName, String timeSlots, String StartDate, String EndDate, String genres, String cast, String directors, String writers, String producers, String music, String ticketPriceAdult, String ticketPriceChild) {
        this.id = id;
        this.Name = Name;
        this.Description = Description;
        this.imageName = imageName;
        this.timeSlots = timeSlots;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
        this.genres = genres;
        this.cast = cast;
        this.directors = directors;
        this.writers = writers;
        this.producers = producers;
        this.music = music;
        this.ticketPriceAdult = ticketPriceAdult;
        this.ticketPriceChild = ticketPriceChild;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getTimeSlots() {
        return timeSlots;
    }

    public void setTimeSlots(String timeSlots) {
        this.timeSlots = timeSlots;
    }

    public String getStartDate() {
        return StartDate;
    }

    public void setStartDate(String StartDate) {
        this.StartDate = StartDate;
    }

    public String getEndDate() {
        return EndDate;
    }

    public void setEndDate(String EndDate) {
        this.EndDate = EndDate;
    }

    public String getGenres() {
        return genres;
    }

    public void setGenres(String genres) {
        this.genres = genres;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getDirectors() {
        return directors;
    }

    public void setDirectors(String directors) {
        this.directors = directors;
    }

    public String getWriters() {
        return writers;
    }

    public void setWriters(String writers) {
        this.writers = writers;
    }

    public String getProducers() {
        return producers;
    }

    public void setProducers(String producers) {
        this.producers = producers;
    }

    public String getMusic() {
        return music;
    }

    public void setMusic(String music) {
        this.music = music;
    }

    public String getTicketPriceAdult() {
        return ticketPriceAdult;
    }

    public void setTicketPriceAdult(String ticketPriceAdult) {
        this.ticketPriceAdult = ticketPriceAdult;
    }

    public String getTicketPriceChild() {
        return ticketPriceChild;
    }

    public void setTicketPriceChild(String ticketPriceChild) {
        this.ticketPriceChild = ticketPriceChild;
    }

    @Override
    public String toString() {
        return "buytickets{" + "id=" + id + ", Name=" + Name + ", Description=" + Description + ", imageName=" + imageName + ", timeSlots=" + timeSlots + ", StartDate=" + StartDate + ", EndDate=" + EndDate + ", genres=" + genres + ", cast=" + cast + ", directors=" + directors + ", writers=" + writers + ", producers=" + producers + ", music=" + music + ", ticketPriceAdult=" + ticketPriceAdult + ", ticketPriceChild=" + ticketPriceChild + '}';
    }

    
}
