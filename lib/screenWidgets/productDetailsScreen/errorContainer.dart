import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final double height;
  final String message;

  const ErrorContainer({Key key, this.height = 150, this.message = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Icon(Icons.error, size: 40, color: Colors.green[300]),
          SizedBox(width: 10),
          Text(
            message,
            style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.green[300], fontSize: 25),
          ),
        ],
      ),
    );
  }
}
