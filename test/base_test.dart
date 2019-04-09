import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {

  group('test Argument', () {
    test('test argument with const value', () {
      expect(Argument("id", StringConst("test")).bake(), equals("id:\"test\""));
      expect(Argument("id", NumberConst(1)).bake(), equals("id:1"));
      expect(Argument("id", NullConst()).bake(), equals("id:null"));
    });

    test('test Argument with Variable', () {
      expect(Argument("id", Variable("var")).bake(), equals("id:\$var"));
    });
  });

  group('test Name', () {
    test('test bake method', () {
      expect(Name("id").bake(), equals("id"));
    });

    test('test validation', () {
      expect(Name.validate("1"), false);
      expect(Name.validate("tset_name"), true);
    });
  });

  group('test TypeCondition', () {
    test('test bake method', () {
      expect(TypeCondition("Dog").bake(), "on Dog");
    });
  });

  group('test VariableType', () {
    test('test non list variable type bake method', () {
      expect(VariableType("Int").bake(), "Int");
      expect(VariableType("Int", nullable: true).bake(), "Int");
      expect(VariableType("Int", nullable: false).bake(), "Int!");
    });

    test('test list type bake method', () {
      expect(ListType("Int").bake(), "[Int]");
      expect(ListType("Int", nullable: true).bake(), "[Int]");
      expect(ListType("Int", nullable: false).bake(), "[Int!]");
      expect(ListType("Int", nullable: true, nullableList: true).bake(), "[Int]");
      expect(ListType("Int", nullable: true, nullableList: false).bake(), "[Int]!");
      expect(ListType("Int", nullable: false, nullableList: false).bake(), "[Int!]!");
    });
  });

}