public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var stack = Stack<Int>()
        var res = Array(repeating: 0, count: T.count)
        for (i, temper) in T.enumerated() {
            while !stack.isEmpty && temper > T[stack.top ?? 0]  {
                guard let index = stack.pop() else {
                    continue
                }
                res[index] = i - index
            }
            stack.push(i)
        }
        return res
    }
}