import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final Color? backgroundColor;
  final Function onOkClicked;
  final Function onClearClicked;
  const ActionButtons(
      {super.key,
      this.backgroundColor,
      required this.onOkClicked,
      required this.onClearClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration:
          BoxDecoration(color: backgroundColor ?? const Color(0xB2454545)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onClearClicked();
            },
            child: Container(
              padding: const EdgeInsets.only(
                top: 7,
                left: 14,
                right: 14,
                bottom: 10,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFF484848),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Сброс',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () {
              onOkClicked();
            },
            child: Container(
              padding: const EdgeInsets.only(
                top: 7,
                left: 14,
                right: 14,
                bottom: 10,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.71, -0.71),
                  end: Alignment(0.71, 0.71),
                  colors: [Color(0xFF339E9E), Color(0xFF307E7D)],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Применить',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
