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
class Solution {
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        var resArr = [Int]()
        var temp = [Int]()
        let chars = Array("abcdefghijklmnopqrstuvwxyz")
        dfs(root)
        return String(resArr.map{chars[$0]})
        
        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            temp.insert(root.val, at: 0)
            if root.left == nil && root.right == nil {
                if resArr.count == 0 || isSmaller(temp, resArr) {
                    resArr = temp
                }
            }
            dfs(root.left)
            dfs(root.right)
            temp.removeFirst()
        }

        func isSmaller(_ a1: [Int], _ a2: [Int]) -> Bool {
            let n = min(a1.count, a2.count)
            for i in 0..<n {
                if a1[i] == a2[i] {
                    continue
                }
                return a1[i] < a2[i]
            }
            return a1.count < a2.count
        }
    }
}