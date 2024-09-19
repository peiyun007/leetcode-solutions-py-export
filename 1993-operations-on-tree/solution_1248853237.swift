
class LockingTree {
    private let parent: [Int]
    private var lockNodeUser: [Int]
    private var children: [[Int]]
    init(_ parent: [Int]) {
        let n = parent.count
        self.parent = parent
        lockNodeUser = Array(repeating: -1, count: n)
        children = Array(repeating: [Int](), count: n)
        for (i, p) in parent.enumerated() {
            if p != -1 {
                children[p].append(i)
            }
        }
    }
    
    func lock(_ num: Int, _ user: Int) -> Bool {
        if lockNodeUser[num] == -1 {
            lockNodeUser[num] = user
            return true
        }
        return false
    }
    
    func unlock(_ num: Int, _ user: Int) -> Bool {
        if lockNodeUser[num] == user {
            lockNodeUser[num] = -1
            return true
        }
        return false
    }
    
    func upgrade(_ num: Int, _ user: Int) -> Bool {
        let res = lockNodeUser[num] == -1 && !hasAncestorLocked(num) && checkAndUnlockDescendant(num)
        if res {
            lockNodeUser[num] = user
        }
        return res

        func hasAncestorLocked(_ num: Int) -> Bool {
            var x = parent[num]
            while x != -1 {
                if lockNodeUser[x] != -1 {
                    return true
                }
                x = parent[x]
            }
            return false
        }

        func checkAndUnlockDescendant(_ num: Int) -> Bool {
            var res = lockNodeUser[num] != -1
            if res {
                lockNodeUser[num] = -1
            }
            for child in children[num] {
                let childRes = checkAndUnlockDescendant(child)
                res = res || childRes
            }
            return res
        }
    }
}

/**
 * Your LockingTree object will be instantiated and called as such:
 * let obj = LockingTree(parent)
 * let ret_1: Bool = obj.lock(num, user)
 * let ret_2: Bool = obj.unlock(num, user)
 * let ret_3: Bool = obj.upgrade(num, user)
 */