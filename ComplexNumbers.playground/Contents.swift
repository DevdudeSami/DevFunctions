//: Playground - noun: a place where people can play

import Foundation

struct ComplexNumber {
  var real: Double
  var imag: Double
  
  var conjugate: ComplexNumber {
    return ComplexNumber(r: self.real, i: -self.imag)
  }
  
  var mod: Double {
    return sqrt(pow(real,2)+pow(imag,2))
  }
  
  var arg: Double {
    return atan2(imag, real)
  }
  
  init(r: Double, i: Double) {
    self.real = r
    self.imag = i
  }
  
  init(mod: Double, arg: Double) {
    self.init(r: mod*cos(arg), i: mod*sin(arg))
  }
  
  init(fromDouble double: Double) {
    self.init(r: double, i: 0)
  }
  
  init(fromFloat float: Float) {
    self.init(r: Double(float), i: 0)
  }
  
  init(fromInt int: Float) {
    self.init(r: Double(int), i: 0)
  }
  
  func display() -> String {
    if self.real == 0 { return "\(self.imag)i" }
    else if self.imag == 0 { return "\(self.real)" }
    
    return "\(self.real) " + (self.imag < 0 ? "-" : "+") + " \(abs(self.imag))i"
  }
  
  
  static func +(left: ComplexNumber, right: ComplexNumber) -> ComplexNumber {
    return ComplexNumber(r: left.real+right.real, i: left.imag+right.imag)
  }
  
  static func -(left: ComplexNumber, right: ComplexNumber) -> ComplexNumber {
    return left + right*(-1.0)
  }
  
  static prefix func -(complex: ComplexNumber) -> ComplexNumber {
    return complex * (-1.0)
  }
  
  static func *(left: ComplexNumber, right: ComplexNumber) -> ComplexNumber {
    let a = left.real
    let b = left.imag
    let c = right.real
    let d = right.imag
    
    return ComplexNumber(r: a*c-b*d, i: a*d+b*c)
  }
  
  // Multiply by Double
  static func *(left: ComplexNumber, right: Double) -> ComplexNumber {
    return ComplexNumber(r: left.real*right, i: left.imag*right)
  }
  // Divide by Double
  static func /(left: ComplexNumber, right: Double) -> ComplexNumber {
    return left*(1/right)
  }
  
  static func /(left: ComplexNumber, right: ComplexNumber) -> ComplexNumber {
    let a = left.real
    let b = left.imag
    let c = right.real
    let d = right.imag
    
    return ComplexNumber(r: a*c+b*d, i: b*c-a*d)/(pow(c,2)+pow(d,2))
  }
  
  // Uses De Moivre's Theorem to calculate powers
  static func ^(left: ComplexNumber, right: Double) -> ComplexNumber {
    let r = left.mod
    let theta = left.arg
    
    return ComplexNumber(r: pow(r, right)*cos(right*theta), i: pow(r, right)*sin(right*theta))
  }

}

extension Double {
  func roundTo(precision: Int) -> Double {
    let divisor = pow(10.0, Double(precision))
    return (self * divisor).rounded() / divisor
  }
}

let z = ComplexNumber(r: 1, i: 1) + ComplexNumber(r: 2, i: -7)
z.display()
z.arg
z.mod

var z2 = ComplexNumber(mod: 6, arg: .pi)
z2.display()
z2.imag = z2.imag.roundTo(precision: 4)
z2.display()
z2.arg
z2.mod
