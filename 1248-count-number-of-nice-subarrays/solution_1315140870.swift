class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        let n = nums.count
        var preSumCnt = [Int: Int]()
        preSumCnt[0] = 1
        var sum = 0
        for x in nums {
            if x % 2 == 1 {
                sum += 1
            }
            preSumCnt[sum, default: 0] += 1
            if sum >= k {
                res += preSumCnt[sum-k, default: 0]
            }
        }

        return res
    }
}