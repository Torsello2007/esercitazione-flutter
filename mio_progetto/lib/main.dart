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
      theme: ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF8F9FE),
      ),
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
      appBar: AppBar(title: const Text('Nuova Todo'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.playlist_add_check, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 30),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Cosa devi fare?',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    setState(() { todoList.add(_controller.text); _controller.clear(); });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Salvato con successo!')));
                  }
                },
                child: const Text('Aggiungi alla lista'),
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
      appBar: AppBar(title: const Text('I tuoi impegni'), centerTitle: true),
      body: todoList.isEmpty 
        ? const Center(child: Text('Nessun impegno salvato.'))
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: todoList.length,
            itemBuilder: (context, index) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                title: Text(todoList[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () => setState(() => todoList.removeAt(index)),
                ),
              ),
            ),
          ),
    );
  }
}
