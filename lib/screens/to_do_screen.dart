import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_signals/controllers/todo_controller.dart';
import 'package:todo_signals/widgets/todo_add_form.dart';

final todoCtrl = TodoController();

class ToDoScreen extends StatelessWidget {

  const ToDoScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text('To-do list usando signals', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(onPressed: () => showModalBottomSheet(
                context: context, 
                builder: (_) => const TodoAddForm(), 
                elevation: 4, 
                ), 
              icon: const Icon(Icons.add, color: Colors.white),
              ),
            ],
            ),
           body: Watch(
             (context) {
               return Column(
                children: [
                  Padding(padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(todoCtrl.todoStatusString.value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todoCtrl.todos.length,
                      itemBuilder: (context, index) {
                        final todo = todoCtrl.todos[index];
               
                        return ListTile(
                          leading: Checkbox(
                            value: todo.completed, 
                            onChanged: (_) => todoCtrl.onChangeCompletedTodo(todo),
                            ),
                            title: Text(todo.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                            subtitle: Text(todo.description ?? '', style: const TextStyle(fontSize: 18)),
                            trailing: IconButton(
                              onPressed: () => todoCtrl.onRemoveTodo(todo), 
                              icon: const Icon(Icons.remove_circle, color: Colors.red),
                            ),
                        );
                      },
                      ),
                  ),
                ],
               );
             }
           ),
       );
  }
}