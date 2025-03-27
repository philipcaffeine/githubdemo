package com.example.demo.service;

import com.example.demo.model.Server;
import org.springframework.stereotype.Service;

@Service
public class ServerImpl implements Server {
    @Override
    public void submitOrder() {
        // Logic for submitting order to the server
    }

    @Override
    public void orderConfirmed() {
        // Logic for confirming order on the server
    }
}