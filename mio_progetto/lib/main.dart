import 'package:flutter/material.dart';
import 'app_router.dart';
import 'todo_state.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      routerConfig: appRouter,
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aggiungi Attività'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Cosa devi fare?', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    setState(() { todoList.add(_controller.text); _controller.clear(); });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Salvato!')));
                  }
                },
                child: const Text('Salva'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La mia Lista'), centerTitle: true),
      body: todoList.isEmpty 
        ? const Center(child: Text('Lista vuota'))
        : ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(todoList[index]),
                trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => setState(() => todoList.removeAt(index))),
              ),
            ),
          ),
    );
  }
}
