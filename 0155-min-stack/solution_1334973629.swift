
class MinStack {
    var stack = [(Int, Int)]()
    init() {
        
    }
    
    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append((val, val))
        } else {
            stack.append((val, min(val, stack[stack.count-1].1)))
        }
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        if stack.isEmpty {
            return 0
        } else {
            return stack[stack.count-1].0
        }
    }
    
    func getMin() -> Int {
        if stack.isEmpty {
            return 0
        } else {
            return stack[stack.count-1].1
        }
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */