class Solution {
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        var last = Array(repeating: 0, count: n+1)
        for (i, x) in ranges.enumerated() {
            let left = max(i-x, 0)
            last[left] = max(last[left], i+x)
        }
        var cur_right = 0, next_right = 0, ans = 0
        for i in 0..<n {
            next_right = max(next_right, last[i])
            if cur_right == i {
                if next_right == i {
                    return -1
                }
                ans += 1
                cur_right = next_right
            }
        }
        return ans
    }
}