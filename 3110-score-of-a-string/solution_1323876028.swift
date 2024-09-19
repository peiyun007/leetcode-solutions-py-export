class Solution {
    func scoreOfString(_ s: String) -> Int {
        var ans = 0
        let sArr = Array(s)
        for i in 0..<sArr.count-1 {
            ans += abs(getInt(sArr[i+1]) - getInt(sArr[i]))
        }
        return ans
    }

    func getInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }
}