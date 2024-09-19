class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var res = Array(repeating: 0, count: n)
        var stack = [Int]()
        for i in 0..<n {
            let x = temperatures[i]
            while !stack.isEmpty && x > temperatures[stack[stack.count-1]] {
                let prev = stack.removeLast()
                res[prev] = i - prev
            }
            stack.append(i)
        }
        return res
    }
}