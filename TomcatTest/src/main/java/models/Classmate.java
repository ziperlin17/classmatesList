package models;

public class Classmate {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String comment;

    public Classmate(Long id, String firstName, String lastName, String email, String comment) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.comment = comment;
    }


    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getComment() {
        return comment;
    }
}
