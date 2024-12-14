package net.abccinema.model;

/**
 *
 * @author gavin
 */
public class movieinsert {

    private String id;
    private String name;
    private String imageName;
    private String description;
    private String startDate;
    private String endDate;
    private String[] timeSlots;
    private String genres;
    private String cast;
    private String directors;
    private String writers;
    private String producers;
    private String music;
    private String ticketPriceAdult;
    private String ticketPriceChild;

//    public movieinsert(String id, String name, String imageName, String description, String startDate, String endDate, String[] timeSlots, String genres, String cast, String directors, String writers, String producers, String music, String ticketPriceAdult, String ticketPriceChild) {
//        this.id = id;
//        this.name = name;
//        this.imageName = imageName;
//        this.description = description;
//        this.startDate = startDate;
//        this.endDate = endDate;
//        this.timeSlots = timeSlots;
//        this.genres = genres;
//        this.cast = cast;
//        this.directors = directors;
//        this.writers = writers;
//        this.producers = producers;
//        this.music = music;
//        this.ticketPriceAdult = ticketPriceAdult;
//        this.ticketPriceChild = ticketPriceChild;
//    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String[] getTimeSlots() {
        return timeSlots;
    }

    public void setTimeSlots(String[] timeSlots) {
        this.timeSlots = timeSlots;
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

    // Getter and Setter for Ticket Price (Child)
    public String getTicketPriceChild() {
        return ticketPriceChild;
    }

    public void setTicketPriceChild(String ticketPriceChild) {
        this.ticketPriceChild = ticketPriceChild;
    }
}
