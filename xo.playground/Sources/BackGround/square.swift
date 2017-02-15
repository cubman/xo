import Foundation


public struct square {
    var kind : kindOfMark
    
    public init() {
        kind = kindOfMark.empty
    }
    
    public init(_ k:kindOfMark) {
        kind = k
    }
    
    public mutating func setValue(_ kd: kindOfMark) {
        kind = kd
    }
}
