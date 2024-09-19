class Solution {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
        let n = grumpy.count
        var total = 0
        for i in 0..<n {
            if grumpy[i] == 0 {
                total += customers[i]
            }
        }
        var increase = 0, maxIncrease = 0
        for i in 0..<minutes {
            increase += grumpy[i] * customers[i]
            maxIncrease = increase
        }
        for i in minutes..<n {
            increase += grumpy[i] * customers[i] - grumpy[i-minutes] * customers[i-minutes]
            maxIncrease = max(maxIncrease, increase)
        }
        return total + maxIncrease
    }
}