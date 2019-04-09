import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
  group('test Fragment', () {
    test('test bake method with simple parameters', () {
      expect(
          Fragment("fragtest", TypeCondition("Dog"))
              .addSelection(Field("id"))
              .bake(),
          equals("fragment fragtest on Dog {id}"));
    });

    test('test bake method with directives', () {
      expect(
          Fragment("fragtest", TypeCondition("Dog"))
              .addDirective(IncludeDirective(Variable("var1")))
              .addSelection(Field("id"))
              .bake(),
          equals("fragment fragtest on Dog @include(if:\$var1) {id}"));
      expect(
          Fragment("fragtest", TypeCondition("Dog"))
              .addDirective(IncludeDirective(Variable("var1")))
              .addDirective(SkipDirective(Variable("var2")))
              .addSelection(Field("id"))
              .bake(),
          equals(
              "fragment fragtest on Dog @include(if:\$var1) @skip(if:\$var2) {id}"));
    });

    test('test bake method complex', () {
      expect(
          Fragment("fragtest", TypeCondition("Dog"))
              .addDirective(IncludeDirective(Variable("var1")))
              .addDirective(SkipDirective(Variable("var2")))
              .addSelection(
                Field("id"),
              )
              .addSelection(
                InlineFragment()
                .addDirective(IncludeDirective(Variable("var1")))
                .addSelection(
                  Field("name")
                      .addArgument(Argument("id", Variable("var3")))
                      .addSelection(Field("lastname")),
                ),
              )
              .addSelection(Field("name"))
              .bake(),
          equals(
              "fragment fragtest on Dog @include(if:\$var1) @skip(if:\$var2) {id ... @include(if:\$var1) {name(id:\$var3) {lastname}} name}"));
    });
  });
}
