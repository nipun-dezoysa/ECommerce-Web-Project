package mainPackage;

public class WishlistItem {
    private int id;
    private String name;
    private int price;
    private String img;

    // Constructors, getters, and setters

    public WishlistItem() {
    }

    public WishlistItem(int id, String name, int price, String img) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.img = img;
    }

    // Getters and Setters for id, name, price, and img

    // Getter and Setter for id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for price
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    // Getter and Setter for img
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
