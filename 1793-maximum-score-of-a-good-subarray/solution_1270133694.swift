class Solution {
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var ans = 0
        var left = k-1, right = k+1
        for i in (1...nums[k]).reversed() {
            while left >= 0 && nums[left] >= i {
                left -= 1
            }
            while right < n && nums[right] >= i {
                right += 1
            }
            ans = max(ans, (right-left-1)*i)
            if left == -1 && right == n {
                break
            }
        }
        return ans
    }
}