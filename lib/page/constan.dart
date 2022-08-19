

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// size
const double defaultMargin = 26;

// color
const Color primaryColor = Color(0xFF008585);
const Color secondColor = Color(0xFF18C2B8);

// textStyle
const TextStyle textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'poppins');

// assets path
const assets = "assets";
const aIcon = "assets/icon";
const font = "assets/fonts";

final numberFormat = NumberFormat.currency(
		symbol: "RP ",
		decimalDigits: 0,
		locale: "id-ID"
);