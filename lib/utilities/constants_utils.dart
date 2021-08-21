import 'package:flutter/material.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white54,
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
