import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/constan.dart';

class CardProperty extends StatelessWidget {
  final PropertyModel property;
  final double width;
  final double? height;

  const CardProperty({
    Key? key,
    required this.property,
    this.width = 200,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFF3F3F3),
              offset: Offset(0, 6),
              blurRadius: 16,
            )
          ]),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFDEDEDE),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                image: property.imagesPath != null
                    ? DecorationImage(
                        image: NetworkImage(property.imagesPath![0]),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 10,
                    bottom: -12,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(property.kategori,
                          style: textStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: StatefulBuilder(builder: (context, setState) {
                        return IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  property.isBookmark = !property.isBookmark;
                                },
                              );
                            },
                            icon: Icon(
                              property.isBookmark
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: Colors.white,
                            ));
                      })),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 6,
              right: 6,
              top: 12,
              // bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.nama,
                  style: textStyle.copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  property.lokasi,
                  style: textStyle.copyWith(
                      fontSize: 12, color: const Color(0xFF555555)),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      property.tipe,
                      style: textStyle.copyWith(fontWeight: FontWeight.w400),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          numberFormat.format(property.harga),
                          style: textStyle.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          property.jangkaWaktu,
                          style: textStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
