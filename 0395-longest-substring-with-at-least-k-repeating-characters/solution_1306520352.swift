class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        var ans = 0
        var sArr = Array(s)
        for p in 1...26 {
            var j = 0, tot = 0, sum = 0
            var cnt = [Character: Int]()
            for i in 0..<sArr.count {
                let ch = sArr[i]
                cnt[ch, default: 0] += 1
                let cnt0 = cnt[ch, default: 0]
                if cnt0 == 1 { tot += 1 }
                if cnt0 == k { sum += 1 }
                while tot > p {
                    let chj = sArr[j]
                    cnt[chj, default: 0] -= 1
                    let cntj = cnt[chj, default: 0]
                    if cntj == 0 { tot -= 1 }
                    if cntj == k-1 { sum -= 1 }
                    j += 1
                }
                if tot == sum {
                    ans = max(ans, i-j+1)
                }
            }
        }
        return ans
    }
}