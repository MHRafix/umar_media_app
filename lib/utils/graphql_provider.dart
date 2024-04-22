import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// String? uuidFormObject(Object object) {
//   if (object is Map<String, Object>) {
//     final String typeName = object["__typename"] as String;
//     final String id = object['id'].toString();
//     return <String>[typeName, id].join('/');
//   }
//   return null;
// }

ValueNotifier<GraphQLClient> clientFor({
  required String uri,
  required String subscriptionUri,
}) {
  final HttpLink httpLink = HttpLink(uri);
  final AuthLink authLink = AuthLink(getToken: () async => '');
  final WebSocketLink webSocketLink = WebSocketLink(subscriptionUri);
  final Link link = authLink.concat(httpLink.split(
      (request) => request.isSubscription, webSocketLink, httpLink));

  return ValueNotifier<GraphQLClient>(
      GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore())));
}

class ClientProvider extends StatelessWidget {
  ClientProvider(
      {super.key,
      @required this.child,
      required String uri,
      required String subscriptionUri})
      : client = clientFor(uri: uri, subscriptionUri: subscriptionUri);

  final Widget? child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}
