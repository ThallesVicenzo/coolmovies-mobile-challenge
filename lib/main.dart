import 'dart:io';

import 'package:coolmovies/app_module.dart';
import 'package:coolmovies/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final HttpLink httpLink = HttpLink(
    Platform.isAndroid
        ? 'http://10.0.2.2:5001/graphql'
        : 'http://localhost:5001/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  runApp(
    GraphQLProvider(
      client: client,
      child: ModularApp(
        module: AppModule(),
        child: const CoolMovies(),
      ),
    ),
  );
}

// void _fetchData() async {
//   print('Fetching data...');
//   var client = GraphQLProvider.of(context).value;

//   final QueryResult result = await client.query(QueryOptions(
//     document: gql(r"""
//           query AllMovies {
//             allMovies {
//               nodes {
//                 id
//                 imgUrl
//                 movieDirectorId
//                 userCreatorId
//                 title
//                 releaseDate
//                 nodeId
//                 userByUserCreatorId {
//                   id
//                   name
//                   nodeId
//                 }
//               }
//             }
//           }
//         """),
//   ));

