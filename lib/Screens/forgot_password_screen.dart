import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:q8_pulse/ConstantVarables.dart';
import 'package:q8_pulse/Controllers/UserController.dart';
import 'package:q8_pulse/Widgets/SharedWidget.dart';
import 'package:q8_pulse/utils/app_Localization.dart';

class ForgotPasswordScreen extends StatefulWidget {
  createState() => ForgotPasswordView();
}

class ForgotPasswordView extends StateMVC<ForgotPasswordScreen> {
  ForgotPasswordView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;
  bool is_loading = false;

  String forgot = "forgot";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: ConstantVarable.updateScaffoldkey,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {},
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: <Widget>[
                      Text(
                          DemoLocalizations.of(context)
                              .title['_reset_password'],
                          style: TextStyle(
                            fontSize: 15,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 150,
                    left: 32,
                    right: 32,
                  ),
                  child: Form(
                    key: ConstantVarable.updateFormKey,
                                      child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(22)),
                          height: 45,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: ConstantVarable.phoneControllerReg,
                                    validator: (val) =>
                                        _userController.validatePhone(val),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          right: 16.0, top: 0.0, left: 16),
                                      hintText: DemoLocalizations.of(context)
                                          .title['_your_phone_numper'],
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400], fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        is_loading?
                        SharedWidget.loading(context):
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: InkWell(
                            child: Container(
                              height: 45.0,
                              width: MediaQuery.of(context).size.width,
                              child: Material(
                                color: const Color(0xffFFE240),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 0.0, bottom: 0.0),
                                    child: Text(
                                      DemoLocalizations.of(context)
                                          .title['_reset_password'],
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                                setState(() {
                                      is_loading = true;
                                    });

                               _userController.forgotPasswordLogic(context,ConstantVarable.phoneControllerReg.text);
                                    Timer(Duration(seconds: 2), () {
                                      setState(() {
                                        is_loading = false;
                                      });
                                    });


                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
