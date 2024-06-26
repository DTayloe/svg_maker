import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:svg_maker/image_seed_provider.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: MultiSplitViewTheme(
              data: MultiSplitViewThemeData(
                  dividerPainter: DividerPainters.grooved1(
                      color: Colors.indigo[100]!,
                      highlightedColor: Colors.indigo[900]!)),
              child: MultiSplitView(initialAreas: [
                Area(builder: (context, area) => ParametersView(), size: 300),
                Area(builder: (context, area) => OutputView()),
              ]))),
    );
  }
}

class ParametersView extends ConsumerStatefulWidget {
  const ParametersView({
    super.key,
  });

  @override
  ConsumerState<ParametersView> createState() => _ParametersViewState();
}

class _ParametersViewState extends ConsumerState<ParametersView> {
  // var pageWidthController = TextEditingController(text: "1122");
  // var pageHeightController = TextEditingController(text: "793");
  // var shapeDeltaController = TextEditingController(text: "300");
  // var scaleDeltaController = TextEditingController(text: "200");

  late List<(Seed, TextEditingController, Widget)> seedControllerMapping;

  // var _livePreviewEnabled = false;

  @override
  void initState() {
    super.initState();
    var asdf = ref.read(seedRepoNotifierProvider);
    seedControllerMapping = registerSeeds(asdf);
    print(asdf.toString());
  }

  @override
  Widget build(BuildContext context) {
    // var parameterInput2 = registerSeed("Page Width", pageWidthController);
    // var parameterInput3 = registerSeed("Page Height", pageHeightController);
    // var parameterInput4 = registerSeed("Shape Delta", shapeDeltaController);
    // var parameterInput5 = registerSeed("Scale Delta", scaleDeltaController);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // parameterInput2,
          // parameterInput3,
          // parameterInput4,
          // parameterInput5,
          // parameterInput("Shape Skew"),
          ...seedControllerMapping.map((e) => e.$3),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // make some of these doubles
                        // int pageWidth = int.parse(pageWidthController.text);
                        // int pageHeight = int.parse(pageHeightController.text);
                        // int shapeDelta = int.parse(shapeDeltaController.text);
                        // int scaleDelta = int.parse(scaleDeltaController.text);

                        print("1 Clicked generate");

                        // ref
                        //     .read(imageSeedNotifierProvider.notifier)
                        //     .updateSeeds(
                        //         pageWidth, pageHeight, shapeDelta, scaleDelta);
                        ref
                            .read(seedRepoNotifierProvider.notifier)
                            .updateSeeds(seedControllerMapping.map((e) {
                              var inputValue = e.$2.text;
                              dynamic result;
                              switch (e.$1.seedValue.runtimeType) {
                                case int:
                                  print("int");
                                  result = int.parse(inputValue);
                                  break;
                                case double:
                                  print("dbl");
                                  result = double.parse(inputValue);
                                  break;
                              }
                              return (e.$1, result);
                            }).toList());
                      },
                      child: Text("Generate")),
                  CheckboxListTile(
                    title: const Text("Live preview"),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ref.watch(livePreviewEnabledNotifierProvider),
                    onChanged: (value) {
                      print("Live update clicked: $value");
                      // setState(() {
                      //   _livePreviewEnabled = value!;
                      // });

                      ref
                          .read(livePreviewEnabledNotifierProvider.notifier)
                          .state = value!;
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<(Seed seed, TextEditingController controller, Widget widget)>
      registerSeeds(List<Seed> seeds) {
    return seeds.map((e) {
      var fieldTuple = createSeedField(e);

      return (e, fieldTuple.$1, fieldTuple.$2);
    }).toList();
  }

  (TextEditingController, Widget) createSeedField(Seed seed) {
    var controller = TextEditingController(text: seed.seedValue.toString());
    return (
      controller,
      TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(seed.seedName),
          ),
          onTap: () => controller.selection = TextSelection(
              baseOffset: 0, extentOffset: controller.value.text.length),
          keyboardType: TextInputType.number,
          inputFormatters: [
            DecimalTextInputFormatter(),
          ],
          onFieldSubmitted: (value) => print("onFieldSubmitted")
          // ref
          //     .read(imageSeedNotifierProvider.notifier)
          //     .updateSeed()

          )
    );
  }

  @override
  void dispose() {
    print("Disposed");
    // Clean up the controller when the widget is removed from the widget tree.

    // pageWidthController.dispose();
    // pageHeightController.dispose();
    // shapeDeltaController.dispose();
    // scaleDeltaController.dispose();
    super.dispose();
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value contains more than one period, revert to the old value.
    if (_countPeriods(newValue.text) > 1) {
      var (newStr, newPeriodIndex) =
          chooseNewPeriod(oldValue.text, newValue.text);

      return TextEditingValue(
          text: newStr,
          selection: TextSelection.collapsed(offset: newPeriodIndex));
    }

    if (RegExp(r'^-?\d*\.?\d*$').hasMatch(newValue.text)) {
      return newValue;
    }

    return oldValue;
  }

  int _countPeriods(String text) {
    return RegExp(r'\.').allMatches(text).length;
  }

  /// Still a bug here if a number is pasted with sequential dots or alphas
  (String, int) chooseNewPeriod(String oldStr, String newStr) {
    var newChars = newStr.characters;
    var oldChars = oldStr.characters;

    var newPeriodIndex = newChars.indexed
        .where((newChar) {
          if (newChar.$1 < oldChars.length) {
            return newChar.$2 != oldChars.elementAt(newChar.$1);
          } else {
            return true;
          }
        })
        .first
        .$1;

    var oldPeriodIndex = RegExp(r'\.')
        .allMatches(newStr)
        .where((element) => element.start != newPeriodIndex)
        .first
        .start;

    return (
      newStr.replaceRange(oldPeriodIndex, oldPeriodIndex + 1, ""),
      newPeriodIndex
    );
  }
}

class OutputView extends ConsumerWidget {
  const OutputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("2 OutputView build");

    // Very important! Will not refresh when value changes without this call. https://stackoverflow.com/a/78596381/3752444
    // ref.watch(imageSeedNotifierProvider);
    ref.watch(seedRepoNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SvgPicture.string(
        // createSvg(ref.read(imageSeedNotifierProvider.notifier).getSeed()),
        createSvg(ref.read(seedRepoNotifierProvider.notifier).getSeeds()),
        // File('assets/boxes.svg'),
        width: 500,
        height: 500,
      ),
    );
  }

  String createSvg(List<Seed> seeds) {
    print("3 Creating SVG string!");
// int pageWidth = seeds.singleWhere((e) => e.seedName == "");
// int pageHeight = seeds.singleWhere((e) => e.seedName == "");
// int shapeDelta = seeds.singleWhere((e) => e.seedName == "");
// int scaleDelta = seeds.singleWhere((e) => e.seedName == "");

    var [pageWidth, pageHeight, shapeDelta, scaleDelta] =
        seeds.map((e) => e.seedValue).toList();

    return '''
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   width="${pageWidth}px"
   height="${pageHeight}px"
   viewBox="0 0 1122.5197 793.70081"
   version="1.1"
   id="svg1"
   inkscape:version="1.3.2 (091e20e, 2023-11-25, custom)"
   sodipodi:docname="boxes.svg"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  <sodipodi:namedview id="namedview1" pagecolor="#ffffff" bordercolor="#000000" borderopacity="0.25" inkscape:showpageshadow="2" inkscape:pageopacity="0.0" inkscape:pagecheckerboard="0" inkscape:deskcolor="#d1d1d1" inkscape:document-units="mm" inkscape:zoom="1.052151" inkscape:cx="580.23991" inkscape:cy="382.54965" inkscape:window-width="1920" inkscape:window-height="1137" inkscape:window-x="-8" inkscape:window-y="746" inkscape:window-maximized="1" inkscape:current-layer="layer4" />
  <defs id="defs1" />
  <rect width="${pageWidth}px" height="${pageHeight}px" style="fill:#ffffff;stroke-width:1" stroke="black"/>
  <g inkscape:groupmode="layer" id="layer1" inkscape:label="Layer 1">
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect1"   width="${shapeDelta}"   height="${scaleDelta}"   x="50"   y="50"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect2"   width="${shapeDelta}"   height="${scaleDelta}"   x="407.5065617"   y="50"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect3"   width="${shapeDelta}"   height="${scaleDelta}"   x="765.0131234"   y="50"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect4"   width="${shapeDelta}"   height="${scaleDelta}"   x="50"   y="297.9002625"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect5"   width="${shapeDelta}"   height="${scaleDelta}"   x="407.5065617"   y="297.9002625"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect6"   width="${shapeDelta}"   height="${scaleDelta}"   x="765.0131234"   y="297.9002625"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect7"   width="${shapeDelta}"   height="${scaleDelta}"   x="50"   y="545.8005249"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect8"   width="${shapeDelta}"   height="${scaleDelta}"   x="407.5065617"   y="545.8005249"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect9"   width="${shapeDelta}"   height="${scaleDelta}"   x="765.0131234"   y="545.8005249"   />
  </g>
</svg>
''';
  }
}
