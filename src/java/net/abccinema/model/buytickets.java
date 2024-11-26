package net.abccinema.model;

/**
 *
 * @author gavin
 */
public class buytickets {
    private int id;
    private String Name;
    private String Description;
    private String Image;
    private String Time;
    private String Date;
    
    public buytickets(){
    }

    public buytickets(int id, String Name, String Description, String Image, String Time, String Date) {
        this.id = id;
        this.Name = Name;
        this.Description = Description;
        this.Image = Image;
        this.Time = Time;
        this.Date = Date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getTime() {
        return Time;
    }
    
    public void setTime(String Time) {
        this.Time = Time;
    }
    
    public String getDate() {
        return Date;
    }
    
    public String setDate(String Date) {
        return Date;
    }

    @Override
    public String toString() {
        return "buytickets{" + "id=" + id + ", Name=" + Name + ", Description=" + Description + ", Image=" + Image + ", Time=" + Time + ", Date=" + Date + '}';
    }  
}
