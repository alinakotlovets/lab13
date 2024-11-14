import 'package:flutter/material.dart';
import 'border_box.dart';
import './slider_widget.dart';
import './border_radius_provider.dart';
import 'package:provider/provider.dart';

class BorderChanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 46.0),
        BorderBox(), // Use the BorderBox widget
        const SizedBox(height: 20.0),
        CornerSliders(),
      ],
    );
  }
}

class CornerSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final borderRadiusProvider = Provider.of<BorderRadiusProvider>(context);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SliderWidget(
                label: "TL: ",
                value: borderRadiusProvider.topLeft,
                onChanged: (value) => borderRadiusProvider.setTopLeft(value),
              ),
            ),
            Expanded(
              child: SliderWidget(
                label: "TR: ",
                value: borderRadiusProvider.topRight,
                onChanged: (value) => borderRadiusProvider.setTopRight(value),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: SliderWidget(
                label: "BL: ",
                value: borderRadiusProvider.bottomLeft,
                onChanged: (value) => borderRadiusProvider.setBottomLeft(value),
              ),
            ),
            Expanded(
              child: SliderWidget(
                label: "BR: ",
                value: borderRadiusProvider.bottomRight,
                onChanged: (value) => borderRadiusProvider.setBottomRight(value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
