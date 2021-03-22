import 'package:flutter/material.dart';
import 'package:login_ui/Global.dart';
import 'package:login_ui/viewmodel/login_model.dart';

import 'package:login_ui/widgets/button_widgets.dart';
import 'package:login_ui/widgets/textield_widget.dart';
import 'package:login_ui/widgets/wave_widget.dart';
import 'package:provider/provider.dart';




void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (context)=>LoginModel(),
      child: MaterialApp(
       
        debugShowCheckedModeBanner: false,
        home: MyLoginPage(),
      ),
    );
  }
}


class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {

   final model = Provider.of<LoginModel>(context);
   final size = MediaQuery.of(context).size;
   final bool  keyBoardOpen= MediaQuery.of(context).viewInsets.bottom>0;
    return Scaffold(
       backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: size.height-150,
            color: Global.redox,
          ),

          AnimatedPositioned(
            duration :Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyBoardOpen ? -size.height /3.7 :0.0,
            child: WaveWidget(
              size :size,
              yOffset : size.height/3.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login',style: TextStyle(color: Colors.white, fontSize: 40.0,fontWeight: FontWeight.w900),),
              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldWidget(
                    labelText :'Username',
                  obscureText: false,
                  prefixIconData:Icons.mail_outline,
                  suffixIconData:  model.isValid ? Icons.check :null,
                  onChanged: (value){
                      model.isValid(value);
                      },
                    ),
                    SizedBox(height: 10,),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    TextFieldWidget(
                    labelText :'Password',
                     obscureText: model.isVisible ? false : true,
                    //obscureText: false,
                    prefixIconData:Icons.lock_outlined,
                    suffixIconData:  model.isVisible ? Icons.visibility :Icons.visibility_off,
                    ),
                    SizedBox(height: 10,),
                    Text('Forgot Password?',style: TextStyle(color:Global.redox),)
                    ],
                    ),
                    SizedBox(height: 20,),
                    ButtonWidgets(
                    title :'Sign in',
                    hasBorder: false,
                    ),

                SizedBox(height: 10,),
                ButtonWidgets
                  (
                    title :'Sign up',
                    hasBorder: true,
                ),

              ],
            ),
          ),
        ],
      ),
    );





  }
}
