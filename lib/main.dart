import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Task',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Task'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                size: 70,
                color: Colors.blueGrey,
              ),
              const SizedBox(height: 20),
              const Text(
                'Plan a Study Task',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Add one task you want to complete today.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaskScreen(),
                    ),
                  );
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController taskController = TextEditingController();

  String message = 'No task added yet.';
  bool completed = false;

  void saveTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        message = 'Current task: ${taskController.text}';
        completed = false;
      });
    }
  }

  void markComplete() {
    setState(() {
      completed = !completed;
    });
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Task'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Enter your study task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveTask,
              child: const Text('Save Task'),
            ),
            const SizedBox(height: 30),
            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (message != 'No task added yet.')
              ElevatedButton(
                onPressed: markComplete,
                child: Text(
                  completed ? 'Mark as Not Done' : 'Mark as Done',
                ),
              ),
            const SizedBox(height: 20),
            if (completed)
              const Text(
                'Task completed!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}