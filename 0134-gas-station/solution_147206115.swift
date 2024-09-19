class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var start = 0, total = 0, tank = 0
        for i in 0 ..< gas.count {
            total += (gas[i] - cost[i])
            tank += (gas[i] - cost[i])
            if tank < 0 {
                start = i + 1
                tank = 0
            }
        }
        return total < 0 ? -1 : start
    }
}