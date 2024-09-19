
class MyStack {
    var q1 = [Int]()
    var q2 = [Int]()
    init() {
        
    }
    
    func push(_ x: Int) {
        q2.append(x)
        while !q1.isEmpty {
            let y = q1.removeFirst()
            q2.append(y)
        }
        (q1, q2) = (q2, q1)
    }
    
    func pop() -> Int {
       return q1.removeFirst()
    }
    
    func top() -> Int {
        return q1[0]
    }
    
    func empty() -> Bool {
        return q1.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */