package com.example.demo.controller;

import com.example.demo.model.UserInteraction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserInteractionController {

    @Autowired
    private UserInteraction userInteraction;

    @GetMapping("/")
    public String index(Model model) {
        return "index";
    }

    @PostMapping("/insertCard")
    public String insertCard() {
        userInteraction.insertCard();
        return "redirect:/";
    }

    @PostMapping("/selectDate")
    public String selectDate() {
        userInteraction.selectDate();
        return "redirect:/";
    }

    @PostMapping("/offerSeat")
    public String offerSeat() {
        userInteraction.offerSeat();
        return "redirect:/";
    }

    @PostMapping("/submitOrder")
    public String submitOrder() {
        userInteraction.submitOrder();
        return "redirect:/";
    }

    @PostMapping("/orderConfirmed")
    public String orderConfirmed() {
        userInteraction.orderConfirmed();
        return "redirect:/";
    }
}