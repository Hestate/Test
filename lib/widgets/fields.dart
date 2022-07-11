import 'package:flutter/material.dart';

import '../utils/decorations.dart';

class LoginField extends StatelessWidget {
  const LoginField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Login',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RegField extends StatelessWidget {
  const RegField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Login',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                ),
                validator: (value) => null,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Container(
            decoration: AppFieldBoxDecoration.fieldDecoration,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Confirm Password',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
