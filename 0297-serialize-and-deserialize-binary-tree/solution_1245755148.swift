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
    var arr = [String]()
    func serialize(_ root: TreeNode?) -> String {
        guard let root else { return ""}
        preOrder(root)
        return arr.joined(separator: ",")

        func preOrder(_ root: TreeNode?) {
            guard let root else {
                arr.append("nil")
                return
            }
            arr.append(String(root.val))
            preOrder(root.left)
            preOrder(root.right)
        }
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        arr = data.split(separator: ",").map {String($0)}
        return dfs()

        func dfs() -> TreeNode? {
            if arr.isEmpty {
                return nil
            }
            if arr[0] == "nil" {
                arr.removeFirst()
                return nil
            }
            let val = arr.removeFirst()
            let node = TreeNode(Int(val) ?? 0)
            node.left = dfs()
            node.right = dfs()
            return node
        }
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))