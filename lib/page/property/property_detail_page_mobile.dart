import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/constan.dart';
import 'package:maumah/page/property/checkout_property_page.dart';

class PropertyDetailPageMobile extends StatefulWidget {
	final PropertyModel property;
  const PropertyDetailPageMobile({Key? key, required this.property}) : super(key: key);

  @override
  State<PropertyDetailPageMobile> createState() => _PropertyDetailPageMobileState();
}

class _PropertyDetailPageMobileState extends State<PropertyDetailPageMobile> {
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
			  	body: Stack(
			  	  children: [
			  	    SingleChildScrollView(
			  	      child: content(),
			  	    ),
			  	    appBar(),
			  			Align(
			  				alignment: Alignment.bottomCenter,
			  			  child: bottomNav(),
			  			),
			  	  ],
			  	),
			  ),
			),
		);
  }

	Container appBar() {
    return Container(
			height: 50,
			padding: const EdgeInsets.symmetric(horizontal: 16),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
					IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,)),
					IconButton(
						onPressed: (){
							setState(() {
							  widget.property.isBookmark = !widget.property.isBookmark;
							});
						}, 
						icon: Icon(widget.property.isBookmark ? Icons.bookmark : Icons.bookmark_border, color: Colors.white,)
					)
				],
			),
		);
  }

  Widget bottomNav() {
    return Container(
			color: Colors.white,
			padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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
									child: Container(
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
										child: Text("Bulan", style: textStyle.copyWith(color: Colors.white),),
									),
								),
							],
					),
					Container(
						padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
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

	

  Widget content() {

    return Container(
      child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					imageSlider(),
					Padding(
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
								// Text("RP ${widget.property.harga} / ", style: textStyle.copyWith(fontSize: 20, color: primaryColor, fontWeight: FontWeight.w700),),
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
								
								const SizedBox(height: 150,),
							],
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
    return Container(
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
						child: Container(
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
    );
  }


  
}

class FasilitasBoxWidget extends StatelessWidget {
	final Fasilitas fasilitas;

  const FasilitasBoxWidget({
    Key? key, required this.fasilitas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    	padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    	decoration: BoxDecoration(
    		color: primaryColor,
    		borderRadius: BorderRadius.circular(4), 
    	),
    	child: Row(
    		mainAxisSize: MainAxisSize.min,
    		children: [
    			// Icon(Icons.wifi, color: Colors.white, size: 16,),
    			const SizedBox(width: 5,),
    			Text("${fasilitas.nama} ${fasilitas.jumlah}", style: textStyle.copyWith(color: Colors.white, fontSize: 12),),
    		],
    	),
    );
  }
}