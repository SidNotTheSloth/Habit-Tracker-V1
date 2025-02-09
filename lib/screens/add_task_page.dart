import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  void _submitTask() {
    if (taskController.text.isNotEmpty && categoryController.text.isNotEmpty) {
      Navigator.pop(context, {
        'name': taskController.text,
        'category': categoryController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: taskController,
                decoration: InputDecoration(labelText: 'Task Name')),
            TextField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submitTask, child: Text('Add Task')),
          ],
        ),
      ),
    );
  }
}
