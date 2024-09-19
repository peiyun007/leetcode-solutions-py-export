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

class Codec {
    var vals = [Int]()
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        preOrder(root)
        return vals.map{String($0)}.joined(separator: ",")

        func preOrder(_ root: TreeNode?) {
            guard let root else { return }
            vals.append(root.val)
            preOrder(root.left)
            preOrder(root.right)
        }
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        vals = data.split(separator: ",").map { Int(String($0)) ?? 0 }
        return dfs(Int.min, Int.max)

        func dfs(_ lower: Int, _ upper: Int) -> TreeNode? {
            if vals.isEmpty || vals[0] < lower || vals[0] > upper {
                return nil
            }
            let val = vals.removeFirst()
            let node = TreeNode(val)
            node.left = dfs(lower, val)
            node.right = dfs(val, upper)
            return node
        }
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let ser = Codec()
 * let deser = Codec()
 * let tree: String = ser.serialize(root)
 * let ans = deser.deserialize(tree)
 * return ans
*/