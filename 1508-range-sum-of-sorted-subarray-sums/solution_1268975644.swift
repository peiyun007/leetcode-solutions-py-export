class Solution {
    func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
        let mod = 1_0000_0000_7
        var preSum = [Int]()
        for i in 0..<n {
            var sum = 0
            for j in i..<n {
                sum += nums[j]
                sum = sum % mod
                preSum.append(sum)
            }
        }
        
        preSum.sort(by: <)
        return Array(preSum[left-1...right-1]).reduce(0) { ($0+$1) % mod }
    }
}