import 'package:flutter/material.dart';

const kMinStyle = TextStyle(
  fontSize: 13,
  letterSpacing: 1.2,
);

//border
var kOutLineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color : Colors.transparent),
);

var kOutlineErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.transparent),
);

//Custom Loader btm

const kLoaderBtn = SizedBox(
  height: 20,
  width: 20,
  child: CircularProgressIndicator(
    strokeWidth: 1.5,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  ),
);