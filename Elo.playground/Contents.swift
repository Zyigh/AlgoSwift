import Foundation

class Elo {
    enum Result: Double {
        case victory = 1.0
        case defeat = 0.0
        case draw = 0.5
    }
    
    static let eloConst = 400.0
    
    private static func uniformizeDifference(_ difference: Double) -> Double {
        var d: Double = difference
        if difference > 400 {
            d = 400
        } else if difference < -400 {
            d = -400
        }
        
        return d
    }
    
    static func getProbabilityOfWinning(for playerElo: Int, against questElo: Int) -> Double {
        // For possibility of constant improvement even when 5000 facing 1, use uniformizeDiffence(Double(exactly: playerElo - questElo)!) -> Double
        let difference = Double(exactly: playerElo - questElo)!
        let denominator = 1 + pow(10, ((difference / eloConst) * -1.0))
        
        return 1.0 / denominator
    }
    
    static func generateK(for elo: Int) -> Double {
        var k : Double = 10.0
        if elo < 2000 {
            k = 20.0
        } else if elo < 1000 {
            k = 40.0
        }
        
        return k
    }
    
    static func generateNewElo(for playerElo: Int, against questElo: Int, result r: Double) -> Int {
        let k = generateK(for: playerElo)
        let d = getProbabilityOfWinning(for: playerElo, against: questElo)
        let e = Double(exactly: playerElo)!
        let newElo = e + k * (r - d)
        
        return Int(round(newElo))
    }
    
    static func updateElos(of player: Player, against quest: Quest, result: Elo.Result) {
        player.energyElo = generateNewElo(for: player.energyElo, against: quest.energyElo, result: result.rawValue)
        player.wasteElo = generateNewElo(for: player.wasteElo, against: quest.wasteElo, result: result.rawValue)
        player.foodElo = generateNewElo(for: player.foodElo, against: quest.foodElo, result: result.rawValue)
    }
}

class Player {
    var energyElo = 1100
    var wasteElo = 120
    var foodElo = 2200
    
    func printValues() {
        print("Energy => \(energyElo)")
        print("Waste => \(wasteElo)")
        print("Food => \(foodElo)")
        print("\n")
    }
}

class Quest {
    var energyElo = 1500
    var wasteElo = 140
    var foodElo = 10
    
    func printValues() {
        print("Energy => \(energyElo)")
        print("Waste => \(wasteElo)")
        print("Food => \(foodElo)")
        print("\n")
    }
}

let player = Player()
let quest = Quest()

player.printValues()

Elo.updateElos(of: player, against: quest, result: .victory)

player.printValues()

