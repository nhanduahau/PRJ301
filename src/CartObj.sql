public class CartObj {
    
    private Map<String, Integer> items;

    public CartObj() {
    }

    public Map<String, Integer> getItems() {
        return items;
    }

    public void addMobile(String key, int quantity) {

        if (this.items == null) {
            this.items = new HashMap<>();
        } // items have not existed

        this.items.put(key, quantity);

    }

    public void removeMobile(String key) {
        if (this.items != null) {
            if (this.items.containsKey(key)) {
                this.items.remove(key);
            }
        }
    }
}