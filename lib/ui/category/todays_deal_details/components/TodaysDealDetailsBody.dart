import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/ui/favorite_items/favorite_items_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:MrMart/Widgets/GridAnimation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/ui/category/favorite_items_with_header/favorite_items_with_header_screen.dart';

class TodaysDealDetailsBody extends StatefulWidget {
  @override
  _TodaysDealDetailsBodyState createState() => _TodaysDealDetailsBodyState();
}

class _TodaysDealDetailsBodyState extends State<TodaysDealDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Get.height * 0.25,
            color: kFollowed_BG2,
            child: Center(
              child: Image.asset(
                'assets/demo/package1.png',
                fit: BoxFit.cover,
              ),
              //child: SvgPicture.asset('assets/demo/package1.svg'),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 0.2,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal Care Package',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        '\$ 720',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Package',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    'Suspendisse nec nunc vel leio cursus elementum sed ut diam. Nam quis lobortis nunc. Nulla luctus neq nisi quis malesuada sem commodo ut.Vivamus susci, est et finibus pellentesque, dui dui semper ante, nec sollicitudin odio orci id sem.',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 0.2,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Specification',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Quantity          :     ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('3',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Category         :     ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('Beauty',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Product           :     ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                            'Hydra-V Face wash, Hydra-V Face, Moisturizer, Hydra-V Face Tonner.',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Brand               :     ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('Artistry',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Weight            :     ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('1000 gm',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Warranty        :     ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('Not Available',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Delivery          :     ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('10 - 15 Days',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 0.2,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Available Shop',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    color: kBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                    'assets/demo/shop_details_circle_image2.png'),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'BD Budget Center',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Sed quis pretium mauris  '
                                      'massa amet tempus ullamcorper.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(height: 1),
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/location_picker_fill.svg'),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Text(
                                            '2025 M street, 3rd bloke northwest, washington, 20036.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(height: 1),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/call_fill.svg'),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Text(
                                            '+987 6709 1248 0854',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(height: 1),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FavoriteItemsWithHeaderScreen()),
                                );
                              },
                              child: Container(
                                width: Get.width * 0.40,
                                height: 45,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: Dimension.Size_3,
                                    bottom: Dimension.Size_3),
                                decoration: BoxDecoration(
                                    color: Themes.Primary2,
                                    borderRadius: BorderRadius.circular(
                                        Dimension.Size_5)),
                                child: Text(
                                  'Add To Favourite',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          color: Themes.White,
                                          fontWeight: Dimension.textMedium),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen()),
                                );
                              },
                              child: Container(
                                width: Get.width * 0.40,
                                height: 45,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: Dimension.Size_3,
                                    bottom: Dimension.Size_3),
                                decoration: BoxDecoration(
                                    color: Themes.Primary2,
                                    borderRadius: BorderRadius.circular(
                                        Dimension.Size_5)),
                                child: Text(
                                  'Add to cart',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          color: Themes.White,
                                          fontWeight: Dimension.textMedium),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
