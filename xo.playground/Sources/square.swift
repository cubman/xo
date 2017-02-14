import Foundation


public class square {
    var kind : kindOfMark
    
    public init() {
        kind = kindOfMark.empty
    }
    
    public init(_ k:kindOfMark) {
        kind = k
    }
    
    public func print_type() {
        switch kind {
        case .X:
            print("x")
        case .O:
            print("o")
        default:
            print("_")
        }
        
    }
}
