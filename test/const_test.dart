import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
    group('test BooleanConst', () {
      test('test bake method', () {
        var boolConstFalse = BooleanConst(false);
        var boolConstTrue = BooleanConst(true);
        assert(boolConstFalse.bake() == "false");
        assert(boolConstTrue.bake() == "true");
      });
    });

    group('test NumberConst', () {
      test('test bake method', () {
         assert(NumberConst(0).bake() == "0");
         assert(NumberConst(.1).bake() == "0.1");
         assert(NumberConst(.12).bake() == "0.12");
         assert(NumberConst(1.12).bake() == "1.12");
         assert(NumberConst(1.1233).bake() == "1.1233");
         assert(NumberConst(-100.0).bake() == "-100.0");
         assert(NumberConst(-100).bake() == "-100");
         assert(NumberConst(-0.0).bake() == "0");
         assert(NumberConst(-0).bake() == "0");
         assert(NumberConst(-2e3).bake() == "-2000.0");
      });
    });

    group('test ArrayConst', () {
      test('test bake method', () {
        var testSet1 = ArrayConst([BooleanConst(false), StringConst("test \" '"), NumberConst(12), NumberConst(11.1), NullConst()]);
        var testSet2 = ArrayConst([]);
        assert(testSet1.bake() == "[false,\"test \" '\",12,11.1,null]");
        assert(testSet2.bake() == "[]");
      });
    });
  
}
