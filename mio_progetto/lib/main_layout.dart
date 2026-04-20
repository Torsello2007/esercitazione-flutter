import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (index == 0) context.go('/input');
          if (index == 1) context.go('/list');
        },
        selectedIndex: GoRouterState.of(context).uri.toString() == '/input' ? 0 : 1,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.edit), label: 'Inserisci'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Lista'),
        ],
      ),
    );
  }
}
