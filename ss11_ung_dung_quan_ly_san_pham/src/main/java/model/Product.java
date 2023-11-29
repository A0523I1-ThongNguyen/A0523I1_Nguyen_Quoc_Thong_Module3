package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String mt_Product;
    private String producer;

    public Product(int id, String name, double price, String mt_Product, String producer) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.mt_Product = mt_Product;
        this.producer = producer;
    }

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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getMt_Product() {
        return mt_Product;
    }

    public void setMt_Product(String mt_Product) {
        this.mt_Product = mt_Product;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }
}
