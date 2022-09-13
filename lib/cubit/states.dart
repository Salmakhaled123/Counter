abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterIncremented extends CounterStates {
  final int count;
  CounterIncremented(this.count);
}

class CounterDecremented extends CounterStates {
  final int count;
  CounterDecremented(this.count);
}

class SavaDataSuccessfully extends CounterStates {}

class Changemood extends CounterStates {}
