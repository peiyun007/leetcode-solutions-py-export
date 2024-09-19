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