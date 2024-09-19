class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        var prev = "1"
        for i in 2...n {
            var cur = ""
            let prevArr = Array(prev)
            var start = 0, pos = 0
            while pos < prevArr.count {
                while pos < prevArr.count && prevArr[pos] == prevArr[start] {
                    pos += 1
                }
                cur += String(pos-start) + String(prevArr[start])
                start = pos
            }
            prev = cur
        }
        return prev
    }
}