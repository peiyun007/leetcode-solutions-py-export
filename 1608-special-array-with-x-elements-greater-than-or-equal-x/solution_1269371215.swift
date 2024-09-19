class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        let numsSorted = nums.sorted(by: >)
        let n = numsSorted.count
        for i in 1...n {
            if numsSorted[i-1] >= i && (i == n || numsSorted[i] < i) {
                return i
            }
        }
        return -1
    }
}