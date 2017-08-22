package com.taskmanager.controller;

import com.taskmanager.entity.Task;
import com.taskmanager.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class DefaultController {

    @RequestMapping("/")
    public String index() {
        return "tasks";
    }

    @GetMapping("about")
    public String about() {
        return "about";
    }

    @GetMapping("login")
    public String login() {
        return "login";
    }

    @GetMapping("admin")
    public String admin() {
        return "admin";
    }

    @GetMapping("/403")
    public String error403() {
        return "/error/403";
    }

}
