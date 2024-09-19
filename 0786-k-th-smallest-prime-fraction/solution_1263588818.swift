class Solution {
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        var left = 0.0, right = 1.0
        let n = arr.count
        while left < right {
            let mid = left + (right - left) / 2
            var count = 0
            var x = -1, y = 0
            var i = 0
            for j in 1..<n {
                while Double(arr[i]) / Double(arr[j]) < mid {
                    if arr[i] * y > arr[j] * x {
                        x = arr[i]
                        y = arr[j]
                    }
                    i += 1
                }
                count += i
            }
            if count == k {
                return [x, y]
            } else if count < k {
                left = mid
            } else if count > k {
                right = mid
            }
        }
        return []
    }
}