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

class CBTInserter {
    private let root: TreeNode?
    private var candidate = [TreeNode]()

    init(_ root: TreeNode?) {
        self.root = root
        guard let root else { return }

        var queue = [TreeNode]()
        queue.append(root)

        while !queue.isEmpty {
            let node = queue.removeFirst()
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
            if node.left == nil || node.right == nil {
                candidate.append(node)
            }
        }
    }
    
    func insert(_ val: Int) -> Int {
        let child = TreeNode(val)
        guard let pa = candidate.first else { return -1 }
        let res = pa.val
        if pa.left == nil {
            pa.left = child
        } else {
            pa.right = child
            candidate.removeFirst()
        }
        candidate.append(child)
        return res
    }
    
    func get_root() -> TreeNode? {
        return root
    }
}

/**
 * Your CBTInserter object will be instantiated and called as such:
 * let obj = CBTInserter(root)
 * let ret_1: Int = obj.insert(val)
 * let ret_2: TreeNode? = obj.get_root()
 */