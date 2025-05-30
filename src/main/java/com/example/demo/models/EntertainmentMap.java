package com.example.demo.models;
import jakarta.persistence.*;

@Entity
@Table(name = "intertainment_map")

public class EntertainmentMap {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;
    private String address;
    private Integer category_id;
    private Integer working_hours_id;
    private String phone_number;
    private String website;
    private Float rating;
    private Integer number_of_reviews;
    private Float latitude;
    private Float longitude;

//    @Column(columnDefinition = "geometry(Point,4326)")
//    private Point location;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public Integer getWorking_hours_id() {
        return working_hours_id;
    }

    public void setWorking_hours_id(Integer working_hours_id) {
        this.working_hours_id = working_hours_id;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public Float getRating() {
        return rating;
    }

    public void setRating(Float rating) {
        this.rating = rating;
    }

    public Integer getNumber_of_reviews() {
        return number_of_reviews;
    }

    public void setNumber_of_reviews(Integer number_of_reviews) {
        this.number_of_reviews = number_of_reviews;
    }

    public Float getLatitude() {
        return latitude;
    }

    public void setLatitude(Float latitude) {
        this.latitude = latitude;
    }

    public Float getLongitude() {
        return longitude;
    }

    public void setLongitude(Float longitude) {
        this.longitude = longitude;
    }
}
