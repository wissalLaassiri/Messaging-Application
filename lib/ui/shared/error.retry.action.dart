import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorRetryMessage extends StatelessWidget {
  String errorMsg;
  Function onAction;

  ErrorRetryMessage({this.errorMsg, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${errorMsg}"),
        RaisedButton(
          onPressed: onAction,
          child: Text(
            'Retry',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.indigo,
        )
      ],
    );
  }
}
