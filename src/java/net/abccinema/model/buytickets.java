package net.abccinema.model;

public class buytickets {
    private int id;
    private String name;
    private String imageName;
    private String description;
    private String startDate;
    private String endDate;
    private String genres;
    private String cast;
    private String directors;
    private String writers;
    private String producers;
    private String music;
    private String ticketPriceAdult;
    private String ticketsPriceChild;


    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getTicketsPriceChild() {
        return ticketsPriceChild;
    }

    public void setTicketsPriceChild(String ticketsPriceChild) {
        this.ticketsPriceChild = ticketsPriceChild;
    }

//    @Override
//    public String toString() {
//        return "buytickets{" + "id=" + id + ", name=" + name + ", imageName=" + imageName + ", description=" + description + ", startDate=" + startDate + ", endDate=" + endDate + ", genres=" + genres + ", cast=" + cast + ", directors=" + directors + ", writers=" + writers + ", producers=" + producers + ", music=" + music + ", ticketPriceAdult=" + ticketPriceAdult + ", ticketsPriceChild=" + ticketsPriceChild + '}';
//    }
}
