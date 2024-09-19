class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let sum = nums.reduce(0) { $0+$1 }
        let t = sum - x
        let n = nums.count
        var ans = Int.max
        var vis = [Int: Int]()
        vis[0] = -1
        var s = 0
        for (i, v) in nums.enumerated() {
            s += v
            if vis[s] == nil {
                vis[s] = i
            }
            if let j = vis[s-t] {
                ans = min(ans, j+1+(n-(i+1)))
            }
        }
        return ans == Int.max ? -1 : ans
    }
}