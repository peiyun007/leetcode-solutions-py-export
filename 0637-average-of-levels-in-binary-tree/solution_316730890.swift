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
//     func averageOfLevels(_ root: TreeNode?) -> [Double] {
//         var sum = [Double]()
//         var count = [Int]()
//         average(root, 0, &sum, &count)
//         return sum.enumerated().map{$0.1 / Double(count[$0.0])}
//     }
    
//     func average(_ t: TreeNode?, _ i: Int, _ sum: inout [Double], _ count: inout [Int]) {
//         guard let t = t else {
//             return
//         }
//         if i < sum.count {
//             sum[i] += Double(t.val)
//             count[i] += 1
//         } else {
//             sum.append(Double(t.val))
//             count.append(1)
//         }
//         average(t.left, i + 1, &sum, &count)
//         average(t.right, i + 1, &sum, &count)
//     }
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else {
            return []
        }
        var res = [Double]()
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            var temp = queue
            var sum: Double = 0
            for i in 0..<temp.count {
                let top = queue[0]
                sum += Double(top.val)
                queue.removeFirst()
                
                if let left = top.left {
                    queue.append(left)
                }
                if let right = top.right {
                    queue.append(right)
                }
            }
            res.append(sum / Double(temp.count))
        }
        return res
    }
}