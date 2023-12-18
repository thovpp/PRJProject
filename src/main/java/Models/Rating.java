package Models;

public class Rating {
    private String username;
    private int product_id;
    private int rating_star;

    public Rating() {
    }

    public Rating(String username, int product_id, int rating_star) {
        this.username = username;
        this.product_id = product_id;
        this.rating_star = rating_star;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getRating_star() {
        return rating_star;
    }

    public void setRating_star(int rating_star) {
        this.rating_star = rating_star;
    }
}
