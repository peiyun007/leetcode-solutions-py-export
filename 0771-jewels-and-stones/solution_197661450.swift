class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var map: [Character: Int] = [:]
        for str in J {
            map[str] = 0
        }
        var res = 0
        for str in S {
            if map[str] != nil {
                res += 1
            }
        }
        return res
    }
}