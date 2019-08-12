class CodageAffine {
    typealias FullLetter = (letter: String, code: Int)
    struct LetterAndCode {
        let letter: FullLetter
        let code: FullLetter
        
        init?(letter: String, encodedWith code: String) {
            guard let letterCode = CodageAffine.letters.firstIndex(of: letter),
                let codeCode = CodageAffine.letters.firstIndex(of: code) else {
                    return nil
            }
            
            self.letter = (letter: letter, code: letterCode)
            self.code = (letter: code, code: codeCode)
        }
    }
    
    static let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var transformed : [String]!
    let a : Int
    let b : Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
        transformed = CodageAffine.letters.map { self.encode($0) }
    }
    
    func encode(_ letter: String) -> String {
        if letter.count > 1 {
            return letter.map { self.encode( String($0) ) }.joined()
        }
        if let position = CodageAffine.letters.firstIndex(of: letter.uppercased()) {
            return CodageAffine.letters[(a * position + b) % CodageAffine.letters.count]
        }
        
        return letter
    }
    
    func decode(_ word: String) -> String {
        return word.map { CodageAffine.letters[transformed.firstIndex(of: String($0))!] }.joined()
    }
    
    static func crackCode(with letterA: LetterAndCode, and letterB: LetterAndCode) -> CodageAffine {
        let a = calculateAFrom(firstLetter: letterA, secondLetter: letterB)
        
        return CodageAffine(a: a, b: 0)
    }
    
    private static func calculateAFrom(firstLetter: LetterAndCode, secondLetter: LetterAndCode) -> Int {
        var multiplicateur = 1
        let up = firstLetter.letter.code > secondLetter.letter.code ? firstLetter : secondLetter
        let down = firstLetter.letter.code <= secondLetter.letter.code ? firstLetter : secondLetter
        let y = up.code.code - down.code.code
        let x = up.letter.code - down.letter.code
        let a = y / x
        if a < 0 {
            multiplicateur = -1
        }
        
        
        
        return getLowerCongruence(for: abs(a), dividedBy: letters.count) * multiplicateur
    }
    
    static func getLowerCongruence(for n: Int, dividedBy m: Int) -> Int {
        let modulo = n % m
        if modulo > m {
            return getLowerCongruence(for: modulo, dividedBy: m)
        }
        
        return m
    }
}

let affineCoder = CodageAffine(a: 7, b: 12)

let answer = affineCoder.encode("AFFINE")
let decoded = affineCoder.decode("CBMNJQISO")

