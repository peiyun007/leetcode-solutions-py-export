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
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var res = [[Int]]()
        var queue = [Node]()
        queue.append(root)
        while !queue.isEmpty {
            let len = queue.count
            if len > 0 {
                var temp = [Int]()
                for i in 0..<len {
                    let top = queue[0]
                    temp.append(top.val)
                    queue.removeFirst()
                    for child in top.children {
                        queue.append(child)
                    }
                }
                res.append(temp)
            }
        }
        return res
    }
}