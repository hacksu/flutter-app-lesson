void printEvent(String event, String time) {
  print("The " + event + " is at " + time);
}

void printEventNP({required String event, required String time}) {
  print("The " + event + " is at " + time);
}

class Mouse {
  String _first;
  String _last;
  Mouse(this._first, this._last);
  Mouse.disneyStyleLastName(this._first) : _last = "Mouse";
  String toString() {
    return _first + "🐭" + _last;
  }
}

void main() {
  print("Hello world :3");

  printEvent("7:00 PM", "meeting");

  printEventNP(time: "7:00 PM", event: "meeting");

  Mouse hatsune = Mouse("Hatsune", "Squeaku");
  print(hatsune);

  Mouse mickey = Mouse.disneyStyleLastName("Mickey");
  print(mickey);
}
