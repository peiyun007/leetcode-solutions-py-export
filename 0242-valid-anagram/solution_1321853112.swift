class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var cnt = [Character: Int]()
        for ch in s {
            cnt[ch, default: 0] += 1
        }
        for ch in t {
            cnt[ch, default: 0] -= 1
            if cnt[ch, default: 0] < 0 {
                return false
            } else if cnt[ch, default: 0] == 0 {
                cnt[ch] = nil
            }
        }
        return cnt.count == 0
    }
}