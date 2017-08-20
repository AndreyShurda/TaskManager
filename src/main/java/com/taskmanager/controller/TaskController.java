package com.taskmanager.controller;

import com.taskmanager.entity.Task;
import com.taskmanager.service.TaskService;
import com.taskmanager.tests.TestImage;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;

@Controller
public class TaskController {
    @Autowired
    private TaskService taskService;

    @RequestMapping(value = "tasks", method = RequestMethod.GET)
    public String list(Model model) {
        Iterable<Task> tasks = taskService.listTasks();
        model.addAttribute("tasks", tasks);
        return "tasks";
    }

    @RequestMapping("task/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Task taskById = taskService.getTaskById(id);
        model.addAttribute("task", taskById);
        return "taskEdit";
    }

    @RequestMapping("task/view/{id}")
    public String view(@PathVariable Long id, Model model) {
        Task taskById = taskService.getTaskById(id);
        model.addAttribute("task", taskById);
        return "taskView";
    }

    @RequestMapping("task/new")
    public String newTask(Model model) {
        Task task = new Task();
        model.addAttribute("task", task);
        return "taskNew";
    }

    @RequestMapping(value = "task", method = RequestMethod.POST)
//    public String save(@RequestParam("file") MultipartFile file, Task task) throws IOException {
    public String save(@RequestParam("file") MultipartFile file,
                       Task task) throws IOException {
        byte[] image = file.getBytes();
        byte[] scale = TestImage.scale(image, 300, 200);

        task.setLogo(scale);
        taskService.saveTask(task);
        return "redirect:/tasks";
    }

    @RequestMapping(value = "task/{id}", method = RequestMethod.POST)
    public String update(@PathVariable Long id, Task task) {
        Task taskEdit = taskService.getTaskById(id);
        taskEdit.setName(task.getName());
        taskEdit.setEmail(task.getEmail());
        taskEdit.setComment(task.getComment());
        taskEdit.setTaskStatus(task.getTaskStatus());

        taskService.saveTask(taskEdit);
        return "redirect:/tasks";
    }
}
