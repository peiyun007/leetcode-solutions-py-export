class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        let arr = nums.sorted(by: <)
        let n = arr.count
        guard n >= 3 else { return  0 }
        var res = 0
        for i in 0..<n-2 {
            for j in i+1..<n-1 {
                var left = j+1, right = n
                while left < right {
                    let mid = left + (right - left) / 2
                    if arr[i] + arr[j] > arr[mid] {
                        left = mid + 1
                    } else {
                        right = mid
                    }
                }
                res += (left - j - 1)
            }
        }
        return res
    }
}