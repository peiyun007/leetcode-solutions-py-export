/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    var visited = Set<Int>()

    func numComponents(_ head: ListNode?, _ nums: [Int]) -> Int {
        var f = Set<Int>(nums)
        var g = [Int: [Int]]()
        var p = head
        var q: ListNode?
        while p?.next != nil {
            let u = p?.val ?? 0
            q = p?.next
            let v = q?.val ?? 0
            p = q
            
            if f.contains(u) && f.contains(v) {
                var arr1 = g[u] ?? [Int]()
                arr1.append(v)
                g[u] = arr1

                var arr2 = g[v] ?? [Int]()
                arr2.append(u)
                g[v] = arr2
            }
        }

        var ans = 0
        for i in nums {
            if visited.contains(i) {
                continue
            }
            ans += 1
            dfs(g, i)
        }
        return ans
    }

    func dfs(_ g: [Int: [Int]], _ i: Int) {
        if visited.contains(i) {
            return
        }
        visited.insert(i)
        guard let arr = g[i] else {
            return
        }
        for j in arr {
            dfs(g, j)
        }
    }
}