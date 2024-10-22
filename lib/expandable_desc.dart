import 'package:flutter/material.dart';

class ExpandableDesc extends StatelessWidget {
  const ExpandableDesc(
      {super.key,
      required this.desc,
      required this.index,
      required this.isExpanded, required this.onPress,

     });

  final bool isExpanded;
  final int index;
  final String desc;
  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text(
          desc,
          maxLines: isExpanded ? null : 1,
          overflow: isExpanded ? null : TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
                onPressed: () {
                  onPress();
                },
                style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xffdcdcda)),
                child: Row(children: [
                  Text(
                    isExpanded ? "Show less" : "Show more",
                    style: const TextStyle(color: Color(0xff1b8bcf)),
                  ),
                  Icon(
                    isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                    color: const Color(0xff1b8bcf),
                  )
                ]))
          ],
        )
      ],
    );
  }
}
