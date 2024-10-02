import 'package:flutter/material.dart';

class ByteBoardWeb extends StatefulWidget {
  final VoidCallback toggleTheme;
  final String title;
  const ByteBoardWeb(
      {super.key, required this.toggleTheme, required this.title});

  @override
  State<ByteBoardWeb> createState() => _ByteBoardWebState();
}

class _ByteBoardWebState extends State<ByteBoardWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/dashboard'),
            },
            icon: const Icon(Icons.dashboard),
            tooltip: 'Dashboard',
          ),
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: widget.toggleTheme,
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
