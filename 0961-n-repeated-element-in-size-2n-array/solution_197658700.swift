class Solution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        var map: [Int: Int] = [:]
        for num in A {
            map[num] = (map[num] ?? 0) + 1
            if map[num] == A.count / 2 {
                return num
            }
        }
        return -1
    }
}