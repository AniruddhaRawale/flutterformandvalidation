import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

//to get min length in password using package
//MinLengthValidator(6,
//  errorText:"Should Be Atleast 6 Characters "))

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Form & Validation",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //global key is used for validation
  //global key is used to mention change in state
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  String validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else if(value.length<6) {
      return "Should Be Atleast 6 Characters";
    }else if(value.length >15){
      return "Should Not Be More Than 15 Characters";
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
        appBar: AppBar(
        title: Text("Forms And Validation"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Form(

                autovalidate: true,
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required * "),
                        EmailValidator(errorText: "Not A Valid Mail"),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.00),
                      child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password",
                          ),
                        validator: validatepass,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: RaisedButton(
                        onPressed: validate,
                        child: Text("Login"),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
