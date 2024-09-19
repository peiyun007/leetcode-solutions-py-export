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

class FindElements {
    var set = Set<Int>()
    init(_ root: TreeNode?) {
        dfs(root, 0)
    }

    func dfs(_ root: TreeNode?, _ val: Int) {
        guard let root else { return }
        set.insert(val)
        dfs(root.left, 2 * val + 1)
        dfs(root.right, 2 * val + 2)
    }
    
    func find(_ target: Int) -> Bool {
        return set.contains(target)
    }
}

/**
 * Your FindElements object will be instantiated and called as such:
 * let obj = FindElements(root)
 * let ret_1: Bool = obj.find(target)
 */