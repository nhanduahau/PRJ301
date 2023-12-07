/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author tolyh
 */
public class Song {

    private String SongID;
    private String SongTitle;
    private String SongArtist;
    private String SongDuration;
    private String url;

    public Song() {
    }

    public Song(String SongID, String SongTitle, String SongArtist, String SongDuration, String url) {
        this.SongID = SongID;
        this.SongTitle = SongTitle;
        this.SongArtist = SongArtist;
        this.SongDuration = SongDuration;
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSongID() {
        return SongID;
    }

    public void setSongID(String SongID) {
        this.SongID = SongID;
    }

    public String getSongTitle() {
        return SongTitle;
    }

    public void setSongTitle(String SongTitle) {
        this.SongTitle = SongTitle;
    }

    public String getSongArtist() {
        return SongArtist;
    }

    public void setSongArtist(String SongArtist) {
        this.SongArtist = SongArtist;
    }

    public String getSongDuration() {
        return SongDuration;
    }

    public void setSongDuration(String SongDuration) {
        this.SongDuration = SongDuration;
    }

}
