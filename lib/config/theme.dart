import 'package:flutter/material.dart';

ThemeData temaClaro = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    hintStyle: TextStyle(fontSize: 14.0),
    labelStyle: TextStyle(fontSize: 16.0),
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(5.0),
      borderSide: new BorderSide(
        style: BorderStyle.none,
        width: 0,
      ),
    ),
    focusedBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(5.0),
      borderSide: new BorderSide(
        style: BorderStyle.none,
        width: 0,
      ),
    ),
  ),
);