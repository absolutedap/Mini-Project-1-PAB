import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'package:get/get.dart';
class AddTaskPage extends StatefulWidget {
  final Task? task;

  const AddTaskPage({super.key, this.task});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController matkulController;
  late TextEditingController judulController;
  late TextEditingController deadlineController;

  String jenisTugasValue = "Individu";
  String statusValue = "Belum";

  @override
  void initState() {
    super.initState();
    matkulController =
        TextEditingController(text: widget.task?.matkul ?? "");
    judulController =
        TextEditingController(text: widget.task?.judul ?? "");
    deadlineController =
        TextEditingController(text: widget.task?.deadline ?? "");

    statusValue = widget.task?.status ?? "Belum";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? "Tambah Tugas" : "Edit Tugas"),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildTextField(matkulController, "Mata Kuliah"),
                const SizedBox(height: 15),
                buildTextField(judulController, "Deskripsi Tugas"),
                const SizedBox(height: 15),
                buildTextField(deadlineController, "Deadline"),
                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: jenisTugasValue,
                  items: const [
                    DropdownMenuItem(value: "Individu", child: Text("Individu")),
                    DropdownMenuItem(value: "Kelompok", child: Text("Kelompok")),
                    DropdownMenuItem(value: "Praktikum", child: Text("Praktikum")),
                    DropdownMenuItem(value: "UTS", child: Text("UTS")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      jenisTugasValue = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Jenis Tugas",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: statusValue,
                  items: const [
                    DropdownMenuItem(value: "Belum", child: Text("Belum")),
                    DropdownMenuItem(
                        value: "Sedang Dikerjakan",
                        child: Text("Sedang Dikerjakan")),
                    DropdownMenuItem(value: "Selesai", child: Text("Selesai")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      statusValue = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Status",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: SizedBox(
                    width: 170,
                    height: 45,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 12, 217, 244),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 6,
                      ),
                      onPressed: () {
                        final task = Task(
                          matkul: matkulController.text,
                          judul: judulController.text,
                          deadline: deadlineController.text,
                          jenisTugas: jenisTugasValue,
                          status: statusValue,
                        );

                        Get.back(result: task);
                      },
                      icon: const Icon(Icons.save, size: 18),
                      label: const Text(
                        "Simpan",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}