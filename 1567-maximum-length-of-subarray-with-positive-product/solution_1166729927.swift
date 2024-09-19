class Solution {
    func getMaxLen(_ nums: [Int]) -> Int {
        var ans = 0
        var positive = 0, negative = 0
        for num in nums {
            if num == 0 {
                positive = 0
                negative = 0
            } else if num > 0 {
                positive += 1
                negative = negative == 0 ? 0 : 1+negative
            } else {
                let temp = positive
                positive = negative == 0 ? 0 : negative + 1
                negative = temp + 1
            }
            ans = max(ans, positive)
        }
        return ans
    }
}