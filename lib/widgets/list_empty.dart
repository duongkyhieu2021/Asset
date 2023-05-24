import 'package:flutter/widgets.dart';
import 'package:sea_hr/theme.dart';

class ListEmpty extends StatelessWidget {
  final String title;
  const ListEmpty({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/smiling_face.png",
            height: 160,
            width: 160,
          ),
          Text(
            title,
            style: ThemeApp.textStyle(),
          ),
        ],
      ),
    );
  }
}
