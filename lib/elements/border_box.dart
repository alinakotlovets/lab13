import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './border_radius_provider.dart';

class BorderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final borderRadiusProvider = Provider.of<BorderRadiusProvider>(context);
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadiusProvider.topRight),
          topLeft: Radius.circular(borderRadiusProvider.topLeft),
          bottomRight: Radius.circular(borderRadiusProvider.bottomRight),
          bottomLeft: Radius.circular(borderRadiusProvider.bottomLeft),
        ),
      ),
    );
  }
}
