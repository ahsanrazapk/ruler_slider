import 'package:flutter/material.dart';
import 'package:ruler_slider/ruler_slider.dart';

void main() {
  runApp(const RulerSliderDemoApp());
}

class RulerSliderDemoApp extends StatelessWidget {
  const RulerSliderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RulerSliderDemo(),
    );
  }
}

class RulerSliderDemo extends StatefulWidget {
  @override
  _RulerSliderDemoState createState() => _RulerSliderDemoState();
}

class _RulerSliderDemoState extends State<RulerSliderDemo> {
  double minValue = 0.0;
  double maxValue = 100.0;
  double horizontalValue = 50.0;
  double verticalValue = 50.0;
  double rulerWidth = 300.0;
  double rulerHeight = 100.0;
  double tickSpacing = 10.0;
  double scrollSensitivity = 1.0;
  bool showFixedBar = true;
  bool showFixedLabel = true;
  bool enableSnapping = false;
  int majorTickInterval = 5;
  int labelInterval = 10;
  double labelOffset = 25.0;
  bool showLabels = true;
  double majorTickLength = 20.0;
  double minorTickLength = 10.0;
  String selectedColor = 'Blue';
  String selectedLabelColor = 'Black';
  RulerOrientation orientation = RulerOrientation.horizontal;

  final List<String> colors = ['Blue', 'Red', 'Green', 'Yellow'];
  final List<String> labelColors = ['Black', 'Red', 'Blue', 'Green'];
  final Map<String, Color> colorMap = {
    'Blue': Colors.blue,
    'Red': Colors.red,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
  };
  final Map<String, Color> labelColorMap = {
    'Black': Colors.black,
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
  };

  final List<String> customLabels = [
    'Start', '10', '20', '30', '40', 'Mid', '60', '70', '80', '90', 'End'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RulerSlider Full Demo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Orientation selector
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Orientation: '),
                  SegmentedButton<RulerOrientation>(
                    segments: const [
                      ButtonSegment(
                        value: RulerOrientation.horizontal,
                        label: Text('Horizontal'),
                        icon: Icon(Icons.swap_horiz),
                      ),
                      ButtonSegment(
                        value: RulerOrientation.vertical,
                        label: Text('Vertical'),
                        icon: Icon(Icons.swap_vert),
                      ),
                    ],
                    selected: {orientation},
                    onSelectionChanged: (Set<RulerOrientation> newSelection) {
                      setState(() {
                        orientation = newSelection.first;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Display the RulerSlider based on orientation
              if (orientation == RulerOrientation.horizontal)
                _buildHorizontalRuler()
              else
                _buildVerticalRuler(),

              const Divider(),
              // Controls to dynamically change properties
              const Text('Adjust RulerSlider Features:'),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tick Spacing: ${tickSpacing.toStringAsFixed(1)}'),
                  Slider(
                    value: tickSpacing,
                    min: 5,
                    max: 30,
                    onChanged: (value) {
                      setState(() {
                        tickSpacing = value;
                      });
                    },
                  ),
                ],
              ),
              DropdownButton<String>(
                value: selectedColor,
                items: colors.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newColor) {
                  setState(() {
                    selectedColor = newColor!;
                  });
                },
                hint: const Text("Select Bar Color"),
              ),
              DropdownButton<String>(
                value: selectedLabelColor,
                items: labelColors.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newColor) {
                  setState(() {
                    selectedLabelColor = newColor!;
                  });
                },
                hint: const Text("Select Label Color"),
              ),
              SwitchListTile(
                title: const Text('Show Fixed Bar'),
                value: showFixedBar,
                onChanged: (value) {
                  setState(() {
                    showFixedBar = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Show Fixed Label'),
                value: showFixedLabel,
                onChanged: (value) {
                  setState(() {
                    showFixedLabel = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Enable Snapping'),
                value: enableSnapping,
                onChanged: (value) {
                  setState(() {
                    enableSnapping = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Show Labels'),
                value: showLabels,
                onChanged: (value) {
                  setState(() {
                    showLabels = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Scroll Sensitivity: ${scrollSensitivity.toStringAsFixed(1)}'),
                  Slider(
                    value: scrollSensitivity,
                    min: 0.1,
                    max: 5.0,
                    onChanged: (value) {
                      setState(() {
                        scrollSensitivity = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Major Tick Length: ${majorTickLength.toStringAsFixed(1)}'),
                  Slider(
                    value: majorTickLength,
                    min: 10.0,
                    max: 40.0,
                    onChanged: (value) {
                      setState(() {
                        majorTickLength = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Minor Tick Length: ${minorTickLength.toStringAsFixed(1)}'),
                  Slider(
                    value: minorTickLength,
                    min: 5.0,
                    max: 20.0,
                    onChanged: (value) {
                      setState(() {
                        minorTickLength = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Label Offset: ${labelOffset.toStringAsFixed(1)}'),
                  Expanded(
                    child: Slider(
                      value: labelOffset,
                      min: 10.0,
                      max: 50.0,
                      onChanged: (value) {
                        setState(() {
                          labelOffset = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalRuler() {
    return Column(
      children: [
        Text(
          'Horizontal: ${horizontalValue.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        RulerSlider(
          minValue: minValue,
          maxValue: maxValue,
          initialValue: horizontalValue,
          rulerWidth: MediaQuery.of(context).size.width - 32,
          rulerHeight: rulerHeight,
          selectedBarColor: colorMap[selectedColor]!,
          unselectedBarColor: Colors.grey,
          tickSpacing: tickSpacing,
          showFixedBar: showFixedBar,
          fixedBarColor: Colors.red,
          fixedBarWidth: 2.0,
          fixedBarHeight: 40.0,
          showFixedLabel: showFixedLabel,
          fixedLabelColor: Colors.red,
          scrollSensitivity: scrollSensitivity,
          enableSnapping: enableSnapping,
          majorTickInterval: majorTickInterval,
          labelInterval: labelInterval,
          labelOffset: labelOffset,
          showLabels: showLabels,
          labelTextStyle: TextStyle(
            color: labelColorMap[selectedLabelColor]!,
            fontSize: 12,
          ),
          majorTickLength: majorTickLength,
          minorTickLength: minorTickLength,
          customLabels: customLabels,
          orientation: RulerOrientation.horizontal,
          onChanged: (value) {
            setState(() {
              horizontalValue = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildVerticalRuler() {
    return Column(
      children: [
        Text(
          'Vertical: ${verticalValue.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 400,
          child: RulerSlider(
            minValue: minValue,
            maxValue: maxValue,
            initialValue: verticalValue,
            rulerWidth: 150,
            rulerHeight: 400,
            selectedBarColor: colorMap[selectedColor]!,
            unselectedBarColor: Colors.grey,
            tickSpacing: tickSpacing,
            showFixedBar: showFixedBar,
            fixedBarColor: Colors.red,
            fixedBarWidth: 2.0,
            fixedBarHeight: 40.0,
            showFixedLabel: showFixedLabel,
            fixedLabelColor: Colors.red,
            scrollSensitivity: scrollSensitivity,
            enableSnapping: enableSnapping,
            majorTickInterval: majorTickInterval,
            labelInterval: labelInterval,
            labelOffset: 5.0, // Smaller offset for vertical since labels are next to ticks
            showLabels: showLabels,
            labelTextStyle: TextStyle(
              color: labelColorMap[selectedLabelColor]!,
              fontSize: 12,
            ),
            majorTickLength: majorTickLength,
            minorTickLength: minorTickLength,
            customLabels: customLabels,
            orientation: RulerOrientation.vertical,
            onChanged: (value) {
              setState(() {
                verticalValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
