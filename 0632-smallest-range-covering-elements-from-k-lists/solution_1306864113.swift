class Solution {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        var ans = [Int]()
        let n = nums.count
        var tuples = [(Int, Int)]()
        for i in 0..<n {
            let arr = nums[i]
            for j in 0..<arr.count {
                tuples.append((nums[i][j], i))
            }
        }
        tuples.sort {
            if $0.0 == $1.0 {
                return $0.1 < $1.1
            } else {
                return $0.0 < $1.0
            }
        }
        var j = 0
        var cnt = [Int: Int]()
        var k = 0
        for i in 0..<tuples.count {
            let tuple = tuples[i]
            cnt[tuple.1, default: 0] += 1
            if cnt[tuple.1, default: 0] == 1 { k += 1 }
            if k == n {
                while cnt[tuples[j].1, default: 0] > 1 {
                    cnt[tuples[j].1, default: 0] -= 1
                    j += 1
                }
                if ans.isEmpty || tuples[i].0 - tuples[j].0 < ans[1] - ans[0] {
                    ans = [tuples[j].0, tuples[i].0]
                }
            }
        }
        return ans
    }
}