import Foundation

// размер доски
let board_size = 5

// необходимо собрать
let need_to_collect = 3

// тип состояния у клетки
public enum kindOfMark {
    case X
    case O
    case empty
}

public func print_type(_ k: kindOfMark) {
    switch k {
    case .X:
        print("x", terminator:" ")
    case .O:
        print("o", terminator:" ")
    default:
        print("-", terminator:" ")
}
}
