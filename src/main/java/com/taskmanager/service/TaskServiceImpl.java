package com.taskmanager.service;


import com.taskmanager.entity.Task;
import com.taskmanager.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Override
    public void saveTask(Task task) {
        taskRepository.save(task);
    }

    @Override
    public Task getTaskById(Long id) {
        return taskRepository.findOne(id);
    }

    @Override
    public Iterable<Task> listTasks() {
        return taskRepository.findAll();
    }
}
