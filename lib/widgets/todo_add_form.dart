import 'package:flutter/material.dart';
import 'package:todo_signals/models/todo_model.dart';
import 'package:todo_signals/screens/to_do_screen.dart';

class TodoAddForm extends StatefulWidget {

  const TodoAddForm({ super.key });

  @override
  State<TodoAddForm> createState() => _TodoAddFormState();
}

class _TodoAddFormState extends State<TodoAddForm> {

  final formKey = GlobalKey<FormState>();

  final titleC = TextEditingController();
  final descriptionC = TextEditingController();

  void onAddTodo() {
    if(formKey.currentState!.validate()) {
      final todoToAdd = TodoModel(titleC.text, descriptionC: descriptionC.text);

      todoCtrl.onAddTodo(todoToAdd);

      Navigator.pop(context);
    }
  }

   @override
   Widget build(BuildContext context) {
       return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleC,
                validator: (newTitle) {
                  if(newTitle == null || newTitle.isEmpty) {
                    return "Campo obrigatório.";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Título",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Descrição",
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: onAddTodo, 
                  child: const Text("Add tarefa", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),),
            ],
          ),
        ),
       );
   }
}