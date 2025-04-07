# speedometer_chart

A library of velocity gauge charts for Flutter.

<img src="https://gitlab.com/BrainBrax/speedometer_chart/-/raw/main/images/example.gif" width=300/>

### Install
Add the following dependency to your `pubspec.yaml` file:
```
dependencies:
    speedometer_chart: ^1.0.8
```

Import it in your dart code:
```
import 'package:speedometer_chart/speedometer_chart.dart';
```

### Usage

```
SpeedometerChart(
  dimension: 200,
  minValue: 0,
  maxValue: 100,
  value: 75,
  graphColor: [Colors.red, Colors.yellow, Colors.green],
  pointerColor: Colors.black,
)
```

### Property
The SpeedometerChart widget accepts the following properties:

| Key               | Description                               | Required | Type              |                  Default                  |
|:------------------|:------------------------------------------|:---------|:------------------|:-----------------------------------------:|
| dimension         | The size of the speedometer chart.        | false    | double            |                    600                    | 
| minValue          | The size of the speedometer chart.        | false    | double            |                     0                     |
| maxValue          | The minimum value of the chart.           | false    | double            |                    100                    |
| value             | The current value of the chart.           | true     | double            |                                           |
| minWidget         | The Widget to display the minimum value . | false    | Widget?           |                   null                    |
| maxWidget         | The Widget to display the maximum value.  | false    | Widget?           |                   null                    |
| graphColor        | A list of colors for the chart gradient.  | false    | List&lt;Color&gt; | [Colors.red, Colors.yellow, Colors.green] |
| hasIconPointer    | Define the image of the pointer.          | false    | bool              |                   true                    |
| pointerColor      | The color of the pointer.                 | false    | Color             |               Colors.black                |
| valueWidget       | The Widget to display the current value.  | false    | Widget?           |                   null                    |
| title             | The title of the chart.                   | false    | String?           |                   null                    |
| titleMargin       | The title margin of the chart.            | false    | double            |                    10                     |
| animationDuration | The duration of the chart animation.      | false    | int               |                   2000                    |
| hasTickSpace      | Define if the tick arc has white space.   | false    | bool              |                   false                   |

### Constructor
The SpeedometerChart also this constructor:

| Key               | Description                                            |
|:------------------|:-------------------------------------------------------|
| tick              | Replace the linear gradient with a tick visualization. |

Feel free to customize the properties based on your specific needs.

