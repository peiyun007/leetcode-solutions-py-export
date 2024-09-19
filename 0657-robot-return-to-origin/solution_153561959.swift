class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var x = 0, y = 0
        for mv in moves {
            switch(mv) {
                case "L": x-=1
                case "R": x+=1
                case "U": y+=1
                case "D": y-=1
                default: break
            }
        }
        return x == 0 && y == 0
    }
}