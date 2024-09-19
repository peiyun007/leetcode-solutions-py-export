class Solution {
    // 参考https://zhuanlan.zhihu.com/p/79553968。写的很好
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var l = 0
        var r = nums.count
        var res_l = -1
        // 寻找左侧边界
        while l < r {
            let mid = l + (r - l) / 2
            if nums[mid] == target {
                r = mid
            } else if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        if l == nums.count {
            res_l = -1
        } else {
            res_l = nums[l] == target ? l : -1
        }
        // 寻找右侧边界
        var low = 0
        var high = nums.count
        var res_r = -1
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] == target {
                low = mid + 1
            } else if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        if low == 0 {
            res_r = -1
        } else {
            res_r = nums[low-1] == target ? (low-1) : -1
        }
        return [res_l, res_r]
    }
}