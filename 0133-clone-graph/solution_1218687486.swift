/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node else {
            return nil
        }
        let rootNode = Node(node.val)
        var queue = [Node]()
        queue.append(node)
        var map = [Node: Node]()
        var visited = Set<Node>()
        visited.insert(node)
        map[node] = rootNode

        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for nb in cur.neighbors {
                guard let nb else { continue }
                if !visited.contains(nb) {
                    let node = Node(nb.val)
                    map[nb] = node
                    visited.insert(nb)
                    queue.append(nb)
                }
                var arr = map[cur]?.neighbors ?? [Node]()
                arr.append(map[nb])
                map[cur]?.neighbors = arr
            }
        }
        return rootNode
    }
}