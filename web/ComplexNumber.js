class ComplexNumber {
    constructor(real, imag) {
        this.r = real
        this.i = imag
    }

    static fromModAndArg(mod, arg) {
        return new ComplexNumber(mod*Math.cos(arg), mod*Math.sin(arg))
    }

    get conjugate() {
        return new ComplexNumber(this.r, -this.i)
    }

    get mod() {
        return Math.sqrt(Math.pow(this.r, 2) + Math.pow(this.i, 2))
    }

    get arg() {
        return Math.tan(this.i/this.r)
    }

    get negative() {
        return new ComplexNumber(-this.r, -this.i)
    }

    addTo(c) { return ComplexNumber.add(this, c) }
    subtractFromThis(c) { return ComplexNumber.subtract(this, c) }
    subtractFrom(c) { return ComplexNumber.subtract(c, this) }
    multiplyByComplex(c) { return ComplexNumber.multiply(this, c) }
    multiplyByScalar(k) { return ComplexNumber.multiplyByScalar(this, k) }
    divideByComplex(c) { return ComplexNumber.divideByComplex(this, c) }
    divideComplexByThis(c) { return ComplexNumber.divideByComplex(c, this) }
    divideByScalar(k) { return ComplexNumber.divideByScalar(this, k) }

    static add(c1, c2) {
        return new ComplexNumber(c1.real+c2.real, c1.imag+c2.imag)
    }

    static subtract(c1, c2) {
        return ComplexNumber.add(c1, c2.negative)
    }

    static multiply(c1, c2) {
        let a = c1.r
        let b = c1.i
        let c = c2.r
        let d = c2.i
        
        return new ComplexNumber(a*c-b*d, a*d+b*c)
    }

    static multiplyByScalar(c, k) {
        return new ComplexNumber(c.r*k, c.i*k)
    }

    static divideByScalar(c, k) {
        return ComplexNumber.multiplyByScalar(c, 1/k)
    }

    static divide(c1, c2) {
        let a = c1.r
        let b = c1.i
        let c = c2.r
        let d = c2.i
        
        return ComplexNumber.divideByScalar(new ComplexNumber(a*c+b*d, b*c-a*d),(Math.pow(c,2)+Math.pow(d,2)))
    }

    static pow(c, k) {
        let r = c.mod
        let theta = c.arg

        return new ComplexNumber(Math.pow(r, k)*Math.cos(k*theta), Math.pow(r, k)*sin(k*theta))
    }
}

let complex = new ComplexNumber(3,2)
console.log(complex.conjugate)
console.log(complex.mod)
console.log(complex.arg)
console.log(complex.multiplyByScalar(2))

let complex2 = ComplexNumber.fromModAndArg(2, 0.5*Math.PI)
console.log(complex2)

let complexWithRealOnly = new ComplexNumber(5,0)
let complexWithImagOnly = new ComplexNumber(0,3)
let complex3 = ComplexNumber.divide(complex, complexWithRealOnly)
console.log(complex3)

let complex4 = ComplexNumber.divide(complex, complexWithImagOnly)
console.log(complex4)