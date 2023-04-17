# Flutter

is an app development framework created by Google. It is relatively young; its version 1.0 was released in December 2018; but it's already in use for major mobile apps like Google Pay and eBay Motors. It's a cross-platform framework; you can make apps using Flutter and compile them to run on Windows, MacOS, Android, iOS, and apparently Google Fuschia, which is an operating system that I had never heard of. You can also compile for web browsers and put your app online; in my experience, Flutter web apps are a little slow and clunky because they exist in their own little world kind of like Flash games did, but it's still pretty convenient; like, you can put a demo version of your app online really easily, and then tell people that if they like it they should download the real version.

And I personally appreciate Flutter because it lets you create moden user interfaces without using the standard web languages of HTML, CSS, and JavaScript. In large part, I suspect, because web technologies are consistently portable to different platforms, most user interfaces today are created using those and then adapted into apps, a lot of the time just by taking a web browser and customizing it to not look like one. Like, even when you have Discord as an app on your computer, guess what, it's just a web page in disguise, you can see the HTML. It's the same for WhatsApp and Microsoft Teams and VSCode and a bunch of other apps.

HTML, CSS, and JavaScript have taken over the field of graphical user interfaces, which results in apps that are slow, because JavaScript is a slow language, and hard to program, because HTML, CSS, and JavaScript are old languages full of inexplicaple syntax for historical reasons that need lots of frameworks and libraries to try to make them modern and useable. Our subjects today will be the programming language called Dart and the user interface library written in it called Flutter, which offer a fully modern cross-platform alternative. (Whereas with web development, you will kind of need to augment your HTML/CSS/JavaScript with stuff like jQuery, React, Vue, Angular, Tailwind CSS, etc, etc.) So that's why you would learn to use this stuff. Let's start with some basics of the Dart programming language.

## Dart: It is normal

I'm assuming most of you have at least a little programming experience, for one thing because it's the end of the semester and taking CS1 is like bootcamp, and for another thing because the weather is warm now and if you were normal you'd be playing outside. We can run Dart code online by going to https://dartpad.dev; let's look at the "Hello World" example they have there.

```dart
void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}

```

It looks a lot like C++, right? You have a function called "main" that starts the program with a for loop in it; then a call to a print function inside the for loop, which is how you output to the console with Dart. Inside the call to the print function we have an example of string interpolation, which is how you combine string literals and variables in Dart but which we don't have to worry much about. Let's replace that with just `print('hello world');` (single quotes and double quotes are equivalent in Dart, both produce strings) and run it.

Wow, we just printed "hello world" 5 times. Good for us.

Now let's make things a little bit more interesting and define our own function above `main`. It will print two things. This is still a lot like C++:

```dart
void printEvent(String time, String event) {
  print("The "+event+" is at "+time);
}
```

So, we are declaring a function. The return type of the function is `void`, meaning it does not return anything. It has two parameters: a String paramater called event and another String parameter called time. In Dart, the built-in string class has a name that starts with a capital letter and you don't have to #include or use std:: to use it. And we are taking these two arguments and concatenating strings to get an output. Let's call this in `main`:

```dart
printEvent("7:00 PM", "meeting");
```

So, that's great. Functions are a thing in Dart.

### Named Parameters

But we can go one step further with this than we could with C++. The problem with this function is that you have to remember the order of the arguments; when you call it, you have to first put the time, then the event name; I could easily imagine someone mixing this up and doing:

```dart
printEvent("meeting", "7:00 PM");
```

And I don't think there's any obvious, conclusive, true order that the arguments should be in. To help with this, we can use named parameters. We can define a function like this:

```dart
void printEventNP({required String time, required String event}) {
  print("The "+event+" is at "+time);
}
```

So, the only difference is that I added NP to the name for "named parameters", then I wrapped the arguments in curly braces, then I had to add to word "required" in front of the argument type because for whatever reason, by default they're considered "optional", which we won't go into right now. The advantage of named parameters over the normal kind (the normal kind are called "positional") is that now we can call the function like this:

```dart
printEventNP(event: "meeting", time: "7:00 PM");
```

So now we don't have to worry about what order we're giving the arguments in; we just have to give them names. This style of calling functions is, in my opinion, more readable than just doing it based on the order of the arguments, and it's used by functions in the Flutter library a lot.

### Classes & Named Constructors

And another thing that the Flutter library uses a lot is classes and objects. I'm guessing that you know that an object is a programming language construct that groups together some variables and the functions that should operate on those variables, and that many different versions or instances of objects can be made that store different data in those variables, and that objects, in most languages, come from classes, which are like blueprints for objects that show what variables and what functions objects they should contain. Everyone knows this. So, for example, if you have a Mouse class, you can use it to make objects with data that represents specific mice, and obviously for each mouse you're going to want to store a first and last name. So let's make a Mouse class:

```dart
class Mouse {
    String _first;
    String _last;
}
```

So, objects that are based on this mouse class will all have a variable for a first name and a variable for a last name. Now, we have to add a constructor that will set those variables when an object is created. In Dart, this can be very simple.

```dart
class Mouse {
    String _first;
    String _last;
    Mouse(this._first, this._last);
}
```

This declares a constructor that has two parameters. The first will be automatically stored in the `_first` variable in the object we're creating; the second will automatically be stored in the `_last` variable. Now we can call the constructor in our main function:

```dart
Mouse hatsune = Mouse("hatsune", "squeaku");
```

In Dart, like in most languages that aren't C++, you always call the constructor explicitly like it's a normal function that returns a value, instead of making it part of the variable declaration like in C++. So, this creates a mouse variable. Let's give ourselves the ability to print it out by adding a `toString` member function to it:

```dart
class Mouse {
    String _first;
    String _last;
    Mouse(this._first, this._last);
    String toString() { return _first + "🐭" + _last; }
}
```

Now, in our main, we can print it:

```dart
print(hatsune);
```

So yeah. That's relatively simple. We're going to learn one more interesting Dart feature before we try using it in a Flutter project. This feature is known as named constructors. In most languages, constructors, unlike other functions, do not have names; constructors can be overloaded to accept different argument lists, but you pretty much have to figure out when you should use each constructor overload on your own. In Dart, constructors can have names that explain their purpose, just like normal functions. They look like this:

```dart
class Mouse {
    String _first;
    String _last;
    Mouse(this._first, this._last);
    Mouse.defaultLastName(this._first): last_ = "Mouse";
    String toString() { return _first + "🐭" + _last; }
}
```

So, we're creating a constructor called `defaultLastName` that takes only one argument, which gets automatically stored in `_first`. We're then using an initializer list, which is pretty much the same as in C++ except it actually uses the assignment operator instead of having a weird parentheses situation, to set `_last` to a value that's going to be the same every time this constructor is called. This is how you call a named constructor:

```dart
Mouse mickey = Mouse.defaultLastName("Mickey");
print(mickey);
```

So there you go.

Named parameters and named constructors are two features that I and the author of the Flutter library both thought were useful. Now, Dart is a deep and complex language, and technically this code doesn't follow every possible best practice, which is why there are little blue lines in it in a few places. This DartPad editor is very opinionated about how exactly things should be done. But realistically, this is fine, and you don't have to learn Dart super deeply to use it. So, let's break out of the console and attempt to apply our partial knowledge to something more interactive.

## Flutter
