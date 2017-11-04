package kr.ac.jbnu.se.advweb.product.model;

public class Product {
	private String code;
	private String name;
	private float price;
	private String brand;
	private String cpu;

	private String graphicCard;

	public Product() {
	}

	public Product(String code, String name, float price, String brand, String cpu, String graphicCard) {
		this.code = code;
		this.name = name;
		this.price = price;
		this.brand = brand;
		this.cpu = cpu; 
		this.graphicCard = graphicCard;
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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	

	public String getGraphicCard() {
		return graphicCard;
	}
	
	public void setGraphicCard(String graphicCard) {
		this.graphicCard = graphicCard;
	}
	
	public String getCpu() {
		return cpu;
	}
	
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
}