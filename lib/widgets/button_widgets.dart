import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Global.dart';

class ButtonWidgets extends StatelessWidget {
      final String title;
      final bool hasBorder;



   ButtonWidgets({
     this.title,
     this.hasBorder,
   });

   @override
  Widget  build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Colors.white : Global.redox,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder ? Border.all(color: Global.redox,width:1.0,) :Border.fromBorderSide(BorderSide.none),
        ),

        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height:60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? Global.redox : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
