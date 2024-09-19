/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        var memo: [Int: [TreeNode?]] = [:]
        if memo[N] == nil {
            var list = [TreeNode?]()
            if N == 1 {
                list.append(TreeNode(0))
            } else if N % 2 == 1 {
                for x in 0..<N {
                    let y = N - 1 - x
                    for left in allPossibleFBT(x) {
                        for right in allPossibleFBT(y) {
                            let node = TreeNode(0)
                            node.left = left
                            node.right = right
                            list.append(node)
                        }
                    } 
                }
            }
            memo[N] = list
        }
        return memo[N] ?? []
    }
}