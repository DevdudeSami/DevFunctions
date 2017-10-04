import Foundation

/// An implementation of a complex number. It uses Double for storing real and imaginary parts.
struct ComplexNumber {
  /// Gets or sets the real part of the complex number.
  var real: Double
  /// Gets or sets the imaginary part of the complex number.
  var imag: Double
  
  /// Gets the conjugate to this complex number.
  var conjugate: ComplexNumber {
    return ComplexNumber(r: self.real, i: -self.imag)
  }
  
  /// Gets the modulus of this complex number.
  var mod: Double {
    return sqrt(pow(real,2)+pow(imag,2))
  }
  
  /// Gets the argument of this complex number.
  var arg: Double {
    return atan2(imag, real)
  }
  
  /// Initialises the complex number with the given values for the real and imaginary parts.
  init(r: Double, i: Double) {
    self.real = r
    self.imag = i
  }
  
  /// Initialises a complex number that has the given modulus and argument. Stores it as a real/imaginary pair.
  init(mod: Double, arg: Double) {
    self.init(r: mod*cos(arg), i: mod*sin(arg))
  }
  
  /// Initialises a complex number from a Double as the real part and no imaginary part. Use this to cast from Double.
  init(fromDouble double: Double) {
    self.init(r: double, i: 0)
  }
  
  /// Initialises a complex number from a Float as the real part and no imaginary part. Use this to cast from Float.
  init(fromFloat float: Float) {
    self.init(r: Double(float), i: 0)
  }
  
  /// Initialises a complex number from a Int as the real part and no imaginary part. Use this to cast from Int.
  init(fromInt int: Float) {
    self.init(r: Double(int), i: 0)
  }
  
  /// Returns a string representation of the complex number.
  func display() -> String {
    if self.real == 0 { return "\(self.imag)i" }
    else if self.imag == 0 { return "\(self.real)" }
    
    return "\(self.real) " + (self.imag < 0 ? "-" : "+") + " \(abs(self.imag))i"
  }
  
  /// Gives the result of the addition of two complex numbers.
  static func +(left: ComplexNumber, right: ComplexNumber) -> ComplexNumber {
    return ComplexNumber(r: left.real+right.real, i: left.imag+right.imag)
  }

  /// Gives the result of the subtraction of the second complex numbers from the first.
  static func -(left: ComplexNumber, right: ComplexNumber) -> ComplexNumber {
    return left + right*(-1.0)
  }
  
  /// Gives the result of negating a complex number.
  static prefix func -(complex: ComplexNumber) -> ComplexNumber {
    return complex * (-1.0)
  }
  
  /// Gives the result of the multiplication of two complex numbers.
  static func *(left: ComplexNumber, right: ComplexNumber) -> ComplexNumber {
    let a = left.real
    let b = left.imag
    let c = right.real
    let d = right.imag
    
    return ComplexNumber(r: a*c-b*d, i: a*d+b*c)
  }

  /// Gives the result of the division of the first complex number by the second.
  static func /(left: ComplexNumber, right: ComplexNumber) -> ComplexNumber {
    let a = left.real
    let b = left.imag
    let c = right.real
    let d = right.imag
    
    return ComplexNumber(r: a*c+b*d, i: b*c-a*d)/(pow(c,2)+pow(d,2))
  }
  
  /// Gives the result of multiplying a complex number and a Double.
  static func *(left: ComplexNumber, right: Double) -> ComplexNumber {
    return ComplexNumber(r: left.real*right, i: left.imag*right)
  }
  /// Gives the result of dividing a complex number by a Double.
  static func /(left: ComplexNumber, right: Double) -> ComplexNumber {
    return left*(1/right)
  }
  
  /// Uses De Moivre's Theorem to calculate the result of the exponentiation of the complex number to the real.
  static func ^(left: ComplexNumber, right: Double) -> ComplexNumber {
    let r = left.mod
    let theta = left.arg
    
    return ComplexNumber(r: pow(r, right)*cos(right*theta), i: pow(r, right)*sin(right*theta))
  }

}

extension Double {
  /// Rounds a double to the specified number of decimal points (precision).
  func roundTo(precision: Int) -> Double {
    let divisor = pow(10.0, Double(precision))
    return (self * divisor).rounded() / divisor
  }
}
