import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class LoginModel extends ChangeNotifier{

      get isVisible => _isVisible;
      bool _isVisible = false;
      set isVisible (value){
      _isVisible =value;
      notifyListeners();
    }

    get isValid => _isValid;
    bool _isValid =false;
    void isValidMobile(String mobile){
      if (mobile.length != 10){
        _isValid = true;
      }else {
        _isValid = false;
      }
      notifyListeners();
    }

}