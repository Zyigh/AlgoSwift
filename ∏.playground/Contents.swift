func calculate(_ n: Double, limit: Double) -> Double {
    let m = n < limit ? calculate(n + 1, limit: limit) : (n * n)
    
    return ((n * 2) - 1) + ((n * n) / m)
}

func π(precision: Double = 22.0) -> Double {
    return 4.0 / calculate(1.0, limit: precision)
}

var p : Double = 8.0
print("Precision \(p) :")
print("\(π(precision: p))\n")
p = 42.0
print("Precision \(p) :")
print("\(π(precision: p))\n")

// Check for lowest precision value that gives the most accurate pi value
print("Lowest acceptable precision value :")
for i in 0...Int.max {
    if let j = Double(exactly: i),
        3.141592653589793 == π(precision: j) {
        print("\(i)\n")
        break
    }
}

print("Precision auto (= 22.0)")
print("\(π())\n")
