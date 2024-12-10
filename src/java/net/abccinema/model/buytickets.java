package net.abccinema.model;

/**
 *
 * @author gavin
 */
public class buytickets {

    private int id;
    private String name;
    private String description;
    private String imageName;
    private String timeSlots;
    private String startDate;
    private String endDate;
    private String genres;
    private String cast;
    private String directors;
    private String writers;
    private String producers;
    private String music;
    private String ticketPriceAdult;
    private String ticketPriceChild;

    public buytickets() {
        System.out.println("buytickets object created with default constructor");
    }

    public buytickets(int id, String Name, String Description, String imageName, String timeSlots, String StartDate, String EndDate, String genres, String cast, String directors, String writers, String producers, String music, String ticketPriceAdult, String ticketPriceChild) {
        this.id = id;
        this.name = Name;
        this.description = Description;
        this.imageName = imageName;
        this.timeSlots = timeSlots;
        this.startDate = StartDate;
        this.endDate = EndDate;
        this.genres = genres;
        this.cast = cast;
        this.directors = directors;
        this.writers = writers;
        this.producers = producers;
        this.music = music;
        this.ticketPriceAdult = ticketPriceAdult;
        this.ticketPriceChild = ticketPriceChild;

        System.out.println("buytickets object created with parameters: " + this.toString());
    }

    public int getId() {
        System.out.println("Setting id to: " + id);
        return id;
    }

    public void setId(int id) {
        System.out.println("Setting id to: " + id);
        this.id = id;
    }

    public String getName() {
        System.out.println("Getting Name: " + name);
        return name;
    }

    public void setName(String name) {
        System.out.println("Setting Name to: " + name);
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
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
        String result = "buytickets{" + "id=" + id + ", name=" + name + ", description=" + description + ", imageName=" + imageName + ", timeSlots=" + timeSlots + ", startDate=" + startDate + ", endDate=" + endDate + ", genres=" + genres + ", cast=" + cast + ", directors=" + directors + ", writers=" + writers + ", producers=" + producers + ", music=" + music + ", ticketPriceAdult=" + ticketPriceAdult + ", ticketPriceChild=" + ticketPriceChild + '}';
        System.out.println("toString called: " + result);
        return result;
    }

}
