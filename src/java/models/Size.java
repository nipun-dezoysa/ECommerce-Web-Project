
package models;

public class Size {
   
    String id;
    String pid;
    String value;

    public Size(String id, String pid, String value) {
        this.id = id;
        this.pid = pid;
        this.value = value;
    }

    public String getId() {
        return id;
    }

    public String getPid() {
        return pid;
    }

    public String getValue() {
        return value;
    }
    
    
    
}
