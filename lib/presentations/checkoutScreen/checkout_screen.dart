import 'package:buy_india_app/presentations/cartScreen/cart_screen.dart';
import 'package:buy_india_app/presentations/widgets/appBar/app_bar.dart';
import 'package:buy_india_app/presentations/widgets/bottomNavBar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/checkout_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'CHECKOUT'),
        bottomNavigationBar: const CustomNavBar(
          screenName: routeName,
          title: 'order Now',
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CUSTOMER INFORMATION',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: value));
                    }, 'Full Name', context),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(email: value));
                    }, 'Email', context),
                    Text(
                      'DELIVERY INFORMATION',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(address: value));
                    }, 'Address', context),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(city: value));
                    }, 'City', context),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(zipCode: value));
                    }, 'Zip Code', context),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(country: value));
                    }, 'Country', context),
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Add a Payment method',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      'ORDER SUMMERY',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    const OrederSummary()
                  ],
                );
              } else {
                return const Text("something went wrong in checkoutscreen");
              }
            },
          ),
        ),
      ),
    );
  }
}

Padding _buildTextFormField(
    Function(String) onchanged, String labelText, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            labelText,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.black),
          ),
        ),
        Expanded(
          child: TextFormField(
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.black),
            onChanged: onchanged,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
        )
      ],
    ),
  );
}
