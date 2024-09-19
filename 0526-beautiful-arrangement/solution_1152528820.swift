class Solution {
    func solve(_ nums: inout [Int], _ n: Int, _ ans: inout Int, _ cur_num: Int) {
        if cur_num > n {
            ans += 1
            return
        }
        for i in 1...n {
            if nums[i] == 0 && (i%cur_num == 0 || cur_num%i == 0) {
                nums[i] = cur_num
                solve(&nums, n, &ans, cur_num+1)
                nums[i] = 0
            }
        }
    }

    func countArrangement(_ n: Int) -> Int {
        var nums = Array(repeating: 0, count: n+1)
        var ans = 0
        solve(&nums, n, &ans, 1)
        return ans
    }
}