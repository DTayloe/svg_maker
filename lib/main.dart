import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_split_view/multi_split_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplitWrapper(),
      ),
    );
  }
}

class SplitWrapper extends StatelessWidget {
  const SplitWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(initialAreas: [
      Area(builder: (context, area) => ParametersView(), size: 300),
      Area(builder: (context, area) => OutputView()),
    ]);
  }
}

class ParametersView extends StatefulWidget {
  const ParametersView({
    super.key,
  });

  @override
  State<ParametersView> createState() => _ParametersViewState();
}

class _ParametersViewState extends State<ParametersView> {
  final pageWidthController = TextEditingController(text: "1122");
  final pageHeightController = TextEditingController(text: "793");
  final shapeDeltaController = TextEditingController(text: "300");
  final scaleDeltaController = TextEditingController(text: "200");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          parameterInput("Page Width", pageWidthController),
          parameterInput("Page Height", pageHeightController),
          parameterInput("Shape Delta", shapeDeltaController),
          parameterInput("Scale Delta", scaleDeltaController),
          // parameterInput("Shape Skew"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    // make some of these doubles
                    final int pageWidth = int.parse(pageWidthController.text);
                    final int pageHeight = int.parse(pageHeightController.text);
                    final int shapeDelta = int.parse(shapeDeltaController.text);
                    final int scaleDelta = int.parse(scaleDeltaController.text);

                    OutputView.generate(
                        pageWidth, pageHeight, shapeDelta, scaleDelta);
                  },
                  child: Text("Generate")),
            ),
          )
        ],
      ),
    );
  }

  Widget parameterInput(String labelText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
      ),
      keyboardType: TextInputType.number, // make some of these doubles
      onTap: () => controller.selection = TextSelection(
          baseOffset: 0, extentOffset: controller.value.text.length),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    pageWidthController.dispose();
    pageHeightController.dispose();
    shapeDeltaController.dispose();
    scaleDeltaController.dispose();
    super.dispose();
  }
}

class OutputView extends StatefulWidget {
  OutputView({super.key});

  String svgString = "";

  static int _pageWidthTemp = 1122;
  static int _pageHeightTemp = 793;
  static int _shapeDeltaTemp = 300;
  static int _scaleDeltaTemp = 200;

  static void generate(
      int pageWidth, int pageHeight, int shapeDelta, int scaleDelta) {
    _pageWidthTemp = pageWidth;
    _pageHeightTemp = pageHeight;
    _shapeDeltaTemp = shapeDelta;
    _scaleDeltaTemp = scaleDelta;
  }

  @override
  State<OutputView> createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView> {
  @override
  Widget build(BuildContext context) {
    createSvg(OutputView._pageWidthTemp, OutputView._pageHeightTemp,
        OutputView._shapeDeltaTemp, OutputView._scaleDeltaTemp);
    return SvgPicture.string(
      widget.svgString,
      // File('assets/boxes.svg'),
      width: 500,
      height: 500,
    );
  }

  void createSvg(
      int pageWidth, int pageHeight, int shapeDelta, int scaleDelta) {
    widget.svgString = '''
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
  <g inkscape:groupmode="layer" id="layer1" inkscape:label="Layer 1">
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect1"   width="$shapeDelta"   height="$scaleDelta"   x="50"   y="50"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect2"   width="$shapeDelta"   height="$scaleDelta"   x="407.5065617"   y="50"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect3"   width="$shapeDelta"   height="$scaleDelta"   x="765.0131234"   y="50"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect4"   width="$shapeDelta"   height="$scaleDelta"   x="50"   y="297.9002625"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect5"   width="$shapeDelta"   height="$scaleDelta"   x="407.5065617"   y="297.9002625"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect6"   width="$shapeDelta"   height="$scaleDelta"   x="765.0131234"   y="297.9002625"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect7"   width="$shapeDelta"   height="$scaleDelta"   x="50"   y="545.8005249"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect8"   width="$shapeDelta"   height="$scaleDelta"   x="407.5065617"   y="545.8005249"   />
    <rect   style="fill:#0000ff;stroke-width:0.933205"   id="rect9"   width="$shapeDelta"   height="$scaleDelta"   x="765.0131234"   y="545.8005249"   />
  </g>
</svg>
''';
  }
}
