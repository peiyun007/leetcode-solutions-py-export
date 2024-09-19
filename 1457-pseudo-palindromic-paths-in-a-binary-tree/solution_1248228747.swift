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
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var counter = Array(repeating: 0, count: 10)
        var res = 0
        dfs(root)
        return res

        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            counter[root.val] += 1
            if root.left == nil && root.right == nil {
                if isPalindromic(counter) {
                    res += 1
                }
            } else {
                dfs(root.left)
                dfs(root.right)
            }
            counter[root.val] -= 1
        }
    }

    func isPalindromic(_ counter: [Int]) -> Bool {
        var oddCount = 0
        for x in counter {
            if x % 2 == 1 {
                oddCount += 1
            }
        }
        return oddCount <= 1
    }
}