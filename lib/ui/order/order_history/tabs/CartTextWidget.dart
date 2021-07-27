import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartTextWidget extends StatelessWidget {
  final dynamic order;
  final bool isPastOrder;
  final currencyFormatter =
      NumberFormat.currency(name: "en_IN", decimalDigits: 2, symbol: "");

  CartTextWidget(this.order, this.isPastOrder);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(5),
        padding: EdgeInsets.all(kDefaultPadding),
        color: Colors.white,
        dashPattern: [2, 3],
        strokeWidth: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${DateFormat('MMMM d, y kk:mm').format(order.createdOn)}',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Total Price : ${AppConstant.currencySymbol}${currencyFormatter.format(double.tryParse(order.amount))}',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        isPastOrder
                            ? 'Payment Method: ${order.paymentType}'
                            : 'Status: ${order.status}',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Order ID : ${order.oid}',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
