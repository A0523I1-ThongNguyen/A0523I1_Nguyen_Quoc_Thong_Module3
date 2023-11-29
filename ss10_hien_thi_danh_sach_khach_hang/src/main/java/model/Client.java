package model;

import java.time.LocalDate;
import java.util.Locale;

public class Client {
    private String name;
    private LocalDate birthday;
    private String address;
    private String picture;

    public Client(String name, LocalDate birthday, String address, String picture) {
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.picture = picture;
    }

    public Client(){

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
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
