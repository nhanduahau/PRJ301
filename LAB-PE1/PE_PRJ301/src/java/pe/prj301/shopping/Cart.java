/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.prj301.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author hd
 */
public class Cart {

    private Map<String, Integer> items;

    public Cart() {
    }

    public Map<String, Integer> getItems() {
        return items;
    }

    public void addProduct(String key, int quantity) {

        if (this.items == null) {
            this.items = new HashMap<>();
        } // items have not existed

        this.items.put(key, quantity);

    }

    public void removeProduct(String key) {
        if (this.items != null) {
            if (this.items.containsKey(key)) {
                this.items.remove(key);
            }
        }
    }
}
