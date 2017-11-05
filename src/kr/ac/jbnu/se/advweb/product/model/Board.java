package kr.ac.jbnu.se.advweb.product.model;

public class Board {
	private String id;
	private String title;
	private String author;
	private String date;
	private String hits;
	private String contents;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHits() {
		return hits;
	}
	public void setHits(String hits) {
		this.hits = hits;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
}
