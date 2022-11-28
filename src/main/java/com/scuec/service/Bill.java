package com.scuec.service;

/**
 * 账单类
 */
public class Bill {
    private String name;
    private int price;
    private int number;

    public Bill() {

    }


    public Bill(String name, int price, int number) {
        this.name = name;
        this.price = price;
        this.number = number;
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

}
