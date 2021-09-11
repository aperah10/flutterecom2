import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:flutter/cupertino.dart';
import 'package:secd_ecom/Backend/Models/Product/New_Product_m.dart';
import 'package:secd_ecom/Backend/Respo/Product/SerachRespo.dart';

part 'searchproduct_event.dart';
part 'searchproduct_state.dart';

class SearchproductBloc extends Bloc<SearchproductEvent, SearchproductState> {
  // final SearchPRespo searchRepository;
  SearchPDataRespo searchRepository = SearchPDataRespo();
  SearchproductBloc(
      // {required this.searchRepository}
      )
      : super(SearchproductInitial());

  @override
  Stream<SearchproductState> mapEventToState(
    SearchproductEvent event,
  ) async* {
    if (event is SearchProd) {
      yield SearchproductInitial();
      try {
        List<ProductC> prod = await searchRepository.getSearchP(event.query);
        print('SEARCH BLOC ${prod}');
        yield SearchLoadedState(productData: prod);
      } catch (e) {
        yield SearachErrorState(message: e.toString());
      }
    }
  }
}
