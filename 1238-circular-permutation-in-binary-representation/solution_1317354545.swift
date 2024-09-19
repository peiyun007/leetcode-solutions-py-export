class Solution {
    func circularPermutation(_ n: Int, _ start: Int) -> [Int] {
        var res = [Int]()
        res.append(0)
        var head = 1
        for i in 0..<n {
            for j in (0..<res.count).reversed() {
                res.append(head+res[j])
            }
            head = head << 1
        }
        let index = res.firstIndex { $0 == start } ?? 0
        var ans = Array(res[index...])
        ans += Array(res[..<index])
        return ans
    }
}