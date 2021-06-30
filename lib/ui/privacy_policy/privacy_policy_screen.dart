import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:MrMart/Controllers/cart_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Privacy Policy"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 24.0,
              top: 4.0,
            ),
            child: Container(
              width: 35,
              height: 35,
              child: Obx(
                () => Stack(
                  children: [
                    Positioned(
                      top: 14.0,
                      left: 0,
                      child: InkWell(
                        child: SvgPicture.asset('assets/icons/cart_white.svg'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          cartController.cart.length.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
      body: SingleChildScrollView(
        child: Container(
          // height: Get.height,
          color: Colors.grey[200],
          padding: EdgeInsets.only(
            top: 4.0,
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo-orange.png',
                  height: 40.0,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Privacy Policy for Mrmart",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "At Mrmart, accessible from Mrmart.co, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Mrmart and how we use it.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "This Privacy Policy applies only to our online activities and is valid for visitors to our website and app with regards to the information that they shared and/or collect in Mrmart. This policy is not applicable to any information collected offline or via channels other than this website.",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Consent",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "By using our website and app, you hereby consent to our Privacy Policy and agree to its terms.",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Information we collect",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "How we use your information",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "We use the information we collect in various ways, including to:",
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Provide, operate, and maintain our website and app",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Improve, personalize, and expand our website and app",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Understand and analyze how you use our website and app",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Develop new products, services, features, and functionality",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website and app, and for marketing and promotional purposes",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Send you emails",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Find and prevent fraud",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Log Files",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "Mrmart follows a standard procedure of using log files. These files log visitors when they visit websites and app. All hosting companies do this and a part of hosting services' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site and app, tracking users' movement on the website and app, and gathering demographic information.",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Cookies and Web Beacons",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "Like any other website and app, Mrmart uses 'cookies'. These cookies are used to store information including visitors' preferences, and the pages on the website that the visitor accessed or visited.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "The information is used to optimize the user's experience by customizing our web page content based on visitors' browser type and/or other information.",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Advertising Partners Privacy Policies",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "You may consult this list to find the Privacy Policy for each of the advertising partners of Mrmart.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Mrmart, which are sent directly to users' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Note that Mrmart has no access to or control over these cookies that are used by third-party advertisers.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Third Party Privacy Policies",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "Mrmart's Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers' respective websites.",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "CCPA Privacy Rights (Do Not Sell My Personal Information)",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "Under the CCPA, among other rights, California consumers have the right to:",
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Request that a business that collects a consumer's personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Request that a business delete any personal data about the consumer that a business has collected.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Request that a business that sells a consumer's personal data, not sell the consumer's personal data.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "GDPR Data Protection Rights",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:",
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "The right to erasure – You have the right to request that we erase your personal data, under certain conditions.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.",
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Children's Information",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                "Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Mrmart does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.",
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
