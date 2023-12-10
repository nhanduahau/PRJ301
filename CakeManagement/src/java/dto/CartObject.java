/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author tolyh
 */
public class CartObject {

    private Map<String, Integer> items;

    public CartObject() {
    }

    public Map<String, Integer> getItems() {
        return items;
    }

    public void addCakes(String key, int quantity) {

        if (this.items == null) {
            this.items = new HashMap<>();
        } // items have not existed
        //   String key = order.getCakeID();

        this.items.put(key, quantity);

    }

    public void removeCake(String key) {
        if (this.items != null) {
            if (this.items.containsKey(key)) {
                this.items.remove(key);
            }
        }
    }
}
