class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var res = [Int]()
        res.append(0)
        var head = 1
        for i in 0..<n {
            for j in (0..<res.count).reversed() {
                res.append(head+res[j])
            }
            head = head << 1
        }
        return res
    }
}