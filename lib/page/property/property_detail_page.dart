import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/property/property_detail_page_mobile.dart';
import 'package:maumah/page/property/property_detail_page_web.dart';

class PropertyDetailPage extends StatelessWidget {
	final PropertyModel property;
  const PropertyDetailPage({Key? key, required this.property, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
			builder: (builder, constraints) {
				if(constraints.maxWidth <= 600) {
					return PropertyDetailPageMobile(property: property,);
				} else {
					return PropertyDetailPageWeb(property: property);
				} 
			}
		);
  }
}