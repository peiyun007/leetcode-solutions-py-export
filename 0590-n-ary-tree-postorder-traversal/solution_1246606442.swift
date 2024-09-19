/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func postorder(_ root: Node?) -> [Int] {
    	var res = [Int]()
        dfs(root)
        return res

        func dfs(_ root: Node?) {
            guard let root else { return }
            for child in root.children {
                dfs(child)
            }
            res.append(root.val)
        }
    }
}