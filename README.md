## ShimmerContainer

The `ShimmerContainer` is a customizable, animated loading widget for Flutter applications. It provides a shimmering effect by sliding a secondary color over a primary color, giving the appearance of a content placeholder being loaded. The animation is cyclic, ensuring a continuous loading effect.

## Example ☕️

<img src="https://github.com/altaysakarya/shimmer_container_widget/blob/main/example.gif?raw=true" width="192" height="388" alt="Example GIF">

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  loading_container: ^0.0.2
```

## Features

* Customizable `Width` and `Height`: Adjust the dimensions of the widget as required.
* `Color` Customization: Define primary and secondary colors for the shimmer effect.
* Custom `BorderRadius`: Set a custom border radius for the container.
* Custom `Box Decoration`: If more customization is required, a custom box decoration can be 

## Properties

* `colorOne`: The primary color of the container. Default is `Color(0xFFE5E5E5)`.
* `colorTwo`: The secondary color that slides over the primary color to create the shimmer effect. Default is `Color(0xFFF0F0F0)`.
* `width`: The width of the container. Default is `double.infinity`.
* `height`: The height of the container. Default is `50`.
* `borderRadius`: The border radius of the container. Default is `8.0`.
* `boxDecoration`: An optional custom `BoxDecoration` for the container.
* `duration`: The duration of the shimmering animation. Default is `750 milliseconds`.

## Usage

```dart
ShimmerContainer(
  width: 200,
  height: 50,
  colorOne: Colors.grey[300],
  colorTwo: Colors.grey[100],
  borderRadius: BorderRadius.circular(10),
  duration: Duration(milliseconds: 800),
)
```

## Note

Ensure the widget is properly disposed to avoid potential memory leaks related to the animation controller.