
import 'package:signals/signals.dart';
import 'package:todo_signals/models/todo_model.dart';

class TodoController {
  final todos = <TodoModel>[].toSignal();


  late final Computed<String> todoStatusString = computed(() {
    final notCompletedTodos = todos.where((todo) => !todo.completed);

    if(todos.isEmpty) {
      return "Não há tarefas aqui.";
    } else if(notCompletedTodos.isEmpty) {
      return "Todas as tarefas foram concluídas!";
    }
    return "Você possui ${notCompletedTodos.length} tarefa${notCompletedTodos.length == 1 ? '' : 's'}";
  });

  void onAddTodo(TodoModel todo) {
    todos.add(todo);
  }

  void onRemoveTodo(TodoModel todo) {
    todos.removeWhere((todoFromList) => todoFromList.id == todo.id);
  } 

  void onChangeCompletedTodo(TodoModel todoToUpdate) {
    todos.value = todos.value.map((todo) {
      if(todo.id == todoToUpdate.id) {
        return todo.copyWith(completed: !todoToUpdate.completed);
      }
      return todo;
    }).toList();
  }
}