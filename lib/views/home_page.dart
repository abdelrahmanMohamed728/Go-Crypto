import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_crypto/bloc/coins_bloc.dart';
import 'package:go_crypto/bloc/events/get_top_coins_event.dart';
import 'package:go_crypto/data/model/coins_response.dart';
import 'package:go_crypto/views/subviews/crypto_list_item.dart';
import 'package:go_crypto/views/welcome_view.dart';

import '../bloc/state/go_state.dart';
import '../res/colors.dart';
import '../res/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _coinsBloc = CoinsBloc();

  @override
  void initState() {
    _coinsBloc.add(GetCoinsTopListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          decoration: backgroundStyle,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: WelcomeView(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocProvider(
                  create: (_) => _coinsBloc,
                  child: BlocBuilder<CoinsBloc, GoState>(
                      builder: (context, state) {
                    if (state is GoLoading) {
                      return const Center(
                        child: SizedBox(
                          width: 70,height: 70,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else if (state is GoError) {
                      return Text(state.message != null ? state.message! : "");
                    } else if (state is GoLoaded) {
                      final coinsList = (state.goModel as CoinsResponse).data;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: coinsList?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, itemDetailsRoute);
                              },
                              child: CryptoListItem(coinsList![index]));
                        },
                      );
                    } else {
                      return const Text("Starting");
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
