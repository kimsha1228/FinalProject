package balgil.com.trip.cart.model;

import java.util.Date;
import lombok.Data;

@Data
public class CartVO {
    private int id;
    private int quantity;
    private Date res_date;
    private String user_id;
    private int act_id;
}
