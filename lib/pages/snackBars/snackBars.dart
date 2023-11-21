import 'package:flutter/material.dart';


class SnackBar_stillEmpety extends StatefulWidget {

  @override
  _SnackBar_stillEmpetyState createState() => _SnackBar_stillEmpetyState();
}

class _SnackBar_stillEmpetyState extends State<SnackBar_stillEmpety> {
  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
