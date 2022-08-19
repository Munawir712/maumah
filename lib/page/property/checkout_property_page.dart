import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/property/checkout_property_page_mobile.dart';
import 'package:maumah/page/property/checkout_property_page_web.dart';

class CheckoutPropertyPage extends StatelessWidget {
	final PropertyModel property;
	final int lamaSewa;
  const CheckoutPropertyPage({Key? key, required this.property, required this.lamaSewa, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
			builder: (context, constraint) {
				if(constraint.maxWidth <= 600) {
					return CheckoutPropertyPageMobile(property: property, lamaSewa: lamaSewa);
				} else {
					return CheckoutPropertyPageWeb(property: property, lamaSewa: lamaSewa);
				}
			}
		);
  }
}