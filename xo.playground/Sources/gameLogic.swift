import Foundation

public class gameLogic {
    private var players: [player] = [playerXO(kindOfMark.O), playerXO(kindOfMark.X)]
    private var r = randomGeneratorXO()
    private var brd = board()
    private var step: Int = 0
    
    public init() { }
    
    private func makeStep() -> (p1: Int, p2: Int) {
        return players[step % 2].makeStep(brd, r)
    }
    
    // Инициализировать новую игру
    public func startPlaying() {
        brd = board()
        step = 0
    }
    
    // Начать игру
    public func makeTurns()  {
        while  brd.freeSquare.count > 0 {
            let st = makeStep()
            if (players[step % 2].checkResult(brd, st)) {
                print("!!!!!!")
                brd.print_table()
                print("!!!!!!")
                
            }
            step += 1
            brd.print_table()
        }
    }
    
    public func end() {
        
    }
}
