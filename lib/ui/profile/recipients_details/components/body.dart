import 'dart:io';

import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Models/user.dart';
import 'package:mr_mart/Widgets/ShowMessage.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:get/get.dart';
import 'package:mr_mart/ui_components/DefaultTextFieldProfileEdit.dart';
import 'package:mr_mart/ui_components/default_button.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  UserController userController = Get.find();
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController mobileController;
  TextEditingController locationController;
  TextEditingController cityController;
  TextEditingController stateController;
  TextEditingController pincodeController;
  bool isExpanded = false;
  bool canEdit = false;
  File image;
  dynamic imageData;
  bool imageSourceIsCamera;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController =
        TextEditingController(text: userController.user.value.name);
    emailController =
        TextEditingController(text: userController.user.value.email);
    mobileController =
        TextEditingController(text: userController.user.value.mobile);
    locationController =
        TextEditingController(text: userController.user.value.location);
    cityController =
        TextEditingController(text: userController.user.value.city);
    stateController =
        TextEditingController(text: userController.user.value.state);
    pincodeController =
        TextEditingController(text: userController.user.value.pincode);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    locationController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, .0),
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Recipients Details',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Text(
                      canEdit ? "Cancel" : "Edit",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: canEdit ? Colors.grey[700] : Themes.clearEdit,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        canEdit = !canEdit;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          recipientsDetailsView(
            userController.user.value,
            canEdit,
          ),
        ],
      ),
    );
  }

  Widget recipientsDetailsView(UserDetails user, bool canEdit) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: Dimension.cardElevation,
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: EdgeInsets.all(Dimension.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  canEdit
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              userController.user.value.profileImage.length !=
                                          0 &&
                                      image == null
                                  ? NetworkImage(AppConstant.mediaUrl +
                                      userController.user.value.profileImage)
                                  : image != null
                                      ? FileImage(image)
                                      : AssetImage(
                                          'assets/images/profile/user.jpg'),
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 36.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: Themes.buttonColor2,
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                                onPressed: () => chooseImage(),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  defaultTextFieldProfileEdit(
                      controller: mobileController,
                      label: 'Mobile',
                      enable: false,
                      backgroundColor: Colors.grey[50],
                      fontColor: Colors.grey[600]),
                  SizedBox(
                    height: 4.0,
                  ),
                  defaultTextFieldProfileEdit(
                      controller: nameController,
                      label: 'Name',
                      enable: canEdit,
                      backgroundColor:
                          canEdit ? Colors.grey[100] : Colors.grey[50],
                      fontColor: canEdit ? null : Colors.grey[600]),
                  SizedBox(
                    height: 4.0,
                  ),
                  defaultTextFieldProfileEdit(
                      controller: emailController,
                      label: 'Email',
                      enable: canEdit,
                      backgroundColor:
                          canEdit ? Colors.grey[100] : Colors.grey[50],
                      fontColor: canEdit ? null : Colors.grey[600]),
                  SizedBox(
                    height: 4.0,
                  ),
                  defaultTextFieldProfileEdit(
                    controller: locationController,
                    label: 'Address',
                    enable: canEdit,
                    backgroundColor:
                        canEdit ? Colors.grey[100] : Colors.grey[50],
                    fontColor: canEdit ? null : Colors.grey[600],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  defaultTextFieldProfileEdit(
                    controller: cityController,
                    label: 'City',
                    enable: canEdit,
                    backgroundColor:
                        canEdit ? Colors.grey[100] : Colors.grey[50],
                    fontColor: canEdit ? null : Colors.grey[600],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  defaultTextFieldProfileEdit(
                    controller: stateController,
                    label: 'State',
                    enable: canEdit,
                    backgroundColor:
                        canEdit ? Colors.grey[100] : Colors.grey[50],
                    fontColor: canEdit ? null : Colors.grey[600],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  defaultTextFieldProfileEdit(
                    controller: pincodeController,
                    label: 'Pincode',
                    enable: canEdit,
                    backgroundColor:
                        canEdit ? Colors.grey[100] : Colors.grey[50],
                    fontColor: canEdit ? null : Colors.grey[600],
                  ),
                  SizedBox(
                    height: Dimension.size10,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          canEdit
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                    top: 0,
                    bottom: 12.0,
                  ),
                  child: DefaultButton(
                    text: "Save Changes",
                    press: submitChanges,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  AlertDialog chooseImageSource() {
    return AlertDialog(
      actions: [
        Container(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                child: Text(
                  'CLOSE',
                  style: TextStyle(color: Colors.grey[500]),
                ),
                onPressed: () {
                  setState(() => imageSourceIsCamera = null);
                  Navigator.of(context).pop();
                },
              ),
              Row(
                children: [
                  TextButton(
                    child: Text('Camera'),
                    onPressed: () {
                      setState(() => imageSourceIsCamera = true);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Gallery'),
                    onPressed: () {
                      setState(() => imageSourceIsCamera = false);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ),
        )
      ],
      title: Text('Upload Image'),
      content: Text('Select the source for image.'),
    );
  }

  Future<void> chooseImage() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => chooseImageSource(),
    );
    if (imageSourceIsCamera != null) {
      final pickedFile = await picker.pickImage(
          source:
              imageSourceIsCamera ? ImageSource.camera : ImageSource.gallery,
          preferredCameraDevice: CameraDevice.front);
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
      setState(() {});
    }
  }

  void submitChanges() async {
    UserDetails user = userController.user.value;
    if (image == null &&
        nameController.text == user.name &&
        emailController.text == user.email &&
        locationController.text == user.location &&
        cityController.text == user.city &&
        stateController.text == user.state &&
        pincodeController.text == user.pincode) {
      infoMessage(context, message: "No changes made");
      return;
    }
    if (GetUtils.isNullOrBlank(nameController.text)) {
      errorMessage(context, message: "Name is required");
      return;
    }
    if (!GetUtils.removeAllWhitespace(nameController.text.trim())
        .isAlphabetOnly) {
      errorMessage(context, message: "Invalid name");
      return;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      errorMessage(context, message: "Invalid Email");
      return;
    }
    if (GetUtils.isNullOrBlank(locationController.text)) {
      errorMessage(context, message: "Location is required");
      return;
    }
    if (GetUtils.isNullOrBlank(cityController.text)) {
      errorMessage(context, message: "City is required");
      return;
    }
    if (!GetUtils.removeAllWhitespace(cityController.text.trim())
        .isAlphabetOnly) {
      errorMessage(context, message: "Invalid city name");
      return;
    }
    if (GetUtils.isNullOrBlank(stateController.text)) {
      errorMessage(context, message: "State is required");
      return;
    }
    if (!GetUtils.removeAllWhitespace(stateController.text.trim())
        .isAlphabetOnly) {
      errorMessage(context, message: "invalid state name");
      return;
    }
    if (GetUtils.isNullOrBlank(pincodeController.text)) {
      errorMessage(context, message: "Pincode is required");
      return;
    }
    if (!GetUtils.isNumericOnly(pincodeController.text.trim()) ||
        pincodeController.text.length != 6) {
      errorMessage(context, message: "Invalid pincode");
      return;
    }

    File profileImage = image != null ? image : null;

    String name =
        nameController.text.length > 0 ? nameController.text.trim() : user.name;
    String email = emailController.text.length > 0
        ? emailController.text.trim()
        : user.email;
    String location = locationController.text.length > 0
        ? locationController.text.trim()
        : user.location;
    String city =
        cityController.text.length > 0 ? cityController.text.trim() : user.city;
    String state = stateController.text.length > 0
        ? stateController.text.trim()
        : user.state;
    String pincode = pincodeController.text.length > 0
        ? pincodeController.text.trim()
        : user.pincode;

    var updateStatus = await userController.updateUser(
      user.uid,
      user.mobile,
      profileImage,
      name,
      email,
      location,
      city,
      state,
      pincode,
      image != null ? true : false,
      user.profileImage,
    );

    if (!updateStatus) {
      errorMessage(context,
          message: "Something went wrong. Please, try again.");
      return;
    }

    successMessage(context, message: "Profile updated successfully.");
    setState(() {
      image = null;
      canEdit = false;
    });
    userController.fetchUser(
        userController.user.value.mobile, userController.user.value.password);
    return;
  }
}
