import Foundation

public protocol player {
    var kind: kindOfMark { get }
    func makeStep(_ b: board,_ rg: RandomNumberGenerator) -> (x: Int, y: Int)
    
   // func checkIsWin(_ b: board, _ p: (_ x: Int, _ y: Int)) -> bool
}

public enum playerAction {
    case win
    case move(x: Int, y: Int, type: kindOfMark)
}

public class playerXO: player {
    public let kind: kindOfMark
    
    public init(_ kd: kindOfMark) {
        self.kind = kd
    }
    
    public func makeStep(_ b: board,_ rg: RandomNumberGenerator) -> (x:Int, y:Int) {
        let t = rg.random(maxValue: b.freeSquare.count)
    
        let res = (b.freeSquare[t] / board_size, b.freeSquare[t] % board_size)
        b.br[b.freeSquare[t]].setValue(kind)
        
        b.freeSquare.remove(at: t)
        
        return res
    }
}
