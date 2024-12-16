/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package net.abccinema.model;

/**
 * Model class for Single Movie.
 * @author Vihanga
 */

//Declaration of a class
public class singleMovie {
  
    private int id;
    private String name;
    private String imageName;
    private String description;
    private String genres;
    private String cast;
    private String directors;
    private String writers;
    private String producers;
    private String music;
//Getters and Setters
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



//    @Override
//    public String toString() {
//        String result = "singleMovie [ name=" + name + 
//               ", movieDes=" + movieDes + ", imageURL=" + imageURL + 
//               ", genre1=" + genre1 + ", genre2=" + genre2 + ", genre3=" + genre3 + ", genre4=" + genre4 + ", stars=" + stars + ", directors=" + directors + 
//               ", writers=" + writers + ", producers=" + producers + ", music=" + music + "]";
//        System.out.println("toString called: " + result);
//        return result;
//        
//    }
    
    
    
    
    

    
}
