/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package net.abccinema.model;

/**
 * Model class for Single Movie.
 * @author Vihanga
 */


public class singleMovie {
    private String name;
    private String movieDesc;
    private String imageURL;
    private String genres;
    private String stars;
    private String directors;
    private String writers;
    private String producers;
    private String music;

    
    public singleMovie(String name,String movieDesc,String imageURL,String genres,String stars,String directors,String writers,String producers,String music){
        this.name = name;
        this.movieDesc = movieDesc;
        this.imageURL = imageURL;
        this.genres = genres;
        this.stars = stars;
        this.directors = directors;
        this.writers = writers;
        this.producers = producers;
        this.music = music;
    }

//Getters and Setters
public String getName(){
    return name;    
}
public void setName(String name){
    this.name = name;
}
public String getMovieDesc(){
    return movieDesc;
}
public void setMovieDesc(String movieDesc){
    this.movieDesc = movieDesc;
}
public String getImageURL(){
    return imageURL;
}
public void setImageURL(String imageURL){
    this.imageURL = imageURL;
}
public String getGenres(){
    return genres;
}
public void setGenres(String genres){
    this.genres = genres;
}
public String getStars(){
    return stars;
}
public void setStars(String stars){
    this.stars = stars;
}
public String getDirectors(){
    return directors;
}
public void setDirectors(String directors){
    this.directors = directors;
}
public String getWriters(){
    return writers;
}
public void setWriters(String writers){
    this.writers = writers;
}
public String getProducers(){
    return producers;
}
public void setProducers(String producers){
    this.producers = producers;
}
public String getMusic(){
    return music;
}
public void setMusic(String music){
    this.music = music;
}

}