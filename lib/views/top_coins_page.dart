import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_crypto/res/constants.dart';
import 'package:go_crypto/views/subviews/crypto_list_item.dart';
import 'package:go_crypto/views/welcome_view.dart';
import '../bloc/coins_bloc.dart';
import '../bloc/events/get_top_coins_event.dart';
import '../bloc/state/go_state.dart';
import '../data/model/coins_response.dart';
import '../res/colors.dart';
import '../res/routes.dart';

class TopCoinsPage extends StatefulWidget {
  const TopCoinsPage({super.key});

  @override
  State<TopCoinsPage> createState() => _TopCoinsPageState();
}

class _TopCoinsPageState extends State<TopCoinsPage> {
  final _coinsBloc = CoinsBloc();

  @override
  void initState() {
    _coinsBloc.add(GetCoinsTopListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                child:
                    BlocBuilder<CoinsBloc, GoState>(builder: (context, state) {
                  if (state is GoLoading) {
                    return const Center(
                      child: SizedBox(
                        width: 70,
                        height: 70,
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
                        final item = coinsList![index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                itemDetailsRoute,
                                arguments: {coinData: item},
                              );
                            },
                            child: CryptoListItem(item));
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
    );
  }
}
