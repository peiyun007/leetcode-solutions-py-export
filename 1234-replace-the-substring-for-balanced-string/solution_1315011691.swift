class Solution {
    func balancedString(_ s: String) -> Int {
        let arr = Array(s)
        var cnt = [Character: Int]()
        let n = arr.count
        for i in 0..<n {
            cnt[arr[i], default: 0] += 1
        }
        if isValid() {
            return 0
        }
        var j = 0, res = Int.max
        for i in 0..<n {
            let c = arr[i]
            cnt[c, default: 0] -= 1
            while j <= i && isValid() {
                res = min(res, i-j+1)
                cnt[arr[j], default: 0] += 1
                j += 1
            }
        }
        return res

        func isValid() -> Bool {
            for (ch, ct) in cnt {
                if ct > n / 4 {
                    return false
                }
            }
            return true
        }
    }
}