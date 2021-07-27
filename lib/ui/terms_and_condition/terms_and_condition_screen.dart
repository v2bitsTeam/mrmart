import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/ui/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:mr_mart/Controllers/cart_controller.dart';

class TermsAndConditionScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Terms and Condition"),
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
              SizedBox(height: 40.0),
              Text(
                'Terms & Conditions',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Divider(),
              Text(
                'PLEASE READ THIS TERMS OF SERVICE AGREEMENT CAREFULLY, AS IT CONTAINS IMPORTANT INFORMATION REGARDING YOUR LEGAL RIGHTS AND REMEDIES.',
              ),
              SizedBox(height: 8.0),
              Text(
                'Last Revised: 2021-07-25 06:07:19',
              ),
              SizedBox(height: 10.0),
              Text(
                '1. OVERVIEW',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Divider(),
              Text(
                'This Terms of Service Agreement ("Agreement") is entered into by and between mrmart, registered address 1ST FLOOR, SHANGRILA PLAZA, ROAD NO.2 , BANJARA HILLS, Hyderabad , Telangana, India ("Company") and you, and is made effective as of the date of your use of this website https://mrmart.co ("Site") or the date of electronic acceptance.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'This Agreement sets forth the general terms and conditions of your use of the https://mrmart.co as well as the products and/or services purchased or accessed through this Site (the "Services").Whether you are simply browsing or using this Site or purchase Services, your use of this Site and your electronic acceptance of this Agreement signifies that you have read, understand, acknowledge and agree to be bound by this Agreement our Privacy policy. The terms "we", "us" or "our" shall refer to Company. The terms "you", "your", "User" or "customer" shall refer to any individual or entity who accepts this Agreement, uses our Site, has access or uses the Services. Nothing in this Agreement shall be deemed to confer any third-party rights or benefits.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Company may, in its sole and absolute discretion, change or modify this Agreement, and any policies or agreements which are incorporated herein, at any time, and such changes or modifications shall be effective immediately upon posting to this Site. Your use of this Site or the Services after such changes or modifications have been made shall constitute your acceptance of this Agreement as last revised.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'IF YOU DO NOT AGREE TO BE BOUND BY THIS AGREEMENT AS LAST REVISED, DO NOT USE (OR CONTINUE TO USE) THIS SITE OR THE SERVICES.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '2. ELIGIBILITY',
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
                'This Site and the Services are available only to Users who can form legally binding contracts under applicable law. By using this Site or the Services, you represent and warrant that you are (i) at least eighteen (18) years of age, (ii) otherwise recognized as being able to form legally binding contracts under applicable law, and (iii) are not a person barred from purchasing or receiving the Services found under the laws of the India or other applicable jurisdiction.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'If you are entering into this Agreement on behalf of a company or any corporate entity, you represent and warrant that you have the legal authority to bind such corporate entity to the terms and conditions contained in this Agreement, in which case the terms "you", "your", "User" or "customer" shall refer to such corporate entity. If, after your electronic acceptance of this Agreement, Company finds that you do not have the legal authority to bind such corporate entity, you will be personally responsible for the obligations contained in this Agreement.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '3. RULES OF USER CONDUCT',
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
                'By using this Site You acknowledge and agree that:',
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Your use of this Site, including any content you submit, will comply with this Agreement and all applicable local, state, national and international laws, rules and regulations.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'You will not use this Site in a manner that:',
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Is illegal, or promotes or encourages illegal activity;',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Promotes, encourages or engages in child pornography or the exploitation of children;',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Promotes, encourages or engages in terrorism, violence against people, animals, or property;',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Promotes, encourages or engages in any spam or other unsolicited bulk email, or computer or network hacking or cracking;',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Infringes on the intellectual property rights of another User or any other person or entity;',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Violates the privacy or publicity rights of another User or any other person or entity, or breaches any duty of confidentiality that you owe to another User or any other person or entity;',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Interferes with the operation of this Site;',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Contains or installs any viruses, worms, bugs, Trojan horses, Cryptocurrency Miners or other code, files or programs designed to, or capable of, using many resources, disrupting, damaging, or limiting the functionality of any software or hardware.',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'You will not:',
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'copy or distribute in any medium any part of this Site, except where expressly authorized by Company,',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'copy or duplicate this Terms of Services agreement, which was created with the help of the TermsHub.io and the Terms & Conditions Generator,',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'modify or alter any part of this Site or any of its related technologies,',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'access Companies Content (as defined below) or User Content through any technology or means other than through this Site itself.',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '4. INTELLECTUAL PROPERTY',
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
                'In addition to the general rules above, the provisions in this Section apply specifically to your use of Companies Content posted to Site. Companies Content on this Site, including without limitation the text, software, scripts, source code, API, graphics, photos, sounds, music, videos and interactive features and the trademarks, service marks and logos contained therein ("Companies Content"), are owned by or licensed to mrmart in perpetuity, and are subject to copyright, trademark, and/or patent protection.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Companies Content is provided to you "as is", "as available" and "with all faults" for your information and personal, non-commercial use only and may not be downloaded, copied, reproduced, distributed, transmitted, broadcast, displayed, sold, licensed, or otherwise exploited for any purposes whatsoever without the express prior written consent of Company. No right or license under any copyright, trademark, patent, or other proprietary right or license is granted by this Agreement.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '5. DISCLAIMER OF REPRESENTATIONS AND WARRANTIES',
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
                'YOU SPECIFICALLY ACKNOWLEDGE AND AGREE THAT YOUR USE OF THIS SITE SHALL BE AT YOUR OWN RISK AND THAT THIS SITE ARE PROVIDED "AS IS", "AS AVAILABLE" AND "WITH ALL FAULTS". COMPANY, ITS OFFICERS, DIRECTORS, EMPLOYEES, AGENTS, DISCLAIM ALL WARRANTIES, STATUTORY, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. COMPANY, ITS OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS MAKE NO REPRESENTATIONS OR WARRANTIES ABOUT (I) THE ACCURACY, COMPLETENESS, OR CONTENT OF THIS SITE, (II) THE ACCURACY, COMPLETENESS, OR CONTENT OF ANY SITES LINKED (THROUGH HYPERLINKS, BANNER ADVERTISING OR OTHERWISE) TO THIS SITE, AND/OR (III) THE SERVICES FOUND AT THIS SITE OR ANY SITES LINKED (THROUGH HYPERLINKS, BANNER ADVERTISING OR OTHERWISE) TO THIS SITE, AND COMPANY ASSUMES NO LIABILITY OR RESPONSIBILITY FOR THE SAME.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'IN ADDITION, YOU SPECIFICALLY ACKNOWLEDGE AND AGREE THAT NO ORAL OR WRITTEN INFORMATION OR ADVICE PROVIDED BY COMPANY, ITS OFFICERS, DIRECTORS, EMPLOYEES, OR AGENTS, AND THIRD-PARTY SERVICE PROVIDERS WILL (I) CONSTITUTE LEGAL OR FINANCIAL ADVICE OR (II) CREATE A WARRANTY OF ANY KIND WITH RESPECT TO THIS SITE OR THE SERVICES FOUND AT THIS SITE, AND USERS SHOULD NOT RELY ON ANY SUCH INFORMATION OR ADVICE.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'THE FOREGOING DISCLAIMER OF REPRESENTATIONS AND WARRANTIES SHALL APPLY TO THE FULLEST EXTENT PERMITTED BY LAW, and shall survive any termination or expiration of this Agreement or your use of this Site or the Services found at this Site.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '6. LIMITATION OF LIABILITY',
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
                'IN NO EVENT SHALL COMPANY, ITS OFFICERS, DIRECTORS, EMPLOYEES, AGENTS, AND ALL THIRD PARTY SERVICE PROVIDERS, BE LIABLE TO YOU OR ANY OTHER PERSON OR ENTITY FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, PUNITIVE, OR CONSEQUENTIAL DAMAGES WHATSOEVER, INCLUDING ANY DAMAGES THAT MAY RESULT FROM (I) THE ACCURACY, COMPLETENESS, OR CONTENT OF THIS SITE, (II) THE ACCURACY, COMPLETENESS, OR CONTENT OF ANY SITES LINKED (THROUGH HYPERLINKS, BANNER ADVERTISING OR OTHERWISE) TO THIS SITE, (III) THE SERVICES FOUND AT THIS SITE OR ANY SITES LINKED (THROUGH HYPERLINKS, BANNER ADVERTISING OR OTHERWISE) TO THIS SITE, (IV) PERSONAL INJURY OR PROPERTY DAMAGE OF ANY NATURE WHATSOEVER, (V) THIRDPARTY CONDUCT OF ANY NATURE WHATSOEVER, (VI) ANY INTERRUPTION OR CESSATION OF SERVICES TO OR FROM THIS SITE OR ANY SITES LINKED (THROUGH HYPERLINKS, BANNER ADVERTISING OR OTHERWISE) TO THIS SITE, (VII) ANY VIRUSES, WORMS, BUGS, TROJAN HORSES, OR THE LIKE, WHICH MAY BE TRANSMITTED TO OR FROM THIS SITE OR ANY SITES LINKED (THROUGH HYPERLINKS, BANNER ADVERTISING OR OTHERWISE) TO THIS SITE, (VIII) ANY USER CONTENT OR CONTENT THAT IS DEFAMATORY, HARASSING, ABUSIVE, HARMFUL TO MINORS OR ANY PROTECTED CLASS, PORNOGRAPHIC, "X-RATED", OBSCENE OR OTHERWISE OBJECTIONABLE, AND/OR (IX) ANY LOSS OR DAMAGE OF ANY KIND INCURRED AS A RESULT OF YOUR USE OF THIS SITE OR THE SERVICES FOUND AT THIS SITE, WHETHER BASED ON WARRANTY, CONTRACT, TORT, OR ANY OTHER LEGAL OR EQUITABLE THEORY, AND WHETHER OR NOT COMPANY IS ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'IN ADDITION, You SPECIFICALLY ACKNOWLEDGE AND agree that any cause of action arising out of or related to this Site or the Services found at this Site must be commenced within one (1) year after the cause of action accrues, otherwise such cause of action shall be permanently barred.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'THE FOREGOING LIMITATION OF LIABILITY SHALL APPLY TO THE FULLEST EXTENT PERMITTED BY LAW, AND shall survive any termination or expiration of this Agreement or your use of this Site or the Services found at this Site.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '7. INDEMNITY',
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
                'You agree to protect, defend, indemnify and hold harmless Company and its officers, directors, employees, agents from and against any and all claims, demands, costs, expenses, losses, liabilities and damages of every kind and nature (including, without limitation, reasonable attorneys’ fees) imposed upon or incurred by Company directly or indirectly arising from (i) your use of and access to this Site; (ii) your violation of any provision of this Agreement or the policies or agreements which are incorporated herein; and/or (iii) your violation of any third-party right, including without limitation any intellectual property or other proprietary right. The indemnification obligations under this section shall survive any termination or expiration of this Agreement or your use of this Site or the Services found at this Site.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '8. DATA TRANSFER',
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
                'If you are visiting this Site from a country other than the country in which our servers are located, your communications with us may result in the transfer of information across international boundaries. By visiting this Site and communicating electronically with us, you consent to such transfers.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '9. AVAILABILITY OF WEBSITE',
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
                'Subject to the terms and conditions of this Agreement and our policies, we shall use commercially reasonable efforts to attempt to provide this Site on 24/7 basis. You acknowledge and agree that from time to time this Site may be inaccessible for any reason including, but not limited to, periodic maintenance, repairs or replacements that we undertake from time to time, or other causes beyond our control including, but not limited to, interruption or failure of telecommunication or digital transmission links or other failures.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'You acknowledge and agree that we have no control over the availability of this Site on a continuous or uninterrupted basis, and that we assume no liability to you or any other party with regard thereto.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '10. DISCONTINUED SERVICES',
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
                'Company reserves the right to cease offering or providing any of the Services at any time, for any or no reason, and without prior notice. Although Company makes great effort to maximize the lifespan of all its Services, there are times when a Service we offer will be discontinued. If that is the case, that product or service will no longer be supported by Company. In such case, Company will either offer a comparable Service for you to migrate to or a refund. Company will not be liable to you or any third party for any modification, suspension, or discontinuance of any of the Services we may offer or facilitate access to.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '11. FEES AND PAYMENTS',
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
                'You acknowledge and agree that your payment will be charged and processed by mrmart.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'You agree to pay any and all prices and fees due for Services purchased or obtained at this Site at the time you order the Services.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Company expressly reserves the right to change or modify its prices and fees at any time, and such changes or modifications shall be posted online at this Site and effective immediately without need for further notice to you.',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Refund Policy: for products and services eligible for a refund, you may request a refund under the terms and conditions of our Refund Policy which can be accessed here.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '12. NO THIRD-PARTY BENEFICIARIES',
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
                'Nothing in this Agreement shall be deemed to confer any third-party rights or benefits.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '13. COMPLIANCE WITH LOCAL LAWS',
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
                'Company makes no representation or warranty that the content available on this Site are appropriate in every country or jurisdiction, and access to this Site from countries or jurisdictions where its content is illegal is prohibited. Users who choose to access this Site are responsible for compliance with all local laws, rules and regulations.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '14. GOVERNING LAW',
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
                'This Agreement and any dispute or claim arising out of or in connection with it or its subject matter or formation shall be governed by and construed in accordance with the laws of India, telangana, to the exclusion of conflict of law rules.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '15. DISPUTE RESOLUTION',
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
                'Any controversy or claim arising out of or relating to these Terms of Services will be settled by binding arbitration. Any such controversy or claim must be arbitrated on an individual basis, and must not be consolidated in any arbitration with any claim or controversy of any other party. The arbitration must be conducted in India, telangana, and judgment on the arbitration award may be entered into any court having jurisdiction thereof.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '16. TITLES AND HEADINGS',
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
                'The titles and headings of this Agreement are for convenience and ease of reference only and shall not be utilized in any way to construe or interpret the agreement of the parties as otherwise set forth herein.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '17. SEVERABILITY',
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
                'Each covenant and agreement in this Agreement shall be construed for all purposes to be a separate and independent covenant or agreement. If a court of competent jurisdiction holds any provision (or portion of a provision) of this Agreement to be illegal, invalid, or otherwise unenforceable, the remaining provisions (or portions of provisions) of this Agreement shall not be affected thereby and shall be found to be valid and enforceable to the fullest extent permitted by law.',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '18. CONTACT INFORMATION',
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
                'If you have any questions about this Agreement, please contact us by email or regular mail at the following address:',
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'mrmart 1ST FLOOR, SHANGRILA PLAZA, ROAD NO.2 , BANJARA HILLS, Hyderabad , Telangana India info@mrmart.co.in',
                ),
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
