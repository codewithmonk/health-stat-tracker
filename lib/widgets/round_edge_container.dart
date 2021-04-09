import 'package:flutter/material.dart';

class RoundEdgeContainer extends StatelessWidget {
  Widget child;
  RoundEdgeContainer(this.child);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * .9,
      height: mediaQuery.size.width * .75,
      child: Center(child: Text("Hi")),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.red,
              width: 3
          ),
          borderRadius: BorderRadius.all(Radius.circular(60))
      ),
    );
  }
}
