import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;

  LoginTextField({
    this.label,
    this.icon,
    this.controller,
    this.obscureText: false,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  _LoginTextFieldState createState() => new _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'username',
        hintText: "hint",
        prefixIcon: Icon(Icons.lock)
      ),
      obscureText: true,
    );
  }
}
