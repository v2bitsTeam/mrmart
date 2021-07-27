import 'dart:io';

import 'package:mr_mart/Controllers/pincodes_controller.dart';
import 'package:mr_mart/Models/pincodes.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/Widgets/DefaultTextField.dart';
import 'package:mr_mart/Widgets/ShowMessage.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/ui_components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetUserLocationScreen extends StatefulWidget {
  @override
  _GetUserLocationScreenState createState() => _GetUserLocationScreenState();
}

class _GetUserLocationScreenState extends State<GetUserLocationScreen> {
  PincodesController pincodesController = Get.find();
  bool update = Get.arguments ?? false;
  TextEditingController pincodeTextController;
  List<PincodeData> suggestions = [];

  @override
  void initState() {
    super.initState();
    pincodeTextController = TextEditingController();
    if (update && pincodesController.userPincodeData.value.pincode != null) {
      pincodeTextController.text =
          '${pincodesController.userPincodeData.value.pincode} - ${pincodesController.userPincodeData.value.address}';
    }
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?',
                style: Theme.of(context).textTheme.headline1),
            content: Text('Do you want to exit the App?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.blue)),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: Text('Yes',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.red)),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Enter Your Location"),
        automaticallyImplyLeading: update,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          height: Get.height,
          color: Colors.grey[200],
          padding:
              EdgeInsets.only(top: 4.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (update &&
                  pincodesController.userPincodeData.value.pincode != null)
                Container(
                  padding: EdgeInsets.only(
                    bottom: 0.0,
                    left: Dimension.padding,
                    right: Dimension.padding,
                  ),
                  child: Text(
                    'Current Pincode is ${pincodesController.userPincodeData.value.pincode}',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(color: Themes.textColor),
                  ),
                ),
              Expanded(
                flex: MediaQuery.of(context).viewInsets.bottom == 0.0 ? 1 : 2,
                child: Card(
                  margin: EdgeInsets.only(
                    top: Dimension.padding,
                    left: Dimension.padding,
                    right: Dimension.padding,
                    bottom: Dimension.size10,
                  ),
                  elevation: Dimension.cardElevation,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: Dimension.padding,
                      left: Dimension.padding,
                      right: Dimension.padding,
                      top: 0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: Dimension.padding,
                          ),
                          color: Colors.white,
                          child: Text(
                            "Enter your pincode and choose your location",
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      color: Themes.textColor,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        defaultTextField(
                          controller: pincodeTextController,
                          label: "Enter your pincode",
                          textInputType: TextInputType.phone,
                          isRequired: true,
                          onChanged: (e) => updateSuggestions(e),
                        ),
                        if (suggestions.length > 0)
                          Expanded(
                            child: ListView.builder(
                              itemCount: suggestions.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    pincodeTextController.text =
                                        '${suggestions[index].pincode} - ${suggestions[index].address}';
                                    setState(() {
                                      pincodesController
                                          .userPincodeData(suggestions[index]);
                                      suggestions = [];
                                    });
                                  },
                                  tileColor: index % 2 == 0
                                      ? Colors.grey[100]
                                      : Colors.grey[50],
                                  title: Text(
                                      '${suggestions[index].pincode} - ${suggestions[index].address}'),
                                );
                              },
                            ),
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (suggestions.length == 0)
                Expanded(
                  flex: MediaQuery.of(context).viewInsets.bottom == 0.0 ? 2 : 1,
                  child: Container(),
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimension.padding),
                child: DefaultButton(
                  color: Themes.primary2,
                  text: 'SUBMIT',
                  press: () {
                    if (pincodesController.userPincodeData.value.pincode !=
                        null) {
                      Get.toNamed(MAIN_PAGE);
                    } else {
                      errorMessage(context, message: "Pincode is required");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateSuggestions(e) {
    suggestions = [];
    pincodesController.pincodes.forEach((pincodeData) {
      if (pincodeData.pincode.contains(e)) {
        setState(() {
          suggestions.add(pincodeData);
        });
      }
    });
    if (e.length == 0 || e.length > 6) {
      setState(() {
        suggestions = [];
      });
    }
  }
}
