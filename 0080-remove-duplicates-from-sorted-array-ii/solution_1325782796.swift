class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        if n <= 2 { return n }
        var slow = 2, fast = 2
        while fast < n {
            if nums[fast] != nums[slow-2] {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }
}