import Foundation

public class gameLogic {
    private var playerO = playerXO(kindOfMark.O)
    private var playerX = playerXO(kindOfMark.X)

    private var r = randomGeneratorXO()
    private var brd = board()
    private var step: Int = 0
    
    public init() { }
    
    private func makeStep() {
                var p : player = step % 2 == 0 ? playerX : playerO
        let position = p.makeStep(brd, r)
           }
}
