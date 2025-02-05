import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _habitBox = Hive.box('habitBox'); // Get Hive storage box

  List<Map<String, dynamic>> habits = [];

  @override
  void initState() {
    super.initState();
    loadHabits(); 
  }

  void loadHabits() {
    setState(() {
      habits = List<Map<String, dynamic>>.from(_habitBox.get('habits', defaultValue: []));
    });
  }

  void saveHabits() {
    _habitBox.put('habits', habits);
  }

  void addHabit(String name) {
    setState(() {
      habits.add({"name": name, "completed": false});
      saveHabits();
    });
  }

  void toggleHabit(int index) {
    setState(() {
      habits[index]["completed"] = !habits[index]["completed"];
      saveHabits(); 
    });
  }

  void resetHabits() {
    setState(() {
      for (var habit in habits) {
        habit["completed"] = false;
      }
      saveHabits(); 
    });
  }

  void showAddHabitDialog() {
    String newHabit = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Habit"),
          content: TextField(
            onChanged: (value) {
              newHabit = value;
            },
            decoration: const InputDecoration(hintText: "Enter habit name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newHabit.isNotEmpty) {
                  addHabit(newHabit);
                }
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Habit Tracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetHabits,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.deepPurple[200],
            title: Text(
              habits[index]["name"],
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Checkbox(
              value: habits[index]["completed"],
              onChanged: (value) {
                toggleHabit(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddHabitDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
