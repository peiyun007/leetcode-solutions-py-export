/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class BSTIterator {
    var cur: TreeNode?
    var stack = [TreeNode]()
    init(_ root: TreeNode?) {
        cur = root
    }
    
    func next() -> Int {
        while let p = cur {
            stack.append(p)
            cur = cur?.left
        }
        cur = stack.removeLast()
        let val = cur?.val ?? 0
        cur = cur?.right
        return val
    }
    
    func hasNext() -> Bool {
        cur != nil || !stack.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */