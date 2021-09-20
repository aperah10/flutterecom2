part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

// !  Address FETCH Event
class FetchAddressEvent extends AddressEvent {
  @override
  List<Object> get props => [];
}

/* -------------------------------------------------------------------------- */
/*                          // ! Address SAVE BUTTON                          */
/* -------------------------------------------------------------------------- */

class AddressSaveButtonEvent extends AddressEvent {
  final String fullname;
  final String email;
  final String phone;
  final String house;
  final String trade;
  final String area;
  final String city;
  final String pinCode;
  final String delTime;
  final String state;

  AddressSaveButtonEvent(
      {required this.fullname,
      required this.email,
      required this.phone,
      required this.house,
      required this.trade,
      required this.area,
      required this.city,
      required this.pinCode,
      required this.delTime,
      required this.state});

  @override
  // List<Object> get props => [fullname, email, gender, pic];

  @override
  String toString() =>
      'AddressButtonPressed { username: $fullname, password: $email }';
}

/* -------------------------------------------------------------------------- */
/*                             // ! UPDATE ADDRESS                            */
/* -------------------------------------------------------------------------- */
class AddressUpBtnEvent extends AddressEvent {
  final String fullname;
  String? email;
  final String phone;
  final String? house;
  final String? trade;
  final String area;
  final String city;
  final String pinCode;
  final String? delTime;
  final String state;

  AddressUpBtnEvent(
      {required this.fullname,
      this.email,
      required this.phone,
      this.house,
      this.trade,
      required this.area,
      required this.city,
      required this.pinCode,
      this.delTime,
      required this.state});

  @override
  // List<Object> get props => [fullname, email, gender, pic];

  @override
  String toString() =>
      'AddressUpdateBtnPressed { username: $fullname, password: $email }';
}
