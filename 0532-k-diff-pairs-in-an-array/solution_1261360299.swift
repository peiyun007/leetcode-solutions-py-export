class Solution {

    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        let arr = nums.sorted(by: <)
        let n = arr.count
        for i in 0..<n-1 {
            if i > 0 && arr[i] == arr[i-1] {
                continue
            }
            let target = arr[i] + k
            var left = i + 1
            var right = n
            while left < right {
                let mid = left + (right - left) / 2
                if arr[mid] < target {
                    left = mid + 1
                } else if arr[mid] > target {
                    right = mid
                } else if arr[mid] == target {
                    res += 1
                    break
                }
            }
        }
        return res
    }
}