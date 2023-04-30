import 'package:flutter/material.dart';
import 'package:flutter_onboarding/data/customerData.dart';
import 'package:provider/provider.dart';


class Profile with ChangeNotifier {
  Map data = {};

  Profile({required this.data});

  Map get profile => data;
  int get profileLength => data.length;

  Map getCart() {
    notifyListeners();
    return data;
  }

  Future<Map> getProfile(emailId) async {
    Customer customer = Customer();
    
    // print(ID);
    Map rawData = await customer.getProfile(emailId!);
    data = rawData['cust'][0];
    // print(data);
    notifyListeners();
    return data;
  }
}
