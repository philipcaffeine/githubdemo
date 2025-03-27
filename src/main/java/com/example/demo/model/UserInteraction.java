package com.example.demo.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserInteraction {
    private Theater theater;
    private Server server;

    @Autowired
    public UserInteraction(Theater theater, Server server) {
        this.theater = theater;
        this.server = server;
    }

    public void insertCard() {
        // Logic for inserting card
    }

    public void selectDate() {
        // Logic for selecting date
    }

    public void offerSeat() {
        // Logic for offering seat
    }

    public void submitOrder() {
        theater.submitOrder();
        server.submitOrder();
    }

    public void orderConfirmed() {
        theater.orderConfirmed();
        server.orderConfirmed();
    }
}