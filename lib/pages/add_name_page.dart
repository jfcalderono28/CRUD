import 'package:crud/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add name page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "enter name"),
            ),
            ElevatedButton(
                onPressed: () async {
                  await savePeople(nameController.text)
                      .then((value) => {Navigator.pop(context)});
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
