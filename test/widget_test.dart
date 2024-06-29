
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jitta_ranking/config/graphql_configuration.dart';
import 'package:jitta_ranking/main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:jitta_ranking/config/readRepositories.dart' as queries;
import 'widget_test.mocks.dart';


@GenerateNiceMocks([
  MockSpec<GraphQLClient>(),
])
void main() {
  late MockGraphQLClient mockGraphQLClient;

  setUpAll(() {
    mockGraphQLClient = MockGraphQLClient();
  });

  void mockQueryResponse({
    required Map<String, dynamic>? data,
    bool isLoading = false,
    String? errorMessage,
  }) {
    final options = QueryOptions(
      document: gql(queries.getStocklist),
      variables: {
        'market': "TH",
        'sectors': "CONSUMER_DISCRETIONARY",
        'page': 0,
        'limit': 10,
      },
    );
    when(
      mockGraphQLClient.query(options),
    ).thenAnswer(
          (_) => Future.value(
        QueryResult(
          options: options,
          source:
          isLoading ? QueryResultSource.loading : QueryResultSource.network,
          data: data,
          exception: errorMessage != null
              ? OperationException(
            graphqlErrors: [
              GraphQLError(message: errorMessage),
            ],
          )
              : null,
        ),
      ),
    );
  }

  testWidgets(
      'renders ListTiles with correct character names when request is successful',
          (WidgetTester tester) async {
        mockQueryResponse(data: data_stocklist);
        await tester.pumpWidget(
            GraphQLProvider(
              client: GraphQLConfiguration.client,
              child: CacheProvider(child: MyApp()),
            )
        );
        await tester.pump();

        expect(find.widgetWithText(ListTile, 'Union Auction'), findsOneWidget);
        expect(find.widgetWithText(ListTile, 'MEB Corporation'), findsOneWidget);
        expect(find.byType(ListTile), findsNWidgets(2));
      });


  testWidgets('renders EasyLoading when request is loading',
          (WidgetTester tester) async {
        // mockQueryResponse(data: null, isLoading: true);
        await tester.pumpWidget(
          GraphQLProvider(
            client: GraphQLConfiguration.client,
            child: CacheProvider(child: MyApp()),
          )
        );
        await tester.pump();

        expect(find.byType(EasyLoading), findsOneWidget);
      });

  testWidgets('renders Text with error message when request has error',
          (WidgetTester tester) async {
        const errorMessage = 'custom error message';
        mockQueryResponse(data: null, errorMessage: errorMessage);
        await tester.pumpWidget(
          MyApp(),
        );
        await tester.pump();

        expect(find.text(errorMessage), findsOneWidget);
      });

}

const data_sector = {
  "data": {
    "listJittaSectorType": [
      {
        "name": "Consumer discretionary",
        "id": "CONSUMER_DISCRETIONARY"
      },
      {
        "name": "Consumer staples",
        "id": "CONSUMER_STAPLES"
      }
    ]
  }
};


const data_stocklist = {
  "data": {
    "jittaRanking": {
      "count": 119,
      "data": [
        {
          "id": "BKK:AUCT",
          "stockId": 74,
          "rank": 1,
          "symbol": "AUCT",
          "exchange": "BKK",
          "title": "Union Auction",
          "jittaScore": 6.84,
          "nativeName": "บริษัท สหการประมูล จำกัด (มหาชน)",
          "sector": {
            "id": "CONSUMER_DISCRETIONARY",
            "name": "Consumer discretionary"
          },
          "industry": "Diversified Consumer Services"
        },
        {
          "id": "BKK:MEB",
          "stockId": 2657948,
          "rank": 2,
          "symbol": "MEB",
          "exchange": "BKK",
          "title": "MEB Corporation",
          "jittaScore": 7.41,
          "nativeName": "บริษัท เมพ คอร์ปอเรชั่น จำกัด (มหาชน)",
          "sector": {
            "id": "CONSUMER_DISCRETIONARY",
            "name": "Consumer discretionary"
          },
          "industry": "Specialty Retail"
        }
      ]
    },
  }
};
