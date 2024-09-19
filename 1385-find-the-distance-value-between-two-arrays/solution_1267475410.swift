class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        let nums = arr2.sorted(by: <)
        var ans = 0
        for x in arr1 {
            var ok = true
            let index = bsearch(nums, x)
            if abs(nums[index] - x) <= d {
                ok = false
            }
            if index - 1 >= 0 && abs(nums[index-1] - x) <= d {
                ok = false
            }
            if ok {
                ans += 1
            }
        }
        return ans
    }
    
    func bsearch(_ arr: [Int], _ target: Int) -> Int {
        var l = 0, r = arr.count
        while l < r {
            let mid = l + (r-l) / 2
            if arr[mid] >= target {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return min(l, arr.count-1)
    }
}