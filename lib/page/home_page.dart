import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/constan.dart';
import 'package:maumah/page/property/property_detail_page.dart';
import 'package:maumah/widget/card_property.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
				child: SingleChildScrollView(
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							//* App bar
							Container(
								height: 100,
								width: double.infinity,
								padding: const EdgeInsets.only(
									top: 20,
									left: defaultMargin,
									right: defaultMargin,
									bottom: 16,
								),
								color: primaryColor,
								child: Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: [
										Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												Text(
													"Maumah",
													style: textStyle.copyWith(
															color: Colors.white,
															fontSize: 20,
															fontWeight: FontWeight.w700),
												),
												Text(
													"Temukan property terbaik",
													style: textStyle.copyWith(
															color: const Color(0xFFDBDBDB), fontSize: 12),
												),
											],
										),
										Container(
											// width: 30,
											height: 38,
											// padding: EdgeInsets.all(1),
											alignment: Alignment.center,
											decoration: BoxDecoration(
												color: secondColor,
												borderRadius: BorderRadius.circular(4),
											),
											child: Center(
												child: IconButton(
														onPressed: () {},
														icon: const Icon(
															Icons.notifications_none,
															size: 24,
															color: Colors.white,
														)),
											),
										),
									],
								),
							),
							const SizedBox(
								height: 30,
							),
							Padding(
								padding: const EdgeInsets.only(left: defaultMargin, bottom: 10),
								child: Text("Di sekitarmu", style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
							),
							Container(
								height: 201,
								child: ListView.builder(
									scrollDirection: Axis.horizontal,
									itemCount: listProperty.length,
									itemBuilder: (context, index) {
										return Padding(
											padding: EdgeInsets.only(left: index == 0 ? defaultMargin : 0, right: 16),
											child: InkWell(
												onTap: () {
													PropertyModel property = listProperty[index];
													Navigator.push(context, MaterialPageRoute(builder: ((context) => PropertyDetailPage(property: property))));
												},
												child: CardProperty(property: listProperty[index],),
											),
										);
									}
								),
							),

							Padding(
								padding: const EdgeInsets.only(left: defaultMargin, bottom: 10, top: 20),
								child: Text("Kategori", style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
							),

							Container(
								height: 80,
							  child: ListView(
							  	shrinkWrap: true,
							  	scrollDirection: Axis.horizontal,
							  	children: [
										const SizedBox(width: defaultMargin,),
							  		kategoriItem(icon: const Icon(Icons.house_rounded, color: Colors.white,), label: "Rumah"),
										const SizedBox(width: 16,),
							  		kategoriItem(icon: const Icon(Icons.house_siding_rounded, color: Colors.white,), label: "Kos"),
										const SizedBox(width: 16,),
							  		kategoriItem(icon: const Icon(Icons.apartment_rounded, color: Colors.white,), label: "Aparment"),
							  	],
							  ),
							),
							

					
						],
					),
				),
			)
		);
  }

  Column kategoriItem({required Icon icon, required String label}) {
    return Column(
			children: [
				Container(
					width: 50,
					height: 50,
					margin: const EdgeInsets.only(bottom: 5),
					alignment: Alignment.center,
					decoration: const BoxDecoration(
						color: primaryColor,
						shape: BoxShape.circle,
					),
					child: icon,
				),
				Text(label, style: textStyle.copyWith(fontWeight: FontWeight.w500),),
			],
		);
  }

}
