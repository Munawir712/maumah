import 'package:flutter/material.dart';

import '../page/constan.dart';

class NavBarWeb extends StatelessWidget {
	final int selectedIndex;
  final Function(int index) onTap;
  const NavBarWeb({Key? key, required this.selectedIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
			height: 70,
			width: double.infinity,
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
			decoration: const BoxDecoration(
				color: primaryColor,
			),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					Container(
						width: 50,
						height: 50,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(8),
						),
						child: Image.asset("assets/images/logo.png"),
					),
					// SizedBox(width: 100,),
					const Spacer(),
					InkWell(
						onTap: (){
							onTap(0);
						},
						child: Column(
							children: [
								Text(
									"Home",
									style: selectedIndex == 0 
										? textStyle.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
										: textStyle.copyWith(color: Colors.white30, fontSize: 16, fontWeight: FontWeight.w500),
								),
								AnimatedContainer(
									duration: const Duration(milliseconds: 200),
									height: 4, 
									width: selectedIndex == 0 ? 50 : 20,
									decoration: BoxDecoration(
										color: selectedIndex == 0 ? Colors.white : Colors.transparent,
										borderRadius: BorderRadius.circular(8)
									),
								),
										
							],
						),
					),
					const SizedBox(width: 16,),
					InkWell(
						onTap: (){
							onTap(1);
						},
						child: Column(
							children: [
								Text(
									"Search",
									style: selectedIndex == 1 
										? textStyle.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
										: textStyle.copyWith(color: Colors.white30, fontSize: 16, fontWeight: FontWeight.bold),
								),
								AnimatedContainer(
									duration: const Duration(milliseconds: 200),
									height: 4, 
									width: selectedIndex == 1 ? 50 : 20,
									decoration: BoxDecoration(
										color: selectedIndex == 1 ? Colors.white : Colors.transparent,
										borderRadius: BorderRadius.circular(8)
									),
								)
							],
						),
					),
					const SizedBox(width: 16,),
					InkWell(
						onTap: (){
							onTap(2);
						},
						child: Column(
							children: [
								Text(
									"History",
									style: selectedIndex == 2 
										? textStyle.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
										: textStyle.copyWith(color: Colors.white30, fontSize: 16, fontWeight: FontWeight.bold),
								),
								AnimatedContainer(
									duration: const Duration(milliseconds: 200),
									height: 4, 
									width: selectedIndex == 2 ? 50 : 20,
									decoration: BoxDecoration(
										color: selectedIndex == 2 ? Colors.white : Colors.transparent,
										borderRadius: BorderRadius.circular(8)
									),
								)
							],
						),
					),
					const SizedBox(width: 16,),
					InkWell(
						onTap: (){
							onTap(3);
						},
						child: Column(
							children: [
								Text(
									"Profile",
									style: selectedIndex == 3 
										? textStyle.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
										: textStyle.copyWith(color: Colors.white30, fontSize: 16, fontWeight: FontWeight.bold),
								),
								AnimatedContainer(
									duration: const Duration(milliseconds: 200),
									height: 4, 
									width: selectedIndex == 3 ? 50 : 20,
									decoration: BoxDecoration(
										color: selectedIndex == 3 ? Colors.white : Colors.transparent,
										borderRadius: BorderRadius.circular(8)
									),
								)
							],
						),
					),
					
				],
			),
		);
  }
}