import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/ordered_items.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum PaymentMethods {
  cod,
  paypal,
  razorpay,
  khalti,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myPayment = PaymentMethods.cod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Payment Summary'.text.make(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: '\$900'.text.xl3.bold.make(),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: 'Place Order'.text.xl.make(),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: 'Sangam Singh'.text.bold.xl2.make(),
                subtitle:
                    '#27 Chaitanya PG, Opp. KNS College, Thirumenahalli, Bangalore, Karnataka 560064'
                        .text
                        .make(),
              ),
              const Divider(
                color: Colors.black,
              ),
              ExpansionTile(
                children: const [
                  OrderedItems(),
                  OrderedItems(),
                  OrderedItems(),
                  OrderedItems(),
                  OrderedItems(),
                  OrderedItems(),
                ],
                title: 'Ordered Items 6'.text.make(),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: 'Sub Total'.text.bold.lg.make(),
                trailing: '300\$'.text.lg.make(),
              ),
              ListTile(
                leading: 'Shipping Charges'.text.bold.lg.make(),
                trailing: '0.0\$'.text.lg.make(),
              ),
              ListTile(
                leading: 'Coupon'.text.bold.lg.make(),
                trailing: '10\$'.text.lg.make(),
              ),
              ListTile(
                leading: 'Payment Methods'.text.bold.xl2.make(),
              ),
              RadioListTile(
                title: 'Cash on Delivery'.text.make(),
                value: PaymentMethods.cod,
                groupValue: myPayment,
                onChanged: (PaymentMethods? value) {
                  setState(() {
                    myPayment = value!;
                  });
                },
              ),
              RadioListTile(
                title: 'Paypal'.text.make(),
                value: PaymentMethods.paypal,
                groupValue: myPayment,
                onChanged: (PaymentMethods? value) {
                  setState(() {
                    myPayment = value!;
                  });
                },
              ),
              RadioListTile(
                title: 'Razor Pay'.text.make(),
                value: PaymentMethods.razorpay,
                groupValue: myPayment,
                onChanged: (PaymentMethods? value) {
                  setState(() {
                    myPayment = value!;
                  });
                },
              ),
              RadioListTile(
                title: 'Khalti'.text.make(),
                value: PaymentMethods.khalti,
                groupValue: myPayment,
                onChanged: (PaymentMethods? value) {
                  setState(() {
                    myPayment = value!;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
