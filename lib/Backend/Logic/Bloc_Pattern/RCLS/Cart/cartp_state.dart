part of 'cartp_bloc.dart';

abstract class CartpState extends Equatable {
  const CartpState();

  @override
  List<Object> get props => [];
}

class CartpInitial extends CartpState {
  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartpState {
  @override
  List<Object> get props => [];
}

class CartLoadedState extends CartpState {
  List<NewCart> cartData;
  List<Address> addressData;
  CartLoadedState({required this.cartData, required this.addressData});

  @override
  List<Object> get props => [];
}

class CartErrorState extends CartpState {
  String message;
  CartErrorState({required this.message});
  @override
  List<Object> get props => [];
}

class ItemDeletingCartState extends CartpState {
  List<NewCart> cartItems;

  ItemDeletingCartState({required this.cartItems});
  @override
  List<Object> get props => [];
}
