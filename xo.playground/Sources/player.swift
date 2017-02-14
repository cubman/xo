import Foundation

public protocol player {
    var name: String { get }
    var score: Int { get set }
}

public enum playerAction {
    case win
    case move(square: square)
}
