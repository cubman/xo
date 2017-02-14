import Foundation

public class board {
     var br: [square] // доска

    // инициализация
    public init() {
        br = [square](repeating: square(), count: board_size * board_size)
    }
    
    // получить клетку по индексу x, y
    public func getSquareByInd(_ x: Int, _ y: Int) -> square {
        return br[x * board_size + y]
    }
    
    // распечатать клетки
    public func print_table() {
        for i in 0...board_size-1 {
            for j in 0...board_size-1 {
                self.getSquareByInd(i, j).print_type()
            }
            
            print("\n")
        }
    }
}
