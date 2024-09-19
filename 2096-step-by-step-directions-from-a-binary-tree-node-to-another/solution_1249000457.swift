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
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        var startNode: TreeNode?
        var destNode: TreeNode?
        var parent = [TreeNode: TreeNode]()
        dfs(root)
        var path1 = path(startNode)
        var path2 = path(destNode)
        var cnt = 0
        while cnt < min(path1.count, path2.count) {
            if path1[cnt] != path2[cnt] {
                break
            } else {
                cnt += 1
            }
        }
        var ans = [Character]()
        for i in 0..<(path1.count-cnt) {
            ans.append("U")
        }
        for i in cnt..<path2.count {
            ans.append(path2[i])
        }
        return String(ans)

        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            if root.val == startValue {
                startNode = root
            }
            if root.val == destValue {
                destNode = root
            }
            if let left = root.left {
                parent[left] = root
                dfs(left)
            }
            if let right = root.right {
                parent[right] = root
                dfs(right)
            }
        }

        func path(_ node2: TreeNode?) -> [Character] {
            guard let node2 else { return [] }
            var res = [Character]()
            var node = node2
            while node != root {
                let p = parent[node] ?? node
                if node == p.left {
                    res.append("L")
                }
                if node == p.right {
                    res.append("R")
                }
                node = p
            }
            return res.reversed()
        }

    }
}

extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
    }
}