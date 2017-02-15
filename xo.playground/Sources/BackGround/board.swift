import Foundation

public class board {
    // доска
    var br: [square]
    
    // свободный клетки
    public var freeSquare: [Int]
    
    // инициализация
    public init() {
        br = [square](repeating: square(), count: board_size * board_size)
        freeSquare = [Int]()
        
        for i in 0...(board_size * board_size - 1) {
            self.freeSquare.append(i)
        }
    }
    
    public subscript(_ x: Int, _ y: Int) -> kindOfMark {
        get{ return br[x * board_size + y].kind }
        set{ br[x * board_size + y].setValue(newValue) }
    }
    
    // распечатать клетки
    public func print_table() {
        for i in 0...board_size-1 {
            for j in 0...board_size-1 {
                print_type(self[i, j])
            }
            print("")
        }
        print("=========\n")
    }
}
