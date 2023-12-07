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
public class Book {
    private String BookID;
    private String BookTitle;
    private String BookAuthor;
    private int YearOfPublished;

    public Book() {
    }

    public Book(String BookID, String BookTitle, String BookAuthor, int YearOfPublished) {
        this.BookID = BookID;
        this.BookTitle = BookTitle;
        this.BookAuthor = BookAuthor;
        this.YearOfPublished = YearOfPublished;
    }

    public String getBookID() {
        return BookID;
    }

    public void setBookID(String BookID) {
        this.BookID = BookID;
    }

    public String getBookTitle() {
        return BookTitle;
    }

    public void setBookTitle(String BookTitle) {
        this.BookTitle = BookTitle;
    }

    public String getBookAuthor() {
        return BookAuthor;
    }

    public void setBookAuthor(String BookAuthor) {
        this.BookAuthor = BookAuthor;
    }

    public int getYearOfPublished() {
        return YearOfPublished;
    }

    public void setYearOfPublished(int YearOfPublished) {
        this.YearOfPublished = YearOfPublished;
    }
    
    
    
}
