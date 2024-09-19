class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        var low = 0, high = n
        while low < high {
            let mid = low + (high - low) / 2
            if citations[mid] >= n - mid {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return n - low
    }
}