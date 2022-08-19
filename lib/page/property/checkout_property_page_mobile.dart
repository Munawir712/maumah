import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/constan.dart';

class CheckoutPropertyPageMobile extends StatefulWidget {
	final PropertyModel property;
	final int lamaSewa;
  const CheckoutPropertyPageMobile({Key? key, required this.property, required this.lamaSewa}) : super(key: key);

  @override
  State<CheckoutPropertyPageMobile> createState() => _CheckoutPropertyPageMobileState();
}

class _CheckoutPropertyPageMobileState extends State<CheckoutPropertyPageMobile> {
	late int lamaSewa;

	@override
  void initState() {
		lamaSewa = widget.lamaSewa;
    super.initState();
  }
	
  @override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: const Color(0xffE5E5E5),
			appBar: AppBar(
				leading: IconButton(
					onPressed: () {
						Navigator.pop(context);
					},
					icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
				),
				title: Text("Checkout", style: textStyle.copyWith(fontSize: 16, color: Colors.white),),
				backgroundColor: primaryColor,
				centerTitle: true,
				elevation: 0,
			),
			bottomNavigationBar: Container(
				padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
				color: Colors.white,
			  child: Row(
			  	mainAxisAlignment: MainAxisAlignment.spaceBetween,
			  	children: [
			  		Column(
			  			crossAxisAlignment: CrossAxisAlignment.start,
			  			mainAxisSize: MainAxisSize.min,
			  			children: [
			  				Text("Total Bayar", style: textStyle.copyWith(fontSize: 12, color: Colors.black45),),
			  				Text(
									numberFormat.format(widget.property.harga*lamaSewa), 
									style: textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
								),
			  			],
			  		),
						SizedBox(
							height: 40,
							width: 80,
						  child: ElevatedButton(
						  	onPressed: (){},
						  	style: ElevatedButton.styleFrom(
						  		primary: primaryColor,
						  		textStyle: textStyle.copyWith(fontWeight: FontWeight.w600),
						  	), 
						  	child: const Text("Bayar")
						  ),
						),
			  	],
			  ),
			),
			body: SingleChildScrollView(
				child: Column(
					children: [
						const SizedBox(height: 10,),
						itemSection(),
						const SizedBox(height: 10,),
						pembayaranSection(),
						detailSection(),
					],
				),
			),
		);
  }

  

  Container itemSection() {
    return Container(
			width: double.infinity,
			color: Colors.white,
			padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text("Property yang di${widget.property.tipe}", style: textStyle.copyWith( fontWeight: FontWeight.w600),),
					const Divider(),
					Row(
						crossAxisAlignment: CrossAxisAlignment.center,
						children: [
							Container(
								width: 80,
								height: 80,
								decoration: BoxDecoration(
									color: Colors.grey,
									borderRadius: BorderRadius.circular(4),
									image: widget.property.imagesPath != null ? DecorationImage(
										image: NetworkImage(widget.property.imagesPath![0]),
										fit: BoxFit.cover
									) : null,
								),
							),
							const SizedBox(width: 10,),
							Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Text(widget.property.nama, style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),),
									Row(
									  children: [
									    Text(
									    	numberFormat.format(widget.property.harga), 
									    	style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
									    ),
											Text(" - ${widget.property.jangkaWaktu}", style: textStyle.copyWith(fontSize: 14, color: Colors.black45, fontWeight: FontWeight.w400),),
									  ],
									),
									Row(
										children: [
											Text("kategori", style: textStyle.copyWith(fontSize: 14, color: Colors.black45, fontWeight: FontWeight.w400),),
											Container(
												margin: const EdgeInsets.only(left: 5),
												padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
												decoration: BoxDecoration(
														color: primaryColor,
														borderRadius: BorderRadius.circular(4),
												),
												child: Text(
													widget.property.kategori,
													style: textStyle.copyWith(
														fontSize: 12,
														fontWeight: FontWeight.w500,
														color: Colors.white,
													),
												),
											),
										],
									),
								],
							),
						],
					),
					Row(
						crossAxisAlignment: CrossAxisAlignment.center,
						children: [
							Text("Lama sewa", style: textStyle.copyWith(color: Colors.black54),),
							const Spacer(flex: 1,),
							IconButton(
								onPressed: (){
									setState((){
										if(lamaSewa > 1) {
											lamaSewa--;
										}
									});
								}, 
								icon: const Icon(Icons.remove_circle_outline_rounded, color: secondColor,)
							),
							Text("$lamaSewa", style: textStyle.copyWith(color: Colors.black),),
							IconButton(
								onPressed: (){
									setState(() {
										lamaSewa++;
									});
								}, 
								icon: const Icon(Icons.add_circle_outline_rounded, color: secondColor,)
							),
							Text("Bulan", style: textStyle.copyWith(color: Colors.black54),),

						],
					),
				],
			),
		);
  }

	Container pembayaranSection() {
    return Container(
			color: Colors.white,
			width: double.infinity,
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text("Pembayaran dan Penerima", style: textStyle.copyWith(fontWeight: FontWeight.w600),),
					const SizedBox(height: 12,),
					Container(
						padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
						decoration: BoxDecoration(
							border: Border.all(color: const Color(0xFFE5E5E5)),
							borderRadius: BorderRadius.circular(4),
						),
						child: Row(
							children: [
								const Icon(Icons.description, color: Colors.black54,),
								const SizedBox(width: 5,),
								Text(
									"Metode pembayaran", style: textStyle.copyWith(color: Colors.black54, fontWeight: FontWeight.w600),
								),
								const Spacer(),
								const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.black54,)
							],
						),
					),
				],
			),
		);
  }

	Container detailSection() {
    return Container(
			color: Colors.white,
			width: double.infinity,
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Text("Nama penerima", style: textStyle.copyWith(fontWeight: FontWeight.w500, ),),
							Text("Budi", style: textStyle.copyWith(fontWeight: FontWeight.w400, color: Colors.black54),),
						],
					),
					const SizedBox(height: 5,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Text("Harga per bulan", style: textStyle.copyWith(fontWeight: FontWeight.w500, ),),
							Text(numberFormat.format(widget.property.harga), style: textStyle.copyWith(fontWeight: FontWeight.w400, color: Colors.black54),),
						],
					),
					const SizedBox(height: 5,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Text("Lama sewa", style: textStyle.copyWith(fontWeight: FontWeight.w500, ),),
							Text("$lamaSewa ${widget.property.jangkaWaktu}", style: textStyle.copyWith(fontWeight: FontWeight.w400, color: Colors.black54),),
						],
					),
					const SizedBox(height: 5,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Text("Subtotal", style: textStyle.copyWith(fontWeight: FontWeight.w500, ),),
							Text(numberFormat.format(widget.property.harga*lamaSewa), style: textStyle.copyWith(fontWeight: FontWeight.w400, color: Colors.black54),),
						],
					),
				],
			),
		);
  }



}