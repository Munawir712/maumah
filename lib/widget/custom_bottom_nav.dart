import 'package:flutter/material.dart';
import 'package:maumah/page/constan.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomBottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      color: Colors.white,
			padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          itemBottomNav(index: 0, iconName: "$aIcon/home", label: "Home"),
          itemBottomNav(index: 1, iconName: "$aIcon/search", label: "Search"),
          itemBottomNav(
              index: 2, iconName: "$aIcon/history", label: "History"),
          itemBottomNav(index: 3, iconName: "$aIcon/person", label: "Profile"),
        ],
      ),
    );
  }

  Widget itemBottomNav(
      {required int index, required String iconName, String? label}) {
    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                curve: Curves.easeInQuad,
                duration: const Duration(milliseconds: 300),
                height: selectedIndex == index ? 38 : 28,
                width: selectedIndex == index ? 38 : 28,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                height: 38,
                width: 38,
                child: Image.asset(selectedIndex == index
                    ? "$iconName.png"
                    : "${iconName}_non.png"),
              ),
            ],
          ),
          if (selectedIndex == index && label != null)
            Text(label,style: textStyle.copyWith(color: primaryColor,fontSize: 12,fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}