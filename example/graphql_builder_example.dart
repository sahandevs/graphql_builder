import 'package:graphql_builder/graphql_builder.dart';

main() {
  print(Document().add(Query().addSelection(Field("id"))));
}
