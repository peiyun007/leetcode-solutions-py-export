class Solution {
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        let sum = stones.reduce(0) {$0+$1}
        let target = sum/2
        var dp = Array(repeating: false, count: target+1)
        dp[0] = true
        for stone in stones {
            if stone > target {
                continue
            }
            for i in (stone...target).reversed() {
                if dp[i-stone] {
                    dp[i] = true
                }
            }
        }
        var res = target
        while dp[res] == false {
            res -= 1
        }
        return sum - res - res
    }
}