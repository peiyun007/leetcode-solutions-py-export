class Solution {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        var arr = [(score: Int, age: Int)]()
        for i in 0..<scores.count {
            arr.append((scores[i], ages[i]))
        }
        arr.sort {
            if $0.score == $1.score {
                return $0.age < $1.age
            } else {
                return $0.score < $1.score
            }
        }
        var dp = Array(repeating: 0, count: arr.count)
        var res = 0
        for i in 0..<arr.count {
            dp[i] = arr[i].score
            for j in 0..<i {
                if arr[j].age == arr[i].age {
                    dp[i] = max(dp[i], dp[j] + arr[i].score)
                } else if arr[j].age < arr[i].age {
                    dp[i] = max(dp[i], dp[j] + arr[i].score)
                }
            }
            res = max(res, dp[i])
        }
        return res
    }
}