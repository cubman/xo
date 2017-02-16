import Foundation


public struct square {
    public var kind : kindOfMark
    
    public init() {
        kind = kindOfMark.empty
    }
    
    public init(_ k:kindOfMark) {
        kind = k
    }
    
    public mutating func setValue (_ k:kindOfMark) {
        kind = k
    }
}
