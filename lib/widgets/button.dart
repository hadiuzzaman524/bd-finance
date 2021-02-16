import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key key,
    @required this.title,
    @required this.onPress,
  }) : super(key: key);

  final Widget title;
  final Function onPress;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: title,
        ),
      ),
    );
  }
}
