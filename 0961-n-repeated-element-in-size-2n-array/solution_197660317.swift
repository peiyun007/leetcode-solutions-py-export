/*  解法一：时间消耗过长
class Solution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        var map: [Int: Int] = [:]
        let count = A.count
        for num in A {
            let res = (map[num] ?? 0) + 1
            map[num] = res
            if res == A.count / 2 {
                return num
            }
        }
        return -1
    }
}
*/

class Solution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        for i in 0..<A.count - 2 {
            if A[i] == A[i + 1] || A[i] == A[i + 2] {
                return A[i]
            }
        }
        return A[A.count - 1]
    }
}