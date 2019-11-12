// It must definitely be faster if it's compiled

func A(m: UInt, n: UInt) -> UInt {
    if m == 0 {
        return n + 1
    }
    if n == 0 {
        return A(m: m - 1, n: 1)
    }
    
    return A(m: m - 1, n: A(m: m, n: n - 1))
}

print(A(m: 3, n: 4))

// @Important : Do not uncomment next line
// print(A(m: 7, n: 7))
