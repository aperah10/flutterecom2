import 'package:flutter/material.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';

// class ProductGridScr extends StatelessWidget {
//   static const routeName = '/grid-product-screens';
//   ProductGridScr({Key? key}) : super(key: key);

//    ProductshowBloc prodBloc = ProductshowBloc(prodRespo: ProductDataRespo());

//   @override
//   void initState() {
//     prodBloc = BlocProvider.of<ProductshowBloc>(context);
//     prodBloc.add(FetchProductEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProductshowBloc, ProductshowState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           print("produc page state: $state");
//           if (state is ProductLoadingState) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (state is ProductErrorState) {
//             return Center(child: Text(' this is eror ${state.message}'));
//           }
//           if (state is ProductLoadedState) {
//             return ProdGridList(prodState: state.productData,);
//           }
//           return Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         });
//   }
// }

/* -------------------------------------------------------------------------- */
/*                           // ! PRODUCT GRID  LIST                          */
/* -------------------------------------------------------------------------- */
class ProdGridList extends StatelessWidget {
  dynamic prodState;
  ProdGridList({Key? key, this.prodState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: 'ProductPage'),
      body: SafeArea(
        bottom: false,
        left: true,
        right: true,
        top: false,
        child: Container(
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: prodState.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.60,
                // crossAxisSpacing: 20,
                //   mainAxisSpacing: 20
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              itemBuilder: (context, index) {
                return ProdGridListShow(prodNumber: prodState[index]);
              }),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                         // ! PRODUCT GRID LIST SHOW                        */
/* -------------------------------------------------------------------------- */
class ProdGridListShow extends StatelessWidget {
  dynamic prodNumber;
  ProdGridListShow({Key? key, this.prodNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 160.0,
        child: Wrap(
          children: <Widget>[
            Image.asset(prodNumber.pic == null ? '' : prodNumber.pic),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ItemDetailsScreen()));
              },
              title: Text(
                prodNumber.title,
                // title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                prodNumber.description,
                // subTitle,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Row(
              children: [
                MultipleBtn(
                  btnName: 'Basket',
                ),
                MultipleBtn(
                  btnName: 'BuyNow',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
