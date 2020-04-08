import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
                          child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Center(
                                child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Theme.of(context).primaryColorDark)),
                              )),
                        );
  }
}