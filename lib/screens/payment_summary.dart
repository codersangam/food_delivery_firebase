import 'package:flutter/material.dart';
import 'package:food_delivery/models/delivery_address_model.dart';
import 'package:food_delivery/provider/cart_provider.dart';
import 'package:food_delivery/widgets/ordered_items.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({Key? key, required this.deliveryAddressDetails})
      : super(key: key);

  final DeliveryAddressModel? deliveryAddressDetails;

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
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartProduct();

    double discount = 10.0;
    double shippingCharges = 20.0;
    double subtotal = cartProvider.getTotalPrice();
    double total = 0.0;
    if (subtotal > 300) {
      // For % Discount
      // double discount = (subtotal * discountCoupon) / 100;
      total = (subtotal + shippingCharges) - discount;
    } else {
      total = subtotal + shippingCharges;
    }

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
              child: "\$$total".text.lg.make(),
              // 'lol'.text.xl3.bold.make(),
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
                title:
                    '${widget.deliveryAddressDetails!.firstName!} ${widget.deliveryAddressDetails!.lastName!}'
                        .text
                        .bold
                        .xl2
                        .make(),
                subtitle:
                    '${widget.deliveryAddressDetails!.addressOne}, ${widget.deliveryAddressDetails!.city}, ${widget.deliveryAddressDetails!.state}, ${widget.deliveryAddressDetails!.pincode}, ${widget.deliveryAddressDetails!.country}, ${widget.deliveryAddressDetails!.phone}'
                        .text
                        .lg
                        .make(),
              ),
              const Divider(
                color: Colors.black,
              ),
              ExpansionTile(
                  children: cartProvider.getCartProducts.map((e) {
                    return OrderedItems(
                      data: e,
                    );
                  }).toList(),
                  title: Row(
                    children: [
                      'Ordered Items'.text.lg.make(),
                      '(${cartProvider.getCartProducts.length})'
                          .text
                          .lg
                          .bold
                          .make(),
                    ],
                  )),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: 'Sub Total'.text.bold.lg.make(),
                trailing: '$subtotal\$'.text.lg.make(),
              ),
              ListTile(
                leading: 'Shipping Charges'.text.bold.lg.make(),
                trailing: '$shippingCharges\$'.text.lg.make(),
              ),
              ListTile(
                leading: 'Coupon'.text.bold.lg.make(),
                trailing: '$discount\$'.text.lg.make(),
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
