
class Solution {
    // 参考：花花酱
    func videoStitching(_ clips: [[Int]], _ time: Int) -> Int {
        let kInf = 101
        var dp = Array(repeating: Array(repeating: kInf, count: kInf + 1), count: kInf + 1)
        for clip in clips {
            let s = clip[0]
            let e = clip[1]
            for l in 1...time {
                for i in 0...time {
                    let j = i + l
                    if j > time {
                        break
                    }
                    if e < i || s > j {
                        continue
                    }
                    if s <= i && e >= j {
                        dp[i][j] = min(dp[i][j], 1)
                    } else if s > i && e >= j {
                        dp[i][j] = min(dp[i][j], dp[i][s] + 1)
                    } else if i >= s && j > e {
                        dp[i][j] = min(dp[i][j], dp[e][j] + 1)
                    } else {
                        dp[i][j] = min(dp[i][j], dp[i][s] + 1 + dp[e][j])
                        //print("A-6>>>\(i),\(j),\(s),\(e),\(dp[i][j]), \(dp[i][s]), \(dp[e][j])")
                    }
                    print("A-7")
                }
            }
        }
        return dp[0][time] == kInf ? -1 : dp[0][time] 
    }
}