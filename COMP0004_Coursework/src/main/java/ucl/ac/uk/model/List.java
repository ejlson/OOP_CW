package ucl.ac.uk.model;

import java.util.ArrayList;

public class List {
    private String name;
    private ArrayList<Item> items;

    public List(String name) {
        this.name = name;
        this.items = new ArrayList<Item>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public void addItem(Item item) {
        items.add(item);
    }

    public void removeItem(Item item) {
        items.remove(item);
    }

//    public String toString() {
//        StringBuilder sb = new StringBuilder();
//        sb.append("List: ").append(name).append("\n");
//        for (Item item : items) {
//            sb.append("- ").append(item.toString()).append("\n");
//        }
//        return sb.toString();
//    }
}
