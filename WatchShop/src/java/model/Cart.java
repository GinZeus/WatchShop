/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class Cart {

    private ArrayList<Item> items;

    public Cart() {
        items = new ArrayList<>();

    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getP_id() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getP_id()) != null) {
            Item m = getItemById(t.getProduct().getP_id());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public float getTotalMoney() {
        float t=0;
        for(Item i: items){
            if(i.getProduct().getDiscount()!=0){
                t+= (i.getQuantity()*i.getSale_price()*(1-(i.getProduct().getDiscount()*0.01)));
            }else{
                t+= (i.getQuantity()*i.getSale_price());
            }
        }
        return t;
    }
    
    public Product getProductById(int id, ArrayList<Product> list){
        for(Product p: list){
            if(p.getP_id()==id){
                return p;
            }
        }
        return null;
    }
    
    public Cart(String txt, ArrayList<Product> list){
        items = new ArrayList();
        try {
            if(txt != null && txt.length() !=0){
                String[]s= txt.split("-");
                for(String i: s){
                    String []n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductById(id, list);
                    if(p.getStatus()==1 && p.getQuantity()>0){
                        if(quantity <= p.getQuantity()){
                            Item t =new Item(p, p.getSale_price(), quantity);
                            addItem(t);
                        }else{
                            Item t =new Item(p, p.getSale_price(), p.getQuantity());
                            addItem(t);
                        }
                    }
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

}
