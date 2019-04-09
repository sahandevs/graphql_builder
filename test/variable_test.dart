import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
  group('test variables', () {
    test('test bake method', () {
      expect(Variable("testVariable").bake(), equals("\$testVariable"));
      expect(Variable("testV_ariable").bake(), equals("\$testV_ariable"));
    });
  });

  group('test variable definition', () {
    test('test variable without default value', () {
      expect(VariableDefinition("id", VariableType("Int")).bake(),
          equals("\$id:Int"));
      expect(
          VariableDefinition("id", VariableType("Int", nullable: false)).bake(),
          equals("\$id:Int!"));
    });
    test('test variable with default value', () {
      expect(
          VariableDefinition("id", VariableType("Int"),
                  defaultValue: NumberConst(10))
              .bake(),
          equals("\$id:Int=10"));
    });
  });
}
