class Solution {
    func ambiguousCoordinates(_ s0: String) -> [String] {
        var res = [String]()
        var sArr = Array(s0)
        sArr = Array(sArr[1..<sArr.count-1])
        for i in 0..<sArr.count-1 {
            let x = search(0, i)
            let y = search(i+1, sArr.count-1)
            for a in x {
                for b in y {
                    res.append("("+a+", "+b+")")
                }
            }
        }
        return res

        func search(_ start: Int, _ end: Int) -> [String] {
            var ans = [String]()
            if start == end || sArr[start] != "0" {
                ans.append(String(sArr[start...end]))
            }
            for i in start..<end {
                let a = Array(sArr[start...i])
                let b = Array(sArr[i+1...end])
                if a.count > 1 && a[0] == "0" { continue }
                if b.count > 0 && b[b.count-1] == "0" { continue }
                ans.append(String(a)+"."+String(b))
            }
            return ans
        }
    }
}