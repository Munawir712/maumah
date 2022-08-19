import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/constan.dart';
import 'package:maumah/widget/card_property.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
                const EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12),
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
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFDEDEDE)),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
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
          ListView.separated(
						physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            shrinkWrap: true,
						itemCount: listProperty.length,
						separatorBuilder: (context, index) => const SizedBox(height: 16,),
						itemBuilder: (context, index) {
							return CardProperty(
								property: listProperty[index],
								height: 245,
							);
						},
          ),
        ],
      ),
    );
  }
}
