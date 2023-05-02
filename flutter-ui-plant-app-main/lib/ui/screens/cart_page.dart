import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartPage({Key? key, required this.addedToCartPlants}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int sum = 0;

  final _razorpay = Razorpay();
  late String order_Id;

  Future<http.Response> getToken(Map res) async {
    var tokenRes = await http.post(
        Uri.parse("http://10.0.2.2:8000/createToken"),
        body: jsonEncode(res),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    return tokenRes;
  }

  Future<http.Response> addOrder(Map order) async {
    var res = await http.post(Uri.parse("http://10.0.2.2:8000/addOrder"),
        body: jsonEncode(order),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    return res;
  }

  Future<bool> addToken(tokenNo, orderId) async {
    Map newToken = {'tokenNo': tokenNo, 'orderId': orderId};
    // final tokenData = await context.read<Token>().addToTokenList(newToken);
    // print("true $tokenData");
    // final tokenData = await Provider.of<Token>(context).addToTokenList(
    //     {'tokenNo': tokenNo, 'orderId': orderId, 'isPrepared': false});
    return true;
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) async {
    verifySignature(
        signature: response.signature,
        paymentId: response.paymentId,
        // orderId: response.orderId
        orderId: order_Id);

    var res = await http.post(Uri.parse("http://10.0.2.2:8000/paymentSuccess"),
        body: jsonEncode({"order_id": order_Id}),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });
    print("res type");
    print(jsonDecode(res.body)['order']);
    http.Response tokenRes = await getToken(jsonDecode(res.body)['order']);
    // Map tokenRes = (await getToken(jsonDecode(res.body)['order'])) ;
    // print("token no");
    // print(jsonDecode(tokenRes.body)['tokenNo']);
    print(jsonDecode(res.body)['order']);
    Map newOrder = jsonDecode(res.body)['order'];
    newOrder['tokenNo'] = jsonDecode(tokenRes.body)['tokenNo'];
    // print("newOrder");
    // print(newOrder);
    addOrder(newOrder);

    // ignore: use_build_context_synchronously
    print('start');
    // Provider.of<OrdersProvider>(context, listen: false).addToOrders(Provider.of<Cart>(context, listen: false).getCart(), jsonDecode(tokenRes.body)['tokenNo']);
    print('done');

    addToken(jsonDecode(tokenRes.body)['tokenNo'],
        jsonDecode(res.body)['order']['order_id']);
    // ignore: use_build_context_synchronously
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => TokenPage(
    //               // tokenNumber: 1,
    //               tokenNumber: jsonDecode(tokenRes.body)['tokenNo'],
    //         )
    //     )
    // );
    // Navigator.pushNamed(context, '/token');

    // Provider.of<Cart>(context, listen: false).emptyCart();
  }

  _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.message ?? " "),
      ),
    );
  }

  _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.walletName ?? ""),
    ));
  }

  void createOrder(amount) async {
    // var res = await http.post(Uri.parse("http://10.0.2.2:8000/createOrder"),
    //     body: jsonEncode({"amount": amount}),
    //     headers: {
    //       'Content-type': 'application/json',
    //       'Accept': 'application/json',
    //     });
    order_Id = "order_LUrRLha3sipa1c";
    // order_Id = jsonDecode(res.body)['order']['id'];

    // if (res.statusCode == 201) {
      orderCheckout( order_Id,amount);
    // }
  }

  void orderCheckout(orderId, amount) async {
    var options = {
      'key': 'rzp_test_rk34q3MXaI4tBi',
      'amount': amount, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60 * 5, // in seconds
      'prefill': {'contact': '1234567890', 'email': 'testuser1@example.com'}
    };

    _razorpay.open(options);
  }

  void verifySignature(
      {String? signature, String? paymentId, String? orderId}) async {
    Map<String, dynamic> body = {
      "order_id": orderId,
      "razorpay_payment_id": paymentId,
      "razorpay_signature": signature
    };

    // var res = await http.post(
    //     Uri.parse("http://10.0.2.2:8000/api/payment/verifySignature"),
    //     body: body,
    //     headers: {
    //       'Content-type': 'application/json',
    //       'Accept': 'application/json',
    //     });

    // if (res.statusCode == 200) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(res.body),
    //   ));
    // }
  }

  onCheckOutClick(double totalAmount) async {
    try {
      // List<Map> data = List.generate(cart.cartItems.length, (index) {
      //   return {"id": cart.cartItems[index].food.id, "quantity": cart.cartItems[index].quantity};
      // }).toList();

      // var response = await Dio().post('$BASE_URL/api/order/food', queryParameters: {"token": token}, data: data);
      // print(response.data);

      // if (response.data['status'] == 1) {
      //   cart.clearCart();
      //   Navigator.of(context).pop();
      // } else {
      //   Toast.show(response.data['message'], context);
      // }

      createOrder(totalAmount);
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    print("printing cart");
    print(widget.addedToCartPlants);
    widget.addedToCartPlants.map((e) => {sum = sum + e.price});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
  }

  @override
  void dispose() {
    // animationController.dispose();

    _razorpay.clear();

    super.dispose();
  }

  String createTotal() {
    print('plant list ${widget.addedToCartPlants[0]}');
    widget.addedToCartPlants.map((e) => {sum = sum + e.price});
    String total = '$sum';
    print('sum $sum');
    return total;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Cart is Empty',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.addedToCartPlants.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return PlantWidget(
                              index: index,
                              plantList: widget.addedToCartPlants);
                        }),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "₹1550",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 64, vertical: 12),
                              backgroundColor: Constants.primaryColor,
                              shape: StadiumBorder(),
                              splashFactory: InkRipple.splashFactory,
                            ),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            onPressed: () {
                              onCheckOutClick(1550);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
