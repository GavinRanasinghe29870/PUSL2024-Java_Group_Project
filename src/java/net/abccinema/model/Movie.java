package net.abccinema.model;



public class Movie {
    private int id;
    private String title;
    private String imageUrl;
    private String category;

    public Movie(int id, String title, String imageUrl, String category) {
        this.id = id;
        this.title = title;
        this.imageUrl = imageUrl;
        this.category = category;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getImageUrl() { return imageUrl; }
    public String getCategory() { return category; }
}
