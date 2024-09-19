class Solution {
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        guard A.count >= 3 else {
            return 0
        }
        var low = 0
        var high = A.count - 1
        while low < high {
            let middle = low + (high - low) / 2
            if A[middle] < A[middle + 1]  {
                low = middle + 1
            } else {
                high = middle
            }
        }
        return low
    }
}