import 'package:flutter/material.dart';

class BackBtnPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(7),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
