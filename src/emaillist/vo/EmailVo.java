package emaillist.vo;


import java.util.Date;

public class EmailVo {
    //필드
    private Long no;
    private String lastName;
    private String firstName;
    private String email;
    private java.sql.Date createdAt;

    //생성자 1
    public EmailVo(String lastName, String firstName, String email) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.email = email;
    }

    //생성자 2
    public EmailVo(Long no, String lastName, String firstName, String email, Date createdAt) {

        this(lastName, firstName, email);
        this.no = no;
        this.createdAt = (java.sql.Date) createdAt;
    }

    //toString
    @Override
    public String toString() {
        return "EmailVo{" +
                "no=" + no +
                ", lastName='" + lastName + '\'' +
                ", firstName='" + firstName + '\'' +
                ", email='" + email + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }

    //Getter Setter
    public Long getNo() {
        return no;
    }

    public void setNo(Long no) {
        this.no = no;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public java.sql.Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = (java.sql.Date) createdAt;
    }
}
