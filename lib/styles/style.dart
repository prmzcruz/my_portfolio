import 'package:flutter/material.dart';

import '../constants/colors.dart';

BoxDecoration kHederDecoration = BoxDecoration(
  color: CustomColor.surface.withOpacity(.82),
  borderRadius: BorderRadius.circular(18),
  border: Border.all(color: CustomColor.border),
  boxShadow: const [
    BoxShadow(color: Color(0x33000000), blurRadius: 24, offset: Offset(0, 10)),
  ],
);
