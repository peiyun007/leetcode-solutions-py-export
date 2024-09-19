// 参考：花花酱
class Solution {
    // var memo = [Int: Int]()
    // var sum = [Int]()

    // func dfs(_ stones: [Int], _ idx: Int) -> Int {
    //     if idx == stones.count-1 {
    //         return sum[stones.count]
    //     }
    //     if let val = memo[idx] {
    //         return val
    //     }
    //     var ans = Int.min
    //      for j in idx+1..<stones.count {
    //         ans = max(ans, dfs(stones, j))
    //     }
    //     let res = sum[idx+1] - ans
    //     memo[idx] = res
    //     return res
    // }

    func stoneGameVIII(_ stones: [Int]) -> Int {
        var sum = Array(repeating: 0, count: stones.count + 1)
        var dp = Array(repeating: 0, count: stones.count + 1)
        for i in 0..<stones.count {
            sum[i+1] = sum[i] + stones[i]
        }
        var ans = sum[stones.count]
        for i in (1..<stones.count-1).reversed() {
            ans = max(ans, sum[i+1] - ans)
        }
        return ans
    }
}