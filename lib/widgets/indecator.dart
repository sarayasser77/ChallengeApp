import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Indecator extends StatelessWidget {
  const Indecator({Key? key, required this.isActive}) : super(key: key);
final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 250),
    margin: EdgeInsets.symmetric(horizontal: 4),
    width: isActive?22:8,
      height: 8,
      decoration: BoxDecoration(color: isActive? Colors.blue:Colors.grey,borderRadius: BorderRadius.circular(8)),
    );
  }
}
