import 'package:flutter/material.dart';
import '../models/habit_task.dart';

class TaskList extends StatelessWidget {
  final List<HabitTask> tasks;
  final Function(int) toggleCompletion;
  final Function(int) deleteTask;

  TaskList(
      {required this.tasks,
      required this.toggleCompletion,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    Map<String, List<HabitTask>> categorizedTasks = {};
    for (var task in tasks) {
      categorizedTasks.putIfAbsent(task.category, () => []).add(task);
    }

    return ListView(
      children: categorizedTasks.entries.map((entry) {
        return ExpansionTile(
          title: Text(entry.key, style: TextStyle(fontWeight: FontWeight.bold)),
          children: entry.value.asMap().entries.map((taskEntry) {
            int index = tasks.indexOf(taskEntry.value);
            return ListTile(
              title: Text(taskEntry.value.name),
              leading: Checkbox(
                value: taskEntry.value.isCompleted,
                onChanged: (_) => toggleCompletion(index),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteTask(index),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
