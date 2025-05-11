package com.example.demo.service;

import com.example.demo.model.Theater;
import org.springframework.stereotype.Service;

@Service
public class TheaterImpl implements Theater {
    @Override
    public void submitOrder() {
        // Logic for submitting order to the theater
    }

    @Override
    public void orderConfirmed() {
        // Logic for confirming order in the theater
    }
}