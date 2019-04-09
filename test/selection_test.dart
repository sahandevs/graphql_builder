import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
  group('test FragmentSpread', () {
    test('test bake method with simple parameters', () {
      expect(FragmentSpread("frag1").bake(), equals("...frag1"));
      expect(FragmentSpread("frag_tst").bake(), equals("...frag_tst"));
    });

    test('test bake method with sinle directive', () {
      expect(
          FragmentSpread("frag1")
              .addDirective(SkipDirective(Variable("tst")))
              .bake(),
          equals("...frag1 @skip(if:\$tst)"));
      expect(
          FragmentSpread("frag_tst")
              .addDirective(IncludeDirective(Variable("tst")))
              .bake(),
          equals("...frag_tst @include(if:\$tst)"));
    });

    test('test bake method with many directives', () {
      expect(
          FragmentSpread("frag1")
              .addDirective(SkipDirective(Variable("var1")))
              .addDirective(IncludeDirective(Variable("var2")))
              .addDirective(IncludeDirective(Variable("var3")))
              .bake(),
          equals(
              "...frag1 @skip(if:\$var1) @include(if:\$var2) @include(if:\$var3)"));
    });
  });

  group('test InlineFragment', () {
    test('test bake method with simple parameter', () {
      expect(InlineFragment().addSelection(Field("id")).bake(), "... {id}");
      expect(
          InlineFragment()
              .addSelection(Field("id"))
              .addSelection(Field("name"))
              .bake(),
          "... {id name}");
    });
    test('test bake method with directive', () {
      expect(
          InlineFragment()
              .addSelection(Field("id"))
              .addSelection(Field("name"))
              .addDirective(IncludeDirective(Variable("var1")))
              .bake(),
          "... @include(if:\$var1) {id name}");
      expect(
          InlineFragment()
              .addSelection(Field("id"))
              .addDirective(IncludeDirective(Variable("var1")))
              .addDirective(SkipDirective(Variable("var2")))
              .bake(),
          "... @include(if:\$var1) @skip(if:\$var2) {id}");
    });
    test('test bake method with type condition and directive', () {
      expect(
          InlineFragment(typeCondition: TypeCondition("Cat"))
              .addSelection(Field("id"))
              .addSelection(Field("name"))
              .addDirective(IncludeDirective(Variable("var1")))
              .bake(),
          "... on Cat @include(if:\$var1) {id name}");
      expect(
          InlineFragment(typeCondition: TypeCondition("Dog"))
              .addSelection(Field("id"))
              .addDirective(IncludeDirective(Variable("var1")))
              .addDirective(SkipDirective(Variable("var2")))
              .bake(),
          "... on Dog @include(if:\$var1) @skip(if:\$var2) {id}");
    });
  });

  group('test Field', () {
    test('test bake method with simple parameters', () {
      expect(Field("id").bake(), "id");
      expect(Field("id", alias: Name("alias")).bake(), "alias:id");
    });
    test('test bake method with arguments', () {
      expect(Field("city").addArgument(Argument("id", NumberConst(1))).bake(),
          "city(id:1)");
      expect(
          Field("city")
              .addArgument(Argument("id", NumberConst(1)))
              .addArgument(Argument("name", StringConst("test")))
              .bake(),
          "city(id:1,name:\"test\")");
    });
    test('test bake method with selection', () {
      expect(
          Field("city")
              .addArgument(Argument("id", NumberConst(1)))
              .addArgument(Argument("name", StringConst("test")))
              .addSelection(Field("name"))
              .addSelection(Field("title"))
              .bake(),
          "city(id:1,name:\"test\") {name title}");
      expect(
          Field("city")
              .addSelection(Field("name"))
              .addSelection(Field("title"))
              .bake(),
          "city {name title}");
    });
    test('test bake method with deep selection', () {
      expect(
          Field("city")
              .addArgument(Argument("id", NumberConst(1)))
              .addArgument(Argument("name", StringConst("test")))
              .addSelection(Field("name")
                  .addArgument(Argument("id", NumberConst(1)))
                  .addSelection(Field("title")))
              .addSelection(
                Field("title").addSelection(Field("id")),
              )
              .bake(),
          "city(id:1,name:\"test\") {name(id:1) {title} title {id}}");
    });
  });
}
