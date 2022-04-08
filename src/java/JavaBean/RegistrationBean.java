package JavaBean;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name="Login1")
public class RegistrationBean {
     @Id
     private double id;
     private String Email,Password,Name,VehicleNo;
     private long Number,Adhar;
     private Date date;
     public double getId() {
        return id;
     }
     public void setId(double id) {
        this.id = id;
     }
     public String getEmail() {
        return Email;
     }
     public void setEmail(String Email) {
        this.Email = Email;
     }
     public String getPassword() {
        return Password;
     }
     public void setPassword(String Password) {
        this.Password = Password;
     }
     public String getName() {
        return Name;
     }
     public void setName(String Name) {
        this.Name = Name;
     }
     public String getVehicleNo() {
        return VehicleNo;
     }
     public void setVehicleNo(String VehicleNo) {
        this.VehicleNo = VehicleNo;
     }
     public long getNumber() {
        return Number;
     }
     public void setNumber(long Number) {
        this.Number = Number;
     }
     public long getAdhar() {
        return Adhar;
     }
     public void setAdhar(long Adhar) {
        this.Adhar = Adhar;
     }
     public Date getDate() {
        return date;
     }
     public void setDate(Date date) {
        this.date = date;
     }
     
}
