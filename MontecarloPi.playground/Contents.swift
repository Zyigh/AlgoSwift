func π(limit: Int = 100) -> Double {
    var n : Double = 0.0
    var m : Double = 0.0
    
    for _ in 1...limit {
        let a = Double.random(in: 0...1)
        let b = Double.random(in: 0...1)
        (a*a) + (b*b) < 1 ? (n = n + 1) : (m = m + 1)
    }
    
    return 4 * n / n + m
}

var r = Int.random(in: 0...10000)
print("\(r) iterations")
print("π is approximately \(π(limit: r)) !")
r = Int.random(in: 0...10000)
print("\(r) iterations")
print("π is approximately \(π(limit: r)) !")
print("\(r) iterations")
print("π is approximately \(π(limit: r)) !")
r = Int.random(in: 0...10000)
print("\(r) iterations")
print("π is approximately \(π(limit: r)) !")
print("\(r) iterations")
print("π is approximately \(π(limit: r)) !")
r = Int.random(in: 0...10000)
print("\(r) iterations")
print("π is approximately \(π(limit: r)) !")

