import 'package:flutter/material.dart';

class FilterSegmentedButtons extends StatefulWidget {
  final List<String> buttons;
  final String selected;
  final Function(String, int) onSelected;

  const FilterSegmentedButtons(
      {super.key,
      required this.buttons,
      required this.onSelected,
      required this.selected});

  @override
  State<FilterSegmentedButtons> createState() => _FilterSegmentedButtonsState();
}

class _FilterSegmentedButtonsState extends State<FilterSegmentedButtons> {
  Set<String> selection = <String>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selection = {widget.selected};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0, right: 18.0, bottom: 19.0),
      child: Container(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFE0E0E0),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: SegmentedButton(
          segments: widget.buttons
              .map((e) => ButtonSegment(
                  value: e,
                  icon: Text(""),
                  label: Card(
                    elevation: 0,
                    color: selection.isNotEmpty && selection.contains(e)
                        ? Color(0xFFFFA6A8)
                        : Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(e),
                    ),
                  )))
              .toList(),
          selected: selection,
          showSelectedIcon: false,
          style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide.none),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              padding: MaterialStateProperty.all(EdgeInsets.all(6.0)),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.transparent;
                  }
                  return Colors.transparent;
                },
              ),
              iconSize: MaterialStateProperty.all(8)),
          onSelectionChanged: (Set<String> newSelection) {
            try {
              widget.onSelected(newSelection.first,
                  widget.buttons.indexOf(newSelection.first));
            } catch (e) {
              widget.onSelected("", 0);
            }
            setState(() {
              selection = newSelection;
            });
          },
          multiSelectionEnabled: false,
          emptySelectionAllowed: true,
        ),
      ),
    );
  }
}
