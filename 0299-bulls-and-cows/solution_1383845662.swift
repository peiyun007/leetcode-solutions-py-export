class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        let sArr = Array(secret)
        let gArr = Array(guess)
        var sCnt = [Int: Int]()
        var gCnt = [Int: Int]()
        var bulls = 0
        for (s, g) in zip(sArr, gArr) {
            if s == g {
                bulls += 1
            } else {
                sCnt[getInt(s), default: 0] += 1
                gCnt[getInt(g), default: 0] += 1
            }
        }
        var cows = 0
        for i in 0...9 {
            cows += min(sCnt[i, default: 0], gCnt[i, default: 0])
        }
        return "\(bulls)A\(cows)B"
    }

    func getInt(_ ch: Character) -> Int {
        return Int(String(ch)) ?? 0
    }
}