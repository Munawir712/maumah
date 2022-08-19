import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/constan.dart';
import 'package:maumah/page/property/checkout_property_page.dart';
import 'package:maumah/widget/fasilitas_box_widget.dart';

class PropertyDetailPageWeb extends StatefulWidget {
	final PropertyModel property;
  const PropertyDetailPageWeb({Key? key, required this.property}) : super(key: key);

  @override
  State<PropertyDetailPageWeb> createState() => _PropertyDetailPageWebState();
}

class _PropertyDetailPageWebState extends State<PropertyDetailPageWeb> {
	int selectedIndex = 0;
	late final PageController pageController;
	final TextEditingController lamaSewaCount = TextEditingController(text: "1");
	int limit = 3;
	bool isReadmore = false;
	bool isShowmore = false;

	@override
  void initState() {
    pageController = PageController(initialPage: selectedIndex);
		super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
			child: GestureDetector(
				onTap: (() => FocusScope.of(context).unfocus()),
			  child: Scaffold(
			  	body: SingleChildScrollView(
			  	  child: Padding(
			  	    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 12),
			  	    child: SizedBox(
								width: 1200,
			  	      child: Column(
			  	        children: [
										header(),
			  	          Row(
											crossAxisAlignment: CrossAxisAlignment.start,
			  	            children: [
												Expanded(
													child: imageSlider(),
												),
												Expanded(
													child: content(),
												)
			  	            ],
			  	          ),
			  	        ],
			  	      ),
			  	    ),
			  	  ),
			  	),
			  ),
			),
		);
  }

  Padding content() {
    return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text(widget.property.nama, style: textStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w500),),
					Row(
						children: [
							const Icon(Icons.location_pin, size: 16, color: primaryColor,),
							const SizedBox(width: 5,),
							Text(widget.property.lokasi, style: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),),
						],
					),
					const SizedBox(height: 10,),
					Text.rich(
						TextSpan(
							text: "${numberFormat.format(widget.property.harga)} / ",
							style: textStyle.copyWith(fontSize: 20, color: primaryColor, fontWeight: FontWeight.w700),
							children: [
								TextSpan(
									text: widget.property.jangkaWaktu,
									style: textStyle.copyWith(color: Colors.black)
								),
							],
						),
					),
					const SizedBox(height: 20,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Text("Fasilitas", style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
							GestureDetector(
								onTap: () {
									setState(() {
										isShowmore = !isShowmore;
									});
								},
								child: Row(
									children: [
										Text("Selengkapnya", style: textStyle.copyWith(fontSize: 12, color: secondColor, fontWeight: FontWeight.w400),),
										Icon(isShowmore ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down, color: secondColor,),
									],
								)
							),
						],
					),
					const SizedBox(height: 5,),
					listFasilitas(),// 
					const SizedBox(height: 20,),
					Text("Deskirpsi", style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),),
					const SizedBox(height: 5,),
					Column(
						crossAxisAlignment: CrossAxisAlignment.end,
						children: [
							Text(
								widget.property.description,
								textAlign: TextAlign.justify, 
								style: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
								maxLines: isReadmore ? null : 3,
								overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
							),
							GestureDetector(
								onTap: (){
									setState(() {
										isReadmore = !isReadmore;
									});
								},
								child: Text(
									isReadmore ? "Lebih sedikit" : "Lebih banyak", 
									style: textStyle.copyWith(fontSize: 12, color: secondColor, fontWeight: FontWeight.w400),
								),
							),
						],
					),
					inputSewaAndButton(),
					const SizedBox(height: 150,),
				],
			),
		);
  }

	Widget header() {
    return SizedBox(
			height: 50,
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
					IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,)),
					Text("Detail Property", style: textStyle.copyWith(fontSize: 18, fontWeight:FontWeight.w600),),
					IconButton(
						onPressed: (){
							setState(() {
							  widget.property.isBookmark = !widget.property.isBookmark;
							});
						}, 
						icon: Icon(widget.property.isBookmark ? Icons.bookmark : Icons.bookmark_border, color: Colors.black,)
					)
				],
			),
		);
  }

  Widget inputSewaAndButton() {
    return SizedBox(
			child: Column(
				mainAxisSize: MainAxisSize.min,
					crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text("Lama Sewa", style: textStyle.copyWith(fontWeight: FontWeight.w500),),
					const SizedBox(height: 5,),
					Row(
						children: [
								Expanded(
									flex: 2,
									child: SizedBox(
										height: 45,
										child: TextField(
											controller: lamaSewaCount,
											keyboardType: TextInputType.number,
											decoration: InputDecoration(
												contentPadding: const EdgeInsets.only(left:10),
												hintText: "lama sewa..",
												focusColor: primaryColor,
												focusedBorder: OutlineInputBorder(
													borderSide: const BorderSide(color: secondColor, width: 2),
													borderRadius: BorderRadius.circular(8)
												),
												border: OutlineInputBorder(
													borderSide: const BorderSide(),
													borderRadius: BorderRadius.circular(8)
												)
											),
										),
									),
								),
								Expanded(
									child: Container(
										height: 45,
										margin: const EdgeInsets.only(left: 10),
										alignment: Alignment.center,
										decoration: BoxDecoration(
											color: primaryColor,
											borderRadius: BorderRadius.circular(8),
										),
										child: Text(widget.property.jangkaWaktu, style: textStyle.copyWith(color: Colors.white),),
									),
								),
							],
					),
					Container(
						padding: const EdgeInsets.symmetric( vertical: 10),
						height: 60,
						width: double.infinity,
						child: ElevatedButton(
								onPressed: (){
									Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPropertyPage(
										property: widget.property, 
										lamaSewa: int.parse(lamaSewaCount.text),
									)));
								},
								style: ElevatedButton.styleFrom(
									primary: primaryColor,
									textStyle: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600)
								), 
								child: const Text("Sewa"),
							),
					),
				],
			),
		);
  }


  Widget listFasilitas() {
		if(isShowmore) {
			return Wrap(
				spacing: 3,
				runSpacing: 4,
				children: widget.property.fasilitas!.map((e) {
					return FasilitasBoxWidget(fasilitas: e,);
				}).toList(),
			);
		} else {
			return SingleChildScrollView(
				scrollDirection: Axis.horizontal,
			  child: Row(
			  	children: widget.property.fasilitas!.map((e) {
			  		return Padding(
			  		  padding: const EdgeInsets.only(right: 3),
			  		  child: FasilitasBoxWidget(fasilitas: e),
			  		);
			  	}).toList(),
			  ),
			);
		}
    
  }

  Widget imageSlider() {
    return Column(
      children: [
        SizedBox(
					height: 300,
          child: Stack(
					alignment: Alignment.topCenter,
					children: [
						PageView(
						controller: pageController,
						onPageChanged: (index) {
							setState(() {
								selectedIndex = index;
							});
						},
						children: widget.property.imagesPath!.map((e) => Container(
								width: double.infinity,
								decoration: BoxDecoration(
									color: Colors.black54,
									borderRadius: BorderRadius.circular(8),
									image: DecorationImage(
										image: NetworkImage(e),
										fit: BoxFit.cover,
									),
								),
							)).toList()
					),
					// * Dot	
					Positioned(
						bottom: 10,
						child: SizedBox(
							child: Row(
								children: List.generate(widget.property.imagesPath!.length, (index) => Container(
									margin: const EdgeInsets.only(right: 10),
									height: 8, 
									width: 8, 
									decoration: BoxDecoration(
										shape: BoxShape.circle,
										color: index == selectedIndex ? primaryColor : Colors.white,
									),
								))
							),
						),
					),
				],
			),
        ),
				Container(
					height: 120,
					margin: const EdgeInsets.only(top: 16),
				  child: ListView(
				  	scrollDirection: Axis.horizontal,
				  	children: widget.property.imagesPath!.map((e){
				  		return Padding(
				  		  padding: const EdgeInsets.only(right: 16),
				  		  child: InkWell(
									onTap: () {
									  setState(() {
									    selectedIndex = widget.property.imagesPath!.indexOf(e);
									  });
										pageController.jumpToPage(selectedIndex);
									},
				  		    child: ClipRRect(
									borderRadius:BorderRadius.circular(8),
									child: Image.network(e)
								),
				  		  ),
				  		);
				  	}).toList(),
				  ),
				),
			
			],
    );
  }


  
}

