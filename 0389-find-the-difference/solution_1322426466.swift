class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var cnt = [Character: Int]()
        for ch in s {
            cnt[ch, default: 0] += 1
        }
        for ch in t {
            cnt[ch, default: 0] -= 1
            if cnt[ch, default: 0] < 0 {
                return ch
            }
        }
        return " "
    }
}