import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DArchetype {
  // Orthogonal persistance
  // var currentValue = 2345897654326897;
  // persistance variable
  stable var currentValue : Float = 2345897654326897;
  
  // Create a constants called startTime. Debug print the current time inn nanoseconds into the console.
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));
  
  currentValue += 1;
  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  
  // 2024-04-09 09:38:23.058577526 UTC:  2_345_897_654_326_901
  // 2024-04-09 09:50:49.226290432 UTC:  2_345_897_654_326_907

  // Allow users ti withdrawl an amount from the currentValue
  // Decrease the currentValue by the amount

  public func withdrawl(amount : Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("amount too large, current value less then zero.")
    }
  };

  // 2024-04-09 10:01:39.504320269 UTC:  2_345_897_654_326_893

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
}