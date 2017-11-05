package kr.ac.jbnu.se.advweb.product.model;

public class Product {
	private String code;
	private String name;
	private String price;
	private String brand;
	private String cpu;
	private String graphicCard;
	private String description;
	private String image;

	public Product() {
	}

	public Product(String name, String price, String brand, String cpu, String graphicCard, String description, String image) {
		this.name = name;
		this.price = price;
		this.brand = brand;
		this.cpu = cpu; 
		this.graphicCard = graphicCard;
		this.description = description;
		this.image = image;
	}
	
	public Product(String code, String name, String price, String brand, String cpu, String graphicCard, String description, String image) {
		this.code = code;
		this.name = name;
		this.price = price;
		this.brand = brand;
		this.cpu = cpu; 
		this.graphicCard = graphicCard;
		this.description = description;
		this.image = image;
	}

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getBrand() {
		return brand;
	}
	
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public String getCpu() {
		return cpu;
	}
	
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	
	public String getGraphicCard() {
		return graphicCard;
	}
	
	public void setGraphicCard(String graphicCard) {
		this.graphicCard = graphicCard;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
}