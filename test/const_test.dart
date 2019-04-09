import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
  group('test BooleanConst', () {
    test('test bake method', () {
      var boolConstFalse = BooleanConst(false);
      var boolConstTrue = BooleanConst(true);
      expect(boolConstFalse.bake(), equals("false"));
      expect(boolConstTrue.bake(), equals("true"));
    });
  });

  group('test NumberConst', () {
    test('test bake method', () {
      expect(NumberConst(0).bake(), equals("0"));
      expect(NumberConst(.1).bake(), equals("0.1"));
      expect(NumberConst(.12).bake(), equals("0.12"));
      expect(NumberConst(1.12).bake(), equals("1.12"));
      expect(NumberConst(1.1233).bake(), equals("1.1233"));
      expect(NumberConst(-100.0).bake(), equals("-100.0"));
      expect(NumberConst(-100).bake(), equals("-100"));
      expect(NumberConst(-0.0).bake(), equals("0"));
      expect(NumberConst(-0).bake(), equals("0"));
      expect(NumberConst(-2e3).bake(), equals("-2000.0"));
    });
  });

  group('test ArrayConst', () {
    test('test bake method', () {
      var testSet1 = ArrayConst([
        BooleanConst(false),
        StringConst("test \" '"),
        NumberConst(12),
        NumberConst(11.1),
        NullConst()
      ]);
      var testSet2 = ArrayConst([]);
      expect(testSet1.bake(), equals("[false,\"test \" '\",12,11.1,null]"));
      expect(testSet2.bake(), equals("[]"));
    });
  });
}
