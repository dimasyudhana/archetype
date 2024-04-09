import Debug "mo:base/Debug"
actor DArchetype {
  var currentValue = 2345897654326897;
  currentValue += 1;
  Debug.print(debug_show(currentValue));
}