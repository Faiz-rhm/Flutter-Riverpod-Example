import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/src/features/todo/provider/todo_provider.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = double.infinity;

    final todoListProvider = ref.watch(todoStateNotifierProvider);

    final onRef = ref.read(todoStateNotifierProvider.notifier);

    TextEditingController todoTextController = TextEditingController();

    Future<void> dialog(String id, String description) async {
      if (id == '') {
        todoTextController.text = '';
      } else {
        todoTextController.text = description;
      }

      await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title : Text(id == '' ? 'Add Todo': 'Edit Todo'),
          content: TextField(
            controller: todoTextController,
            decoration: const InputDecoration(
              hintText: 'E.g Assignment'
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel')
            ),
            TextButton(
              onPressed: () {
                if (id == '') {
                  onRef.add(todoTextController.text);
                } else {
                  onRef.edit(id: id, description: todoTextController.text);
                }
                Navigator.pop(context);
              },
              child: Text(id == '' ? 'Add' : 'Edit')
            ),
          ],
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: SizedBox(
        height: size,
        width:  size,
        // padding: const EdgeInsets.all(16),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: todoListProvider.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todoListProvider[index];

            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                todoListProvider.removeAt(index);
              },
              background: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white
                  ),
                ),
              ),
              child:
              Card(
                clipBehavior: Clip.hardEdge,
                color: Colors.grey.shade200,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  horizontalTitleGap: 0,
                  title: Text(todo.description),
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: ((value) => onRef.toggle(todo.id))
                  ),
                  trailing: IconButton(
                    onPressed: () => todoListProvider.removeAt(index),
                    icon: const Icon(Icons.edit),
                  ),
                )
              ),
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dialog('', ''),
        child: const Icon(Icons.add),
      ),
    );
  }
}
