class Solution {
    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        let n = arr.count
        var j = n - 1
        while j >= 1 && arr[j] >= arr[j-1] {
            j -= 1
        }
        if j == 0 {
            return 0
        }
        var ans = j
        for i in 0..<n {
            while j < n && arr[i] > arr[j] {
                j += 1
            }
            ans = min(ans, j-i-1)
            if i+1 < n && arr[i] > arr[i+1] {
                break
            }
        }
        return ans
    }
}