class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap: [Int: Int] = [:]
        var result: [Int] = []
        for i in 0..<nums.count {
            let numsToFound = target - nums[i]
            if let numsToFoundIndex = hashMap[numsToFound] {
                result.append(numsToFoundIndex)
                result.append(i)
                return result
            } else {
                hashMap[nums[i]] = i
            }
        }
        return result
    }
}