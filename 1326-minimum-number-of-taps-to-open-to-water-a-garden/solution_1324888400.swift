class Solution {
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        var last = Array(repeating: 0, count: n+1)
        for (i, x) in ranges.enumerated() {
            let left = max(i-x, 0)
            last[left] = max(last[left], i+x)
        }
        var mx = 0, pre = 0, ans = 0
        for i in 0..<n {
            mx = max(mx, last[i])
            if mx == i {
                return -1
            }
            if pre == i {
                pre = mx
                ans += 1
            }
        }
        return ans
    }
}