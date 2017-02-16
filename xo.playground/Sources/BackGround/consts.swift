import Foundation

// размер доски
let board_size = 3

// необходимо собрать
let need_to_collect = 3

// тип состояния у клетки
public enum kindOfMark {
    case X
    case O
    case empty
}
public func getType(_ k : kindOfMark) -> String {
    switch k {
    case .X:
        return "x"
    case .O:
        return "o"
    default:
        return "-"
    }

}

public func print_type(_ k: kindOfMark) {
        print(getType(k), terminator:" ")
}
