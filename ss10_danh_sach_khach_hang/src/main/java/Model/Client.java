package Model;

import java.time.LocalDate;

public class Client {
    private String name;
    private LocalDate birth;
    private String address;
    private String picture;

    public Client(String name, LocalDate birth, String address, String picture) {
        this.name = name;
        this.birth = birth;
        this.address = address;
        this.picture = picture;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirth() {
        return birth;
    }

    public void setBirth(LocalDate birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
