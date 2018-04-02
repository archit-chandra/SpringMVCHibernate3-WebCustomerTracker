package com.gemalto.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/home")
public class HomeController {

    @RequestMapping("/")
    public String showHomePage() {
        return "homepage";
    }
}