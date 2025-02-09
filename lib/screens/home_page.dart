import 'package:flutter/material.dart';
import '../models/habit_task.dart';
import '../widgets/task_list.dart';
import 'add_task_page.dart';

class HabitHomeScreen extends StatefulWidget {
  final VoidCallback toggleDarkMode;
  final bool isDarkMode;

  HabitHomeScreen({required this.toggleDarkMode, required this.isDarkMode});

  @override
  _HabitHomeScreenState createState() => _HabitHomeScreenState();
}

class _HabitHomeScreenState extends State<HabitHomeScreen> {
  List<HabitTask> tasks = [];

  void addTask(String name, String category) {
    setState(() {
      tasks.add(HabitTask(name: name, category: category));
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleDarkMode,
          ),
        ],
      ),
      body: TaskList(
          tasks: tasks,
          toggleCompletion: toggleCompletion,
          deleteTask: deleteTask),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
          if (result != null) {
            addTask(result['name'], result['category']);
          }
        },
      ),
    );
  }
}
