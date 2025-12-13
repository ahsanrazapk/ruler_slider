## ruler_slider

[![pub](https://img.shields.io/badge/pub-v0.0.3-blue.svg)](https://pub.dev/packages/ruler_slider)

# Ruler Slider Plugin for Flutter

This package provides a highly customizable horizontal and vertical ruler slider for Flutter. It allows users to scroll through a ruler-like interface and select values, with options for custom tick marks, labels, snapping behavior, and more.

## Features

- **Horizontal and Vertical orientation** support.
- Customizable tick marks (color, size, and spacing).
- Optional snapping behavior for precise value selection.
- Custom labels for specific tick intervals.
- Adjustable appearance of the ruler, tick marks, labels, and fixed bars.
- Callback function that returns the selected value.
- Label scale factor for precision-based rulers.

## Screenshots

Here are some screenshots showcasing the RulerSlider in action:

![Screenshot 1](https://github.com/ahsanrazapk/ruler_slider/raw/master/example/assets/1.png) ![Screenshot 2](https://github.com/ahsanrazapk/ruler_slider/raw/master/example/assets/2.png) ![Screenshot 3](https://github.com/ahsanrazapk/ruler_slider/raw/master/example/assets/3.png) ![Screenshot 4](https://github.com/ahsanrazapk/ruler_slider/raw/master/example/assets/4.png) ![Screenshot 5](https://github.com/ahsanrazapk/ruler_slider/raw/master/example/assets/5.png) ![Screenshot 6](https://github.com/ahsanrazapk/ruler_slider/raw/master/example/assets/1.png)


## Parameters

- **`minValue`**: (double) Minimum value of the slider.
- **`maxValue`**: (double) Maximum value of the slider.
- **`initialValue`**: (double) Initial value of the slider, default is the midpoint of `minValue` and `maxValue`.
- **`rulerWidth`**: (double) Width of the ruler widget.
- **`rulerHeight`**: (double) Height of the ruler widget.
- **`selectedBarColor`**: (Color) Color of the selected tick marks.
- **`unselectedBarColor`**: (Color) Color of unselected tick marks.
- **`tickSpacing`**: (double) Space between each tick on the ruler.
- **`valueTextStyle`**: (TextStyle) Style for the label that shows the current value.
- **`customLabels`**: (List<String>?) Optional custom labels for specific tick intervals.
- **`onChanged`**: (ValueChanged<double>?) Callback that returns the selected value.
- **`showFixedBar`**: (bool) Whether to display a fixed center bar for current value indication.
- **`fixedBarColor`**: (Color) Color of the fixed bar.
- **`fixedBarWidth`**: (double) Width of the fixed bar.
- **`fixedBarHeight`**: (double) Height of the fixed bar.
- **`showFixedLabel`**: (bool) Whether to display a fixed label showing the current value.
- **`fixedLabelColor`**: (Color) Color of the fixed label.
- **`scrollSensitivity`**: (double) Adjusts the scroll sensitivity of the ruler.
- **`enableSnapping`**: (bool) Enable or disable snapping behavior.
- **`majorTickInterval`**: (int) Interval for major tick marks (e.g., every 5 or 10 ticks).
- **`labelInterval`**: (int) Interval for showing labels (e.g., every 10 ticks).
- **`labelOffset`**: (double) Offset for the labels (vertical for horizontal orientation, horizontal for vertical orientation).
- **`showLabels`**: (bool) Whether to display labels.
- **`labelTextStyle`**: (TextStyle) Custom text style for labels.
- **`majorTickLength`**: (double) Length of major tick marks.
- **`minorTickLength`**: (double) Length of minor tick marks.
- **`orientation`**: (RulerOrientation) Orientation of the ruler (`horizontal` or `vertical`). Defaults to `horizontal`.
- **`labelScaleFactor`**: (double) Factor to divide label values by (useful for precision-based rulers).

## Example (Horizontal)

```dart
RulerSlider(
  minValue: 0.0,
  maxValue: 100.0,
  initialValue: 50.0,
  rulerWidth: 300.0,
  rulerHeight: 100.0,
  selectedBarColor: Colors.blue,
  unselectedBarColor: Colors.grey,
  tickSpacing: 10.0,
  valueTextStyle: TextStyle(color: Colors.red, fontSize: 18),
  customLabels: ['Start', '10', '20', '30', '40', 'Middle', '60', '70', '80', '90', 'End'],
  onChanged: (double value) {
    print("Current value: \${value.toStringAsFixed(1)}");
  },
  showFixedBar: true,
  fixedBarColor: Colors.red,
  fixedBarWidth: 3.0,
  fixedBarHeight: 40.0,
  showFixedLabel: true,
  fixedLabelColor: Colors.red,
  scrollSensitivity: 1.0,
  enableSnapping: true,
  majorTickInterval: 5,
  labelInterval: 10,
  labelOffset: 30.0,
  showLabels: true,
  labelTextStyle: TextStyle(color: Colors.black, fontSize: 12),
  majorTickLength: 20.0,
  minorTickLength: 10.0,
  orientation: RulerOrientation.horizontal,
)
```

## Example (Vertical)

```dart
RulerSlider(
  minValue: 0.0,
  maxValue: 100.0,
  initialValue: 50.0,
  rulerWidth: 150.0,
  rulerHeight: 400.0,
  selectedBarColor: Colors.blue,
  unselectedBarColor: Colors.grey,
  tickSpacing: 10.0,
  onChanged: (double value) {
    print("Current value: \${value.toStringAsFixed(1)}");
  },
  orientation: RulerOrientation.vertical,
)
```

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  ruler_slider: ^0.0.3
```

Then run `flutter pub get` to install the package.

## Usage

After installation, import the library in your Dart file:

```dart
import 'package:ruler_slider/ruler_slider.dart';
```

Now you can use the `RulerSlider` widget in your Flutter application for creating a scrollable, interactive ruler.

## Customization

You can customize the ruler's appearance, tick spacing, and labels using the various parameters described above. The `onChanged` callback provides the selected value, making it easy to integrate the slider into your application logic.


## Support and Donations

If you find this project helpful and would like to support its development, you can donate via Wise (TransferWise). Your contributions are greatly appreciated!

[![Donate](https://img.shields.io/badge/Donate-Wise-00B9FF?style=for-the-badge&logo=wise&logoColor=white)](https://wise.com/pay/me/muhammadahsanr13)


This package is open-source and free to use. Contributions are welcome!
