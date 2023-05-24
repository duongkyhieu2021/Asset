import 'package:flutter/material.dart';

class DialogProgress extends StatelessWidget {
  final String title;
  const DialogProgress({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 40, width: 40, child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
