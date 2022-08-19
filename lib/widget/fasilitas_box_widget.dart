import 'package:flutter/material.dart';
import 'package:maumah/model/property_model.dart';
import 'package:maumah/page/constan.dart';

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