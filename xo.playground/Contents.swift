//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var sq = square(kindOfMark.X)

var t = board()

//t[1,1] = kindOfMark.X

t.print_table()

var p1 = playerXO(kindOfMark.X)
var p2 = playerXO(kindOfMark.O)
var r = randomGeneratorXO()

t.freeSquare
p1.makeStep(t, r)
p2.makeStep(t, r)
p1.makeStep(t, r)
p2.makeStep(t, r)
t.freeSquare
p1.makeStep(t, r)
p2.makeStep(t, r)


t.freeSquare
t.print_table()
//var w : randomGeneratorXO()



