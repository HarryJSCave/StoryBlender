import 'package:flutter/material.dart';

class WidgetsSection extends StatelessWidget {

  const WidgetsSection({
    super.key,
    this.direction = 'row',
    required this.widgets,
  });

  /// 'row' or 'column' @default row
  final String direction;

  /// widgets to render in section 
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return SizedBox(
      child: direction == 'row' ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widgets,
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widgets,
      ),
    );
  }
}