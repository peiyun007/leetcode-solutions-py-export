class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var left = newInterval[0], right = newInterval[1]
        var placed = false
        for x in intervals {
            if x[0] > right {
                if !placed {
                    res.append([left, right])
                    placed = true
                }
                res.append(x)
            } else if x[1] < left {
                res.append(x)
            } else {
                left = min(left, x[0])
                right = max(right, x[1])
            }
        }
        if !placed {
            res.append([left, right])
        }
        return res
    }
}