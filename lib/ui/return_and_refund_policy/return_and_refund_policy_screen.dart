import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/ui/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:mr_mart/Controllers/cart_controller.dart';

class ReturnAndRefundPolicyScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Return & Refund Policy"),
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
      body: Container(
        height: Get.height,
        color: Colors.grey[200],
        padding: EdgeInsets.only(
          top: 4.0,
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
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
                'Returns & Refund Policy',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                'All our clients are very important to us, that\'s why mrmart ("Company"), has created the following Refund Policy to let You know how we handle the refunds for the goods ordered and bought on our website https://mrmart.co ("Website").',
              ),
              SizedBox(height: 10.0),
              Text(
                'The terms "You," "Your," and "Yours" refer to the entity/ person/ organization using our Website. When this Policy mentions "we", "us,", and "our" it refers to the Company and its subsidiaries or /and affiliates. The term "goods" refer to any product or item bought on our Website by You.',
              ),
              SizedBox(height: 10.0),
              Text(
                'This Refund Policy is governed by our Terms of Services.',
              ),
              SizedBox(height: 10.0),
              Text(
                'For any questions regarding this Refund Policy or any requests regarding the refunds and returns, please contact us by email info@mrmart.co.in, phone 7406234567 or other contacts provided below.',
              ),
              SizedBox(height: 10.0),
              Text(
                'Some of the goods can be returned within 30 of delivery and are eligible for a refund. You have the right, without giving a reason, to return such goods, if it has not been used, damaged or its appearance has not substantially changed, that is, the appearance of the product or its packaging has been made only such alterations as were necessary to inspect the goods received.',
              ),
              SizedBox(height: 10.0),
              Text(
                'The right to withdraw from a distance contract within 30 without giving a reason does not apply to legal persons (e.g. companies, entrepreneurs).',
              ),
              SizedBox(height: 10.0),
              Text(
                'See the Exceptions section below to learn more about which goods are not eligible for a refund.',
              ),
              SizedBox(height: 10.0),
              Text(
                'This Return policy does not limit Your statutory rights to withdraw or rights You may have in relation to incorrect, damaged or defective goods.',
              ),
              SizedBox(height: 20.0),
              Text(
                'Standard Returns:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Divider(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Any goods that You wish to return must be in the original packaging and unopened, in a condition fit for resale. If the Goods to be returned do not meet these conditions, we will be unable to offer a refund.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'If the item is not subject to an Exception, you must place your refund request within 30 of delivery of the item.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Please contact our Support to begin the return and refund process, Support team will walk you through the process and help you.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Please return the goods to us by sending to the address: mrmart 7406234567 1ST FLOOR, SHANGRILA PLAZA, ROAD NO.2 , BANJARA HILLS, Hyderabad, 500034, telangana, India',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'In case of the return of the goods, we will cover the return shipping costs.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'You must exercise return right responsibly and return the product in the original neat packaging, as well as return all complete parts of the product. You are responsible for the complete set of the returned goods. If the goods are not complete, we won\'t be able to accept the returned goods and issue a refund.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Once the Goods have been received and checked by our staff, a refund will be authorised by the same method that the payment was made. Depending on your financial institution, refunds can take up to 30 to be credited to your original payment method. In all cases we have the right to suspend the refund until the good are received back and inspected.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'If You fail to meet the deadlines of our Return policy, we will be unable to offer a refund.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Return Exceptions:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Divider(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Your right to return quality goods purchased in the online store does not apply to:',
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Goods that are not suitable for return because of sanitary and health reasons.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Goods that have been personalized for your buyer.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Goods that are likely to degrade or pass their expiration dates quickly, such as food.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Goods that have been unpacked after delivery, such as packaged video or audio recordings or packaged software that have been unpacked after delivery.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Goods that are inseparably mixed with other goods after delivery.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Newspapers, periodicals, or magazines.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Discounted items can not be returned.',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Defective goods:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Divider(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'In certain cases, such as defective, damaged or wrong goods, you may be required to provide evidence of the issue, such as a photo or video, or to return the item to receive a refund.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'You must contact our company at info@mrmart.co.in within 30 upon purchase and provide detailed information, such as:',
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Proof of purchase.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Information about the defect, failure or missing part of the item.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Defect evidence (e.g. a photo or video of the item, a photo of the defective area (if it is possible to take a photo), a photo of the packaging, other).',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'When submitting a complaint, You must indicate how You wish the claim to be resolved:',
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'To replace the defective goods with quality items.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'To supplement the incomplete goods with missing components.',
                ),
              ),
              Text(
                'The goods must be returned in the original packaging (with instructions and/or warranty card, if they were delivered with the product).',
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Further information:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Divider(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'This Policy was created with the help of the TermsHub Refund Policy Generator and applies only to the refunds for the goods and services sold by our Company. Our Policy does not apply to the refunds for the goods and services offered by other companies or individuals.',
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
