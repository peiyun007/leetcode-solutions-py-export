class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var arr = [(Int, Int)]()
        for i in 0..<position.count {
            arr.append((position[i], speed[i]))
        }
        arr.sort { $0.0 < $1.0 }
        var time = [Double]()
        for i in 0..<arr.count {
            let x = Double(target - arr[i].0) / Double(arr[i].1)
            time.append(x)
        }
        var stack = [Double]()
        for (i, t) in time.enumerated() {
            while !stack.isEmpty && t >= stack[stack.count-1] {
                stack.removeLast()
            }
            stack.append(t)
        }
        return stack.count
    }
}