
import 'package:flutter/material.dart';

class PopUpTextField extends StatelessWidget {
  final String title;
  final Function function;
  final IconData icon;

  PopUpTextField({
    @required this.title,
    @required this.function,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Center(
                child: InkWell(
                  onTap: function,
                  child: Icon(icon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
