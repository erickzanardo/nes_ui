// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering, unused_element, strict_raw_type

part of 'nes_button.dart.stories.dart';

// **************************************************************************
// StoryGenerator
// **************************************************************************

typedef _Component = Component<NesButton, NesButtonArgs>;
typedef _Scenario = NesButtonScenario;
typedef _Defaults = NesButtonDefaults;
typedef _Story = NesButtonStory;
typedef _Args = NesButtonArgs;
final NesButtonComponent = Component<NesButton, NesButtonArgs>(
  name: meta.name ?? 'NesButton',
  path: meta.path ?? 'widgets',
  docs:
      meta.docs ??
      '{@template nes_button}\nRenders a pressable button.\n{@endtemplate}',
  stories: [
    $Default..$generatedName = 'Default',
    $Disabled..$generatedName = 'Disabled',
    $Secondary..$generatedName = 'Secondary',
  ],
);
typedef NesButtonScenario = Scenario<NesButton, NesButtonArgs>;
typedef NesButtonDefaults = Defaults<NesButton, NesButtonArgs>;

class NesButtonStory extends Story<NesButton, NesButtonArgs> {
  NesButtonStory({
    super.name,
    super.setup,
    super.modes,
    required super.args,
    StoryWidgetBuilder<NesButton, NesButtonArgs>? builder,
    super.scenarios,
  }) : super(
         builder:
             builder ??
             (context, args) => NesButton(
               key: args.key,
               type: args.type,
               child: args.child,
               onPressed: args.onPressed,
               onPressDown: args.onPressDown,
               onPressUp: args.onPressUp,
             ),
       );
}

class NesButtonArgs extends StoryArgs<NesButton> {
  NesButtonArgs({
    Arg<Key?>? key,
    Arg<NesButtonType>? type,
    required Arg<Widget> child,
    Arg<void Function()?>? onPressed,
    Arg<void Function()?>? onPressDown,
    Arg<void Function()?>? onPressUp,
  }) : this.keyArg = $initArg('key', key, null),
       this.typeArg = $initArg(
         'type',
         type,
         EnumArg<NesButtonType>(
           NesButtonType.normal,
           values: NesButtonType.values,
         ),
       )!,
       this.childArg = $initArg('child', child, null)!,
       this.onPressedArg = $initArg('onPressed', onPressed, null),
       this.onPressDownArg = $initArg('onPressDown', onPressDown, null),
       this.onPressUpArg = $initArg('onPressUp', onPressUp, null);

  NesButtonArgs.fixed({
    Key? key,
    NesButtonType type = NesButtonType.normal,
    required Widget child,
    void Function()? onPressed,
    void Function()? onPressDown,
    void Function()? onPressUp,
  }) : this.keyArg = key == null ? null : Arg.fixed(key),
       this.typeArg = Arg.fixed(type),
       this.childArg = Arg.fixed(child),
       this.onPressedArg = onPressed == null ? null : Arg.fixed(onPressed),
       this.onPressDownArg = onPressDown == null
           ? null
           : Arg.fixed(onPressDown),
       this.onPressUpArg = onPressUp == null ? null : Arg.fixed(onPressUp);

  final Arg<Key?>? keyArg;

  final Arg<NesButtonType> typeArg;

  final Arg<Widget> childArg;

  final Arg<void Function()?>? onPressedArg;

  final Arg<void Function()?>? onPressDownArg;

  final Arg<void Function()?>? onPressUpArg;

  Key? get key => keyArg?.value;

  NesButtonType get type => typeArg.value;

  Widget get child => childArg.value;

  void Function()? get onPressed => onPressedArg?.value;

  void Function()? get onPressDown => onPressDownArg?.value;

  void Function()? get onPressUp => onPressUpArg?.value;

  @override
  List<Arg?> get list => [
    keyArg,
    typeArg,
    childArg,
    onPressedArg,
    onPressDownArg,
    onPressUpArg,
  ];
}
