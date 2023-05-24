import 'package:expansion_widget/expansion_widget.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class AssetInventoryCommitteeView extends StatelessWidget {
  const AssetInventoryCommitteeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
        initiallyExpanded: true,
        titleBuilder:
            (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
              onTap: () => toogleFunction(animated: true),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: Text('Expansion Widget Title 1')),
                    Transform.rotate(
                      angle: math.pi * animationValue / 2,
                      child: Icon(Icons.arrow_right, size: 40),
                      alignment: Alignment.center,
                    )
                  ],
                ),
              ));
        },
        content: Container(
          width: double.infinity,
          color: Colors.grey.shade100,
          padding: const EdgeInsets.all(20),
          child: const Text('Expaned Content'),
        ));
  }
}
