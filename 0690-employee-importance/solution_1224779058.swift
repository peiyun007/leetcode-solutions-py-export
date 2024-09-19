/**
 * Definition for Employee.
 * public class Employee {
 *     public var id: Int
 *     public var importance: Int
 *     public var subordinates: [Int]
 *     public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
 *         self.id = id
 *         self.importance = importance
 *         self.subordinates = subordinates
 *     }
 * }
 */

class Solution {
    var map = [Int: Employee]()
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        for e in employees {
            map[e.id] = e
        }
        return dfs(employees, id)
    }

    func dfs(_ employees: [Employee], _ id: Int) -> Int {
        var ans = 0
        guard let ee = map[id] else {
            return ans
        }
        ans += ee.importance
        for subid in ee.subordinates {
            ans += dfs(employees, subid)
        }
        return ans
    }
}