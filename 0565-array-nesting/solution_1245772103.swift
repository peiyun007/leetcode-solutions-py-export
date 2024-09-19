class Solution {
    func arrayNesting(_ nums: [Int]) -> Int {
        var visited = Array(repeating: false, count: nums.count)
        var res = 0
        for i in 0..<nums.count {
            var cnt = 0
            var x = i
            while !visited[x] {
                visited[x] = true
                x = nums[x]
                cnt += 1
            }
            res = max(res, cnt)
        }
        return res
    }
}