let hexaRefs = [
    "10": "A",
    "11": "B",
    "12": "C",
    "13": "D",
    "14": "E",
    "15": "F"
]

extension Int {
    func convertToBase(_ base: Int, _ acc: [Int] = [Int]()) -> String {
        let newAcc = [self % base] + acc
        if newAcc.first! == self {
            return newAcc.map{
                    String($0)
                }.map{ n in
                    if let m = hexaRefs[n] {
                        return m
                    } else {
                        return n
                    }
                }.joined(separator: "")
        } else {
            return (abs(self / base)).convertToBase(base, newAcc)
        }
    }
}

75.convertToBase(2)
2014.convertToBase(16)
98765432112345678.convertToBase(2)
98765432112345678.convertToBase(16)
(Int.max - 1).convertToBase(2)
