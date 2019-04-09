import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
  group('test Operation', () {
    test('test different operation names', () {
      expect(Query().addSelection(Field("id")).bake(), equals("query {id}"));
      expect(Subscription().addSelection(Field("id")).bake(),
          equals("subscription {id}"));
      expect(
          Mutation().addSelection(Field("id")).bake(), equals("mutation {id}"));
    });

    test('test operation with simple parameters', () {
      expect(
          Query(name: "test")
              .addSelection(Field("id"))
              .addSelection(Field("name"))
              .bake(),
          equals("query test {id name}"));
      expect(
          Query(name: "test")
              .addSelection(Field("id"))
              .addSelection(Field("name").addSelection(Field("last")))
              .bake(),
          equals("query test {id name {last}}"));
    });

    test('test operation with complex parameters', () {
      expect(
          Query(name: "test")
              .addSelection(Field("id"))
              .addSelection(Field("name").addSelection(Field("last")))
              .addDirective(IncludeDirective(Variable("var1")))
              .addDirective(SkipDirective(Variable("var2")))
              .addVariable(VariableDefinition(
                  "id", VariableType("Int", nullable: false)))
              .addVariable(VariableDefinition("name", VariableType("String"),
                  defaultValue: StringConst("test")))
              .bake(),
          equals("query test(\$id:Int!,\$name:String=\"test\") @include(if:\$var1) @skip(if:\$var2) {id name {last}}"));
    });
  });
}
