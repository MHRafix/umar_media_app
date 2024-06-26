import 'package:flutter/cupertino.dart';
import 'package:umar_media/app_view.dart';
import 'package:umar_media/utils/graphql_provider.dart';
// import 'package:ttp_app/utils/graphql_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClientProvider(
        uri: 'https://ttp-api.up.railway.app/graphql',
        subscriptionUri: 'https://ttp-api.up.railway.app/graphql',
        child: const MyAppView());
  }
}
