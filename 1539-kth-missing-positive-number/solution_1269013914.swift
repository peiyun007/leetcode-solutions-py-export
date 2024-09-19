class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        if arr[0] > k {
            return k
        }
        var l = 0, r = arr.count
        while l < r {
            let mid = l + (r-l) / 2
            let x = arr[mid]
            if (x - mid - 1) >= k {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return k - (arr[l-1] - (l-1) - 1) + arr[l-1]
    }
}