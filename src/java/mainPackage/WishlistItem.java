package mainPackage;

public class WishlistItem {
    private int id;
    private String name;
    private int price;
    private String img;



    public WishlistItem(int id, String name, int price, String img) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.img = img;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
