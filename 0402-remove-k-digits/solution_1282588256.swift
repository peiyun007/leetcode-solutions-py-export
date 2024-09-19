class Solution {
    func removeKdigits(_ num: String, _ k0: Int) -> String {
        var arr = Array(num)
        let n = arr.count
        var k = k0
        var stack = [Int]()
        for i in 0..<n {
            let c = getInt(arr[i])
            while !stack.isEmpty && c < stack[stack.count-1] && k > 0 {
                stack.removeLast()
                k -= 1
            }
            stack.append(c)
        }
        while k > 0 {
            stack.removeLast()
            k -= 1   
        }
        var res = ""
        var isLeadingZero = true
        for x in stack {
            if isLeadingZero && x == 0 {
                continue
            }
            isLeadingZero = false
            res += String(x)
        }
        return res == "" ? "0" : res
    }

    func getInt(_ c: Character) -> Int {
        return Int(c.asciiValue ?? 0) - Int(Character("0").asciiValue ?? 0)
    }
}