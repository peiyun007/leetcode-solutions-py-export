class Solution {
    func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        return atmostK(nums, k) - atmostK(nums, k-1)
    }

    func atmostK(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var cnt = [Int: Int]()
        var ans = 0, left = 0, count = 0
        for right in 0..<n {
            if cnt[nums[right], default: 0] == 0 {
                count += 1
            }
            cnt[nums[right], default: 0] += 1
            while count > k {
                cnt[nums[left], default: 0] -= 1
                if cnt[nums[left], default: 0] == 0 {
                    count -= 1
                }
                left += 1
            }
            ans += (right-left+2)
        }
        return ans
    }
}