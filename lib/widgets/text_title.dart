import 'package:flutter/widgets.dart';

class TextTitle extends StatelessWidget {
  final String title;
  const TextTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff7C7BAD),
        ),
      ),
    );
  }
}
