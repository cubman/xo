import Foundation


public protocol RandomNumberGenerator {
    func random(maxValue:Int) -> Int
}

public class randomGeneratorXO: RandomNumberGenerator {
    public init() { }
    
    public func random(maxValue: Int) -> Int {
        return Int(arc4random()) % maxValue
    }
}
