import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/constan.dart';
import 'package:maumah/widget/card_property.dart';

class SearchPageWeb extends StatelessWidget {
  const SearchPageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search",
                    style: textStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 16)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list_alt))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 45,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFDEDEDE)),
            child: Row(
              children: [
                const Expanded(
                  child:TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cancel_sharp,
                      color: Colors.grey.shade700,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
					LayoutBuilder(
						builder: (context, constraints) {
							if(constraints.maxWidth < 700) {
								return const PropertyGrid(gridCount: 2,);
							} else if(constraints.maxWidth < 800) {
								return const PropertyGrid(gridCount: 3,);
							} else {
								return const PropertyGrid(gridCount: 4);
							}
						},
					),
					
        ],
      ),
    );
  }
}

class PropertyGrid extends StatelessWidget {
	final int gridCount;
  const PropertyGrid({
    Key? key, required this.gridCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
    	crossAxisCount: gridCount,
    	crossAxisSpacing: 8,
    	mainAxisSpacing: 5,
    	padding: const EdgeInsets.symmetric(horizontal: 16),
    	shrinkWrap: true,
    	children: listProperty.map((e) {
    		return CardProperty(
    			height: 240,
    			property: e,
    		);
    	}).toList(),
    );
  }
}
