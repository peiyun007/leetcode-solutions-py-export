class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var ans = [[Int]]()
        for mask in 0..<(1 << n) {
            var temp = [Int]()
            for i in 0..<n {
                if (mask >> i) & 1 != 0 {
                    temp.append(nums[i])
                }
            }
            ans.append(temp)
        }
        return ans
    }
}