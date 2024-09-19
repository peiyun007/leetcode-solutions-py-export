class Solution {
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        var res = 0
        var maxEndRight = values[values.count-1] - (values.count-1)
        for i in (0..<values.count-1).reversed() {
            res = max(res, maxEndRight+values[i]+i)
            maxEndRight = max(maxEndRight, values[i]-i)
        }
        return res
    }
}