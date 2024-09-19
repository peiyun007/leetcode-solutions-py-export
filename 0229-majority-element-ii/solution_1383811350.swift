class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var cnt = [Int: Int]()
        var ans = [Int]()
        for num in nums {
            cnt[num, default: 0] += 1
        }
        for (num, c) in cnt {
            if c > n / 3 {
                ans.append(num)
            }
        }
        return ans
    }
}