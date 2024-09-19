
class MyQueue {
    var stk1 = [Int]()
    var stk2 = [Int]()
    init() {
        
    }
    
    func push(_ x: Int) {
        stk1.append(x)
    }
    
    func pop() -> Int {
        if !stk2.isEmpty {
            return stk2.removeLast()
        }
        while !stk1.isEmpty {
            stk2.append(stk1.removeLast())
        }
        return stk2.removeLast()
    }
    
    func peek() -> Int {
        if !stk2.isEmpty {
            return stk2[stk2.count-1]
        }
        while !stk1.isEmpty {
            stk2.append(stk1.removeLast())
        }
        return stk2[stk2.count-1]
    }
    
    func empty() -> Bool {
        return stk1.isEmpty && stk2.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */