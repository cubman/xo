import Foundation

public protocol player {
    var name: String { get }
    var kind: kindOfMark { get }
    func makeStep(_ b: board,_ rg: RandomNumberGenerator) -> (x: Int, y: Int)
    
   // func checkIsWin(_ b: board, _ p: (_ x: Int, _ y: Int)) -> bool
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
    
    public func makeStep(_ b: board,_ rg: RandomNumberGenerator) -> (x:Int, y:Int) {
        let t = rg.random(maxValue: b.freeSquare.count)
    
        let res = (b.freeSquare[t] / board_size, b.freeSquare[t] % board_size)
        b.br[b.freeSquare[t]].setValue(kind)
        
        b.freeSquare.remove(at: t)
        
        return res
    }
    
    public func checkResult(_ brd: board, _ p : (p1: Int, p2:Int)) -> Bool {

        var cnt: Int = 0
        
        //=================
        // horisontal
        //=================
        for i in p.p1...board_size - 1 {
            if (brd[i, p.p2] == kind) {
                cnt += 1
            }
        }
        
        for i in (p.p1 - 1)...0 {
            if (brd[i, p.p2] == kind) {
                cnt += 1
            }
        }
        
        if (cnt <= need_to_collect) {
            return true
        }
        
        //=================
        // vericle
        //=================
        cnt = 0
        
        for i in p.p2...board_size - 1 {
            if (brd[p.p1, i] == kind) {
                cnt += 1
            }
        }
        
        for i in (p.p2 - 1)...0 {
            if (brd[p.p1, i] == kind) {
                cnt += 1
            }
        }
        
        if (cnt <= need_to_collect) {
            return true
        }
        
        //=================
        // main diagonal
        //=================
        cnt = 0
        var add: Int = 0
        
        for i in max(p.p1, p.p2)...board_size - 1 {
            if (brd[p.p1 + add, p.p2 + add] == kind) {
                cnt += 1
                add += 1
            }
        }
        add = 0
        for i in (min(p.p1, p.p2) - 1)...0 {
            if (brd[p.p1 + add, p.p2 + add] == kind) {
                cnt += 1
            }
        }
        
        if (cnt <= need_to_collect) {
            return true
        }
        
        //=================
        // adverse diagonal ( need to realise)
        //=================
        cnt = 0
        add = 0
        
        for i in max(p.p1, p.p2)...board_size - 1 {
            if (brd[p.p1 + add, p.p2 + add] == kind) {
                cnt += 1
                add += 1
            }
        }
        add = 0
        for i in (min(p.p1, p.p2) - 1)...0 {
            if (brd[p.p1 + add, p.p2 + add] == kind) {
                cnt += 1
            }
        }
        
        if (cnt <= need_to_collect) {
            return true
        }
        
        return false
    }
}
