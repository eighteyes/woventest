import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element.
 */


@CustomTag('fb-query')
class ClickCounter extends PolymerElement {
  @published int count = 0;

  ClickCounter.created() : super.created() {
  }

  void increment() {
    count++;
  }
}

