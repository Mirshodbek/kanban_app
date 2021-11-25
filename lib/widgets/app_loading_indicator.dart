import 'package:flutter/material.dart';


class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    Key? key,
    this.value,
  })  : color = Colors.blue,
        isCircular = true,
        super(key: key);

  const AppLoadingIndicator.inverted({
    Key? key,
    this.value,
  })  : color = Colors.white60,
        isCircular = true,
        super(key: key);

  const AppLoadingIndicator.linear({
    Key? key,
    this.value,
  })  : color = Colors.blue,
        isCircular = false,
        super(key: key);

  final Color color;
  final bool isCircular;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return isCircular
        ? Center(
      child: CircularProgressIndicator(
        value: value,
        valueColor: AlwaysStoppedAnimation(
          color,
        ),
      ),
    )
        : LinearProgressIndicator(
      minHeight: 2.0,
      value: value,
      valueColor: AlwaysStoppedAnimation(
        color,
      ),
    );
  }
}
