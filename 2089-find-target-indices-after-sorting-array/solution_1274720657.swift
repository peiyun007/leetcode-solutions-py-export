class Solution {
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        var cnt1 = 0, cnt2 = 0
        for x in nums {
            if x < target {
                cnt1 += 1
            } else if x == target {
                cnt2 += 1
            }
        }
        var res = [Int]()
        for i in cnt1..<(cnt1+cnt2) {
            res.append(i)
        }
        return res
    }
}