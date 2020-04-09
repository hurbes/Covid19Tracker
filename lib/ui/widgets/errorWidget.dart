
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 200,
          child: Center(
              child: Text("NO Data Found",
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                  ))),
        ),
      );
  }
}