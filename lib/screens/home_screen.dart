import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> tasks = [
    {
      "title": "Design a new logo",
      "assignedTo": "Hannah",
      "startDate": "01/10/2024",
      "endDate": "07/10/2024",
      "priority": "High"
    },
    {
      "title": "Prepare for the board meeting",
      "assignedTo": "Jack Hilton",
      "startDate": "04/10/2024",
      "endDate": "10/10/2024",
      "priority": "Medium"
    },
  ];

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _editTask(int index) {
    final task = tasks[index];
    String updatedTitle = task["title"]!;
    String updatedAssignedTo = task["assignedTo"]!;
    String updatedStartDate = task["startDate"]!;
    String updatedEndDate = task["endDate"]!;
    String updatedPriority = task["priority"]!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: const Text(
            "Edit Task",
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: updatedTitle,
                  onChanged: (value) {
                    updatedTitle = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: updatedAssignedTo,
                  onChanged: (value) {
                    updatedAssignedTo = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Assigned to",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: updatedStartDate,
                  onChanged: (value) {
                    updatedStartDate = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Start Date",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: updatedEndDate,
                  onChanged: (value) {
                    updatedEndDate = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "End Date",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: updatedPriority,
                  onChanged: (value) {
                    updatedPriority = value!;
                  },
                  items: ["High", "Medium", "Low"]
                      .map((priority) => DropdownMenuItem(
                    value: priority,
                    child: Text(priority),
                  ))
                      .toList(),
                  decoration: const InputDecoration(
                    labelText: "Priority",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Colors.grey[850],
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks[index] = {
                    "title": updatedTitle,
                    "assignedTo": updatedAssignedTo,
                    "startDate": updatedStartDate,
                    "endDate": updatedEndDate,
                    "priority": updatedPriority,
                  };
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _addTask() {
    String newTitle = "";
    String newAssignedTo = "";
    String newStartDate = "";
    String newEndDate = "";
    String newPriority = "Medium";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: const Text(
            "Add Task",
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  onChanged: (value) {
                    newTitle = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  onChanged: (value) {
                    newAssignedTo = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Assigned To",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  onChanged: (value) {
                    newStartDate = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Start Date (dd/mm/yyyy)",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  onChanged: (value) {
                    newEndDate = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "End Date (dd/mm/yyyy)",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel", style: TextStyle(color: Colors.pink[200])),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add({
                    "title": newTitle,
                    "assignedTo": newAssignedTo,
                    "startDate": newStartDate,
                    "endDate": newEndDate,
                    "priority": newPriority,
                  });
                });
                Navigator.pop(context);
              },
              child: Text("Add", style: TextStyle(color: Colors.pink[200])),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Weekly To Do',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.purple),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
            color: Colors.grey[900],
            child: ListTile(
              title: Text(
                task["title"]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    "Assigned to: ${task["assignedTo"]}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Start: ${task["startDate"]}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "End: ${task["endDate"]}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Priority: ${task["priority"]}",
                    style: TextStyle(
                      color: task["priority"] == "High"
                          ? Colors.red
                          : task["priority"] == "Medium"
                          ? Colors.amber
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  if (value == "edit") {
                    _editTask(index);
                  } else if (value == "delete") {
                    _deleteTask(index);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: "edit",
                    child: Text("Edit"),
                  ),
                  const PopupMenuItem(
                    value: "delete",
                    child: Text("Delete"),
                  ),
                ],
                color: Colors.grey[800],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[850],
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple[700]!, Colors.purple[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Row(
                children: [
                   CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.pink[100],
                    child: Icon(Icons.task_alt, color: Colors.purple),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "ORGANIZO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Your Task Manager",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.white),
                    title: const Text("Profile", style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.people, color: Colors.white),
                    title: const Text("Members", style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text("Settings", style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline, color: Colors.white),
                    title: const Text("Help & Support", style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  const Divider(color: Colors.grey),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.redAccent),
                    title: const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    onTap: _logOut,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
