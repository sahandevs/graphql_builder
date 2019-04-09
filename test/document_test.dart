import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
  group('test Document', () {
    test('basic test', () {
      expect(
          Document()
              .add(Query(name: "test")
                  .addSelection(Field("title"))
                  .addSelection(Field("name"))
                  .addSelection(FragmentSpread("frag1")))
              .add(Fragment("frag1", TypeCondition("Cat"))
                  .addSelection(Field("id"))
                  .addSelection(Field("name"))).bake(),
          equals("query test {title name ...frag1} fragment frag1 on Cat {id name}"));
    });
  });
}
