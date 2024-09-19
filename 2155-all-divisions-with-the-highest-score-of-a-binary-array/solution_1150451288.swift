class Solution {
    func maxScoreIndices(_ nums: [Int]) -> [Int] {
        var zeros = 0
        var ones = nums.reduce(0) { $1 == 1 ? $0 + 1 : $0 }
        var mx = 0
        var res = [Int]()
        for i in 0...nums.count {
            var val = zeros + ones
            if val > mx {
                mx = val
                res.removeAll()
                res.append(i)
            } else if val == mx {
                res.append(i)
            }
            if i != nums.count {
                if nums[i] == 0 {
                    zeros += 1
                } else if nums[i] == 1 {
                    ones -= 1
                }
            }
        }
        return res
    }
}