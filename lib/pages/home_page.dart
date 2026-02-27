import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'add_task_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> taskList = [];

  void tambahTask(Task task) {
    setState(() {
      taskList.add(task);
    });
  }

  void hapusTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void editTask(int index, Task taskBaru) {
    setState(() {
      taskList[index] = taskBaru;
    });
  }

  Color getStatusColor(String status) {
    if (status == "Selesai") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manajemen Deadline Tugas"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 217, 244),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEDE7F6), Color(0xFFD1C4E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: taskList.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada tugas",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  final task = taskList[index];

                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),
                      title: Text(
                        task.judul,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Mata kuliah: ${task.matkul}"),
                          Text("Deadline: ${task.deadline}"),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: getStatusColor(task.status),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              task.status,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.blue),
                            onPressed: () async {
                              final hasil = await Get.to(() => AddTaskPage(task: task));
                              if (hasil != null) {
                                editTask(index, hasil);
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: Colors.red),
                            onPressed: () => hapusTask(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 12, 217, 244),
        onPressed: () async {
          final hasil = await Get.to(() => const AddTaskPage());

          if (hasil != null) {
            tambahTask(hasil);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}