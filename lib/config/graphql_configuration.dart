import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink('https://asia-east2-jitta-api.cloudfunctions.net/graphqlDev',
      // defaultHeaders: {
      //   'Accept': '*/*',
      //   'Content-Type' : 'application/json',
      //   'Host' :'<calculated when request is sent>'
      // }
  );

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
  // var httpLink = HttpLink('https://api.github.com/graphql', defaultHeaders: {
  //   'Authorization': 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
  // });

  static GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }
}
