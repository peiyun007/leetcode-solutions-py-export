class Solution {
    func numSmallerByFrequency(_ queries: [String], _ words: [String]) -> [Int] {
        var cnt = Array(repeating: 0, count: 12)
        for w in words {
            cnt[f(w)] += 1
        }
        for i in (1...10).reversed() {
            cnt[i] += cnt[i+1]
        }
        var ans = [Int]()
        for q in queries {
            let x = f(q)
            ans.append(cnt[x+1])
        }
        return ans
    }

    func f(_ s: String) -> Int {
        var ch: Character = "z"
        var cnt = 0
        for c in s {
            if (c.asciiValue ?? 0) < (ch.asciiValue ?? 0) {
                ch = c
                cnt = 1
            } else if c == ch {
                cnt += 1
            }
        }
        return cnt
    }
}