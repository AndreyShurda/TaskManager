package com.taskmanager.repository;

import com.taskmanager.entity.Task;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface TaskRepository extends CrudRepository<Task, Long> {
}
