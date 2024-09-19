class Solution {
    func readBinaryWatch(_ num: Int) -> [String] {
        let nums1 = [8, 4, 2, 1]
        let nums2 = [32, 16, 8, 4, 2, 1]
        var result = [String]()
        
        for i in 0...num {
            let res1 = generateDigits(nums1, i)
            let res2 = generateDigits(nums2, num - i)
            for hour in res1 {
                if hour >= 12 {
                    continue
                }
                for minute in res2 {
                    if minute >= 60 {
                        continue
                    }
                    let minuteStr = minute >= 10 ? "\(minute)" : "0\(minute)"
                    result.append("\(hour):\(minuteStr)")
                }
            }
        }
        return result
    }
    
    private func generateDigits(_ nums: [Int], _ count: Int) -> [Int] {
        var res = [Int]()
        helper(&res, nums, count, 0, 0)
        return res
    }
    
    private func helper(_ res: inout [Int], _ nums: [Int], _ count: Int, _ pos: Int, _ sum: Int) {
        if count == 0 {
            res.append(sum)
            return
        }
        for i in pos..<nums.count {
            helper(&res, nums, count - 1, i + 1, sum + nums[i])
        }
    }
}