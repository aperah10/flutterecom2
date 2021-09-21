import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:secd_ecom/Backend/Models/Prof_Address/Addressm.dart';

/* -------------------------------------------------------------------------- */
/*           
             ! ADDDRESS PAGE GET AND POST METHOD   
                                                                                */
/* -------------------------------------------------------------------------- */
LocalStorage storage = new LocalStorage('usertoken');
var token = storage.getItem('token');

class AddressDataRespo {
  /* -------------------------------------------------------------------------- */
  /*                       // ! GET ALL DATA FROM ADDRESS                       */
  /* -------------------------------------------------------------------------- */
  Future<List<Address>> getAddressData() async {
    // String baseUrl = 'https://djecoms.herokuapp.com/address/';
    String baseUrl = 'http://rahulaperah.pythonanywhere.com/address/';

    try {
      var res = await http.get(Uri.parse(baseUrl), headers: {
        "Authorization": "token $token",
      });

      if (res.statusCode == 200) {
        var datar = jsonDecode(res.body);
        // print('datatr $datar');
        MainAddress mpt = MainAddress.fromJson({'addressData': datar});
        // print(
        //     '----------------------------------------------------------------------------');
        // print('Cart RESPO MPT:- $mpt');
        // List<ProductM> productData = MainProductM.fromJson({'datar':datar});
        List<Address> addressData = mpt.addressData;
        // print('Cart RESPO PRODDATA :- $cartData');

        return addressData;
      } else {
        // server error
        return Future.error("Server Error !");
      }
    } catch (e) {
      print('Error:- $e');
      return Future.error("Error Fetching Data !");
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                           // ! ADDRESS POST METHOD                         */
  /* -------------------------------------------------------------------------- */

  Future<List<Address>> addAddressData({
    required String fullname,
    required String email,
    required String phone,
    required String house,
    required String trade,
    required String area,
    required String city,
    required String pinCode,
    required String delTime,
    required String state,
  }) async {
    // String Baseurl = 'https://djecoms.herokuapp.com/address/';
    String baseUrl = 'http://rahulaperah.pythonanywhere.com/address/';
    // var token = storage.getItem('token');
    try {
      var res = await http.post(Uri.parse(baseUrl),
          body: json.encode({
            "fullname": fullname,
            "email": email,
            "phone": phone,
            "house": house,
            "trade": trade,
            "area": area,
            "city": city,
            "pinCode": pinCode,
            "delTime": delTime,
            "state": state,
          }),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            'Authorization': "token $token"
          });
      var data = json.decode(res.body) as Map;
      // print(
      //     '----------------------------------------------------------------------');
      // print('this is data $data');
      // print(res.body);
      // print('CART POST MEHTOD Statuc Code  :-  ${res.statusCode}');

      if (res.statusCode == 200) {
        return getAddressData();
        // return true;
      }
      return Future.error("Error Fetching Data !");

      // return false;
    } catch (e) {
      print("e ADDRESS");
      print(e);
      // return false;
      return Future.error("Error Fetching Data !");
    }
  }

  // /* -------------------------------------------------------------------------- */
  // /*                         // ! UPDATE ADDRESS METHOD                         */
  // /* -------------------------------------------------------------------------- */
  Future<List<Address>> upAddressData({
    String? id,
    String? fullname,
    String? email,
    String? phone,
    String? house,
    String? trade,
    String? area,
    String? city,
    String? pinCode,
    String? state,
    String? delTime,
  }) async {
    // String baseurl = 'https://djecoms.herokuapp.com/address/';
    String baseUrl = 'http://rahulaperah.pythonanywhere.com/address/';
    // var token = storage.getItem('token');
    try {
      var res = await http.put(Uri.parse(baseUrl),
          body: json.encode({
            "id": id,
            "fullname": fullname,
            "email": email,
            "phone": phone,
            "house": house,
            "trade": trade,
            "area": area,
            "city": city,
            "pinCode": pinCode,
            "delTime": delTime,
            "state": state,
          }),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            'Authorization': "token $token"
          });
      var data = json.decode(res.body) as Map;
      print(
          '----------------------------------------------------------------------');
      print('this is data $data');
      print(res.body);
      print('CART POST MEHTOD Statuc Code  :-  ${res.statusCode}');

      if (res.statusCode == 200) {
        return getAddressData();
        // return true;
      }
      return Future.error("Error Fetching Data !");

      // return false;
    } catch (e) {
      print("e ADDRESS");
      print(e);
      // return false;
      return Future.error("Error Fetching Data !");
    }
  }
}
