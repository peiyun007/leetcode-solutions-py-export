class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var count = [Int: Int]()
        count[0] = 1
        var ans = 0
        for num in nums {
            sum += num
            ans += ((count[sum-k]) ?? 0)
            var tmp = count[sum] ?? 0
            count[sum] = tmp + 1
        }
        return ans
    }
}