import Foundation

public protocol player {
    var name: String { get }
    var kind: kindOfMark { get }
    func makeStep(_ b: board,_ rg: RandomNumberGenerator) -> (p1: Int, p2: Int)
    func checkResult(_ brd: board, _ p : (p1: Int, p2:Int)) -> Bool
}

public enum playerAction {
    case win
    case move(x: Int, y: Int, type: kindOfMark)
}

public class playerXO: player {
    public var name: String
    public let kind: kindOfMark
    
    public init(_ kd: kindOfMark) {
        self.kind = kd
        self.name = kd == kindOfMark.X ? "x" : kd == kindOfMark.O ? "o" : "-"
    }
    
    public func makeStep(_ b: board,_ rg: RandomNumberGenerator) -> (p1:Int, p2:Int) {
        let t = rg.random(maxValue: b.freeSquare.count)
    
        let res = (b.freeSquare[t] / board_size, b.freeSquare[t] % board_size)
        b.br[b.freeSquare[t]].setValue(kind)
        
        b.freeSquare.remove(at: t)
        
        return res
    }
    
    public func checkResult(_ brd: board, _ p : (p1: Int, p2:Int)) -> Bool {

        var cnt: Int = 0
        var k: Int = 0
        var add: Int = 0

        //=================
        // horisontal
        //=================
        k = p.p1
        while  k < board_size && brd[k, p.p2] == kind {
            cnt += 1
            k += 1
        }
        
        k = p.p1 - 1
        while k >= 0 && brd[k, p.p2] == kind {
            cnt += 1
            k -= 1
        }
        
        if (cnt >= need_to_collect) {
            return true
        }
        
       
        //=================
        // vericle
        //=================
        cnt = 0
        
        k = p.p2
        while k < board_size && brd[p.p1, k] == kind {
            cnt += 1
            k += 1
        }
        
        k = p.p2 - 1
        while k >= 0 && brd[p.p1, k] == kind {
            cnt += 1
            k -= 1
        }
        
        if (cnt >= need_to_collect) {
            return true
        }
        
        //=================
        // main diagonal
        //=================
        cnt = 0
        k = max(p.p1, p.p2)
        while k < board_size && brd[p.p1 + add, p.p2 + add] == kind {
            cnt += 1
            add += 1
            k += 1
        }
        
        add = 1
        k = min(p.p1, p.p2) - 1
        
        while k >= 0 && brd[p.p1 - add, p.p2 - add] == kind {
            cnt += 1
            add += 1
            k -= 1
        }
        
        if (cnt >= need_to_collect) {
            return true
        }
        
        //=================
        // adverse diagonal
        //=================
        cnt = 0
        add = 0
        k = max(p.p1, p.p2)
        while k < board_size && brd[p.p1 + add, p.p2 - add] == kind {
            cnt += 1
            add += 1
            k += 1
        }
        
        add = 1
        k = min(p.p1, p.p2) - 1
        while k >= 0 && brd[p.p1 - add, p.p2 + add] == kind {
            cnt += 1
            add += 1
            k -= 1
        }
        
        if (cnt >= need_to_collect) {
            return true
        }
        
        return false
    }
}
