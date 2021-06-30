import 'package:MrMart/Controllers/pincodes_controller.dart';
import 'package:MrMart/Models/pincodes.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/Widgets/DefaultTextField.dart';
import 'package:MrMart/Widgets/ShowMessage.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/ui_components/default_button.dart';
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
              /*Container(
                child: Image.asset(
                  'assets/images/checkout/checkout_header_image.png',
                  fit: BoxFit.fill,
                ),
              ),*/
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: Container(
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
                    left: Dimension.Padding,
                    right: Dimension.Padding),
                child: Text(
                  'Current Pincode is ${pincodesController.userPincodeData.value.pincode}',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Themes.Text_Color),
                ),
              ),
            Card(
              margin: EdgeInsets.only(
                  top: Dimension.Padding,
                  left: Dimension.Padding,
                  right: Dimension.Padding,
                  bottom: Dimension.Size_10),
              elevation: Dimension.card_elevation,
              clipBehavior: Clip.antiAlias,
              child: Container(
                padding: EdgeInsets.all(Dimension.Padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter your pincode and choose your location",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Themes.Text_Color),
                      textAlign: TextAlign.center,
                    ),
                    DefaultTextField(
                        controller: pincodeTextController,
                        label: "Enter your pincode",
                        textInputType: TextInputType.phone,
                        isRequired: true,
                        onChanged: (e) => updateSuggestions(e)),
                    SizedBox(
                      height: Dimension.Size_10,
                    ),
                    if (suggestions.length > 0)
                      ListView.builder(
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
                            title: Text(
                                '${suggestions[index].pincode} - ${suggestions[index].address}'),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimension.Padding),
              child: DefaultButton(
                color: Themes.Primary2,
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
