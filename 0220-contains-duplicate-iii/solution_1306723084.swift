class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
        let size = valueDiff + 1
        let n = nums.count
        var map = [Int: Int]()
        for i in 0..<n {
            let x = nums[i]
            let idx = getIndex(x)
            if i > indexDiff {
                map[getIndex(nums[i-indexDiff-1])] = nil
            }
            if map[idx] != nil {
                return true
            }
            let l = idx-1, r = idx+1
            if let val = map[l], x - val <= valueDiff {
                return true
            }
            if let val = map[r], val - x <= valueDiff {
                return true
            }
            map[idx] = x
        }
        return false

        func getIndex(_ x: Int) -> Int {
            return x >= 0 ? x / size : (x + 1) / size - 1
        }
    }   
}