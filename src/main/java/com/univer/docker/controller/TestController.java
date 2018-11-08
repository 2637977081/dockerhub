package com.univer.docker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author lvgang
 * @descript
 * @time 2018-11-02 15:38
 */
@RestController
@RequestMapping("/test")
public class TestController {

    @GetMapping("/test")
    public String test(){
        return "test success";
    }

    @GetMapping("/test1")
    public String test1(String name){
        return "###"+name;
    }

}
