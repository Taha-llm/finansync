import 'package:flutter/material.dart';
import 'package:hope/utils/colors.dart';

class SearchArea extends StatelessWidget {
  
  const SearchArea({
    super.key, 
    });

  @override
  Widget build(BuildContext context) {

    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context) 
      );

    return TextField(
      decoration: InputDecoration(
        hintText:'Search' ,
        prefixIcon: Icon(Icons.search),
        border: inputBorder,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(width: 3.0)),
        filled: true,
        fillColor: Colors.grey,
        prefixIconColor: buttonsBackground2,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: TextInputType.text    
    );
  }
}