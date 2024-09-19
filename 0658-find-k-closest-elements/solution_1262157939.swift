class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var l = 0, r = arr.count
        while l < r {
            let mid = l + (r - l) / 2
            if arr[mid] < x {
                l = mid + 1
            } else if arr[mid] > x {
                r = mid
            } else {
                r = mid
            }
        }
        var right = l, left = l - 1
        for i in 0..<k {
            if left < 0 {
                right += 1
            } else if right >= arr.count {
                left -= 1
            } else if x - arr[left] <= arr[right] - x {
                left -= 1
            } else {
                right += 1
            }
        }
        return Array(arr[left+1...right-1])
    }
}