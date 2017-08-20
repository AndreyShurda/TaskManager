package com.taskmanager.service;

import com.taskmanager.entity.Task;

public interface TaskService {
    void saveTask(Task task);

    Task getTaskById(Long id);

    Iterable<Task> listTasks();
}
