import 'package:flutter/material.dart';
import 'package:login_ui/Global.dart';
import 'package:login_ui/viewmodel/login_model.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

   TextFieldWidget(
      {Key key,
        this.labelText,
        this.prefixIconData,
        this.suffixIconData,
        this.obscureText,
        this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final model = Provider.of<LoginModel>(context);
    return TextField(
      onChanged: onChanged,
      cursorColor: Global.redox,
      obscureText: obscureText,
      decoration: InputDecoration (
        labelText: labelText,

        prefixIcon:Icon(
          prefixIconData,
          size: 18,
          color: Global.redox,
        ),
        filled:true,

        enabledBorder:UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Global.redox),
        ),

          suffixIcon: GestureDetector(
            onTap: (){
            model.isVisible=!model.isVisible;
            },
            child: Icon(
              suffixIconData,
              size: 18,
              color: Global.redox,),
          ),
           labelStyle: TextStyle(color: Global.redox,)
      ),

    );
  }
}
