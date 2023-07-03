package balgil.com.trip.cart.model;

import lombok.Data;

@Data
public class CartVO {
	
    private int id;
    private int quantity;
    private String res_date;
    private String user_id;
    private int act_id;
}
