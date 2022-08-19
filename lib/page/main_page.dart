import 'package:flutter/material.dart';
import 'package:maumah/page/history/history_page.dart';
import 'package:maumah/page/history/history_page_web.dart';
import 'package:maumah/page/home_page.dart';
import 'package:maumah/page/profile/profile_page.dart';
import 'package:maumah/page/search/search_page.dart';
import 'package:maumah/page/search/search_page_web.dart';
import 'package:maumah/widget/custom_bottom_nav.dart';
import 'package:maumah/widget/navbar_web.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
				if(constrain.maxWidth <= 600) {
					return const MainPageMobile();
				} else {
					return const MainPageWeb();
				}
			}
    );
  }
}

class MainPageMobile extends StatefulWidget {
  const MainPageMobile({Key? key}) : super(key: key);

  @override
  State<MainPageMobile> createState() => _MainPageMobileState();
}

class _MainPageMobileState extends State<MainPageMobile> {
	int selectedIndex = 0;
	late final PageController pageController;
  List<Widget> pages = [
    const HomePage(),
		const SearchPage(),
		const HistoryPage(),
		const ProfilePage(),
  ];

	@override
  void initState() {
		pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			bottomNavigationBar: CustomBottomNav(
				selectedIndex: selectedIndex,
				onTap: (index) {
					setState(() {
						selectedIndex = index;
					});
					pageController.jumpToPage(index);
				},
			),
			body: SafeArea(
				child: PageView(
					controller: pageController,
					onPageChanged: (index) {
						setState(() {
									selectedIndex = index;
								});
					},
					children: pages,
				),
			),
		);
  }
}

class MainPageWeb extends StatefulWidget {
  const MainPageWeb({Key? key}) : super(key: key);

  @override
  State<MainPageWeb> createState() => _MainPageWebState();
}

class _MainPageWebState extends State<MainPageWeb> {
	int selectedIndex = 0;
	late final PageController pageController;
	List<Widget> pages = [
    const HomePage(),
		const SearchPageWeb(),
		const HistoryPageWeb(),
		const ProfilePage(),
  ];

	@override
  void initState() {
		pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			body: SafeArea(
				child: Padding(
				  padding: const EdgeInsets.symmetric(horizontal: 64,),
				  child: Center(
				    child: Stack(
				      children: [
				        Padding(
				          padding: const EdgeInsets.only(top: 75),
				          child: PageView(
									controller: pageController,
									onPageChanged: (index) {
										setState(() {
												selectedIndex = index;
											});
									},
				          	children: pages,
				          ),
				        ),
								NavBarWeb(
									selectedIndex: selectedIndex, 
									onTap: (index) {
										setState(() {
											selectedIndex = index;
										});
										pageController.jumpToPage(index);
									}
								)
				      ],
				    ),
				  ),
				),
			),
		);
  }
}


