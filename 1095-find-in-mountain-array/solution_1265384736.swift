/**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface MountainArray {
 *     public func get(_ index: Int) -> Int {}
 *     public func length() -> Int {}
 * }
 */

class Solution {
    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        let n = mountainArr.length()
        var l = 0, r = n
        while l < r {
            let mid = l + (r-l) / 2
            if mid + 1 >= n {
                break
            } else if mountainArr.get(mid) < mountainArr.get(mid+1) {
                l = mid + 1
            } else {
                r = mid
            }
        }
        let peak = l
        print(peak)
        let index = bsearch(mountainArr, target, 0, peak+1, true)
        if index != -1 {
            return index
        }
        return bsearch(mountainArr, target, peak, n, false)
    }

    func bsearch(_ mountainArr: MountainArray, _ t: Int, _ l: Int, _ r: Int, _ flag: Bool) -> Int {
        var target = t
        if (!flag) {
            target *= -1
        }
        var left = l, right = r
        while left < right {
            let mid = left + (right-left) / 2
            let cur = mountainArr.get(mid) * (flag ? 1 : -1)
            if cur == target {
                return mid
            } else if cur < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return -1
    }
}