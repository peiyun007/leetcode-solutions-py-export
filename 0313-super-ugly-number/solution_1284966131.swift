class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var dp = Array(repeating: 0, count: n+1)
        let m = primes.count
        var nums = Array(repeating: 1, count: m)
        var pointers = Array(repeating: 0, count: m)
        for i in 1...n {
            let minNum = nums.min() ?? 0
            dp[i] = minNum
            for j in 0..<m {
                if nums[j] == minNum {
                    pointers[j] += 1
                    nums[j] = dp[pointers[j]] * primes[j]
                }
            }
        }
        return dp[n]
    }
}