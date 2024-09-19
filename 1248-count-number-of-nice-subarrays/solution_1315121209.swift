class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var left = 0, res = 0, oddCnt = 0, right = 0
        let n = nums.count
        while right < n {
            if nums[right] % 2 == 1 {
                oddCnt += 1
            }
            right += 1
            if oddCnt == k {
                let tmp = right
                while right < n && nums[right] % 2 == 0 {
                    right += 1
                }
                let rightEvenCnt = right - tmp

                var leftEvenCnt = 0
                while left <= right && nums[left] % 2 == 0 {
                    leftEvenCnt += 1
                    left += 1
                }
                res += (leftEvenCnt + 1) * (rightEvenCnt + 1)

                left += 1
                oddCnt -= 1
            }
        }
        return res
    }
}