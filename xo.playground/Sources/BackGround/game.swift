import Foundation

// Game

public protocol Game {
    var name: String { get }
    func play()
}

// Delegates

public protocol GameDelegate {
    func gameDidStart(_ game: Game)
    func gameDidEnd(_ game: Game)
}

// Default Implementation

extension GameDelegate {
    public func gameDidStart(_ game: Game) {
        print("Started a new game of \(game.name)")
    }
    
    func gameDidEnd(_ game: Game) {
        print("Ended a game of \(game.name)")
    }
}


// Game

public protocol MultiplayerGame: Game {
    var players: [player] { get }
}

// Delegates

public protocol MultiplayerGameDelegate: GameDelegate {
    func player(_ player: player, didTakeAction action: playerAction)
}

public protocol MultiplayerTurnbasedGameDelegate: MultiplayerGameDelegate {
    func playerDidStartTurn(_ player: player)
    func playerDidEndTurn(_ player: player)
}

// Default Implementation

extension MultiplayerGameDelegate {
    
    public func player(_ player: player, didTakeAction action: playerAction) {
        switch action {
        case .win:
            print("\(player.name) wins!")
        case let .move(x, y, kindOM):
            print("\(player.name) moves to (\(x), \(y)) and past \(getType(kindOM))")
        }
    }
}

extension MultiplayerTurnbasedGameDelegate {
    public func playerDidStartTurn(_ player: player) {}
    public func playerDidEndTurn(_ player: player) {}
}
