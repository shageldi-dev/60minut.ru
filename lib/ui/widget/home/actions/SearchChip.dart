import 'package:booking/ui/theme/color.dart';
import 'package:flutter/material.dart';

class SearchChip extends StatelessWidget {
  final String text;
  final Function(String) onRemove;
  const SearchChip({super.key, required this.text, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4, left: 10, right: 6, bottom: 5),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFFFA6A8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              onRemove(text);
            },
            child: Icon(
              Icons.close,
              color: iconColor,
            ),
          )
        ],
      ),
    );
  }
}
