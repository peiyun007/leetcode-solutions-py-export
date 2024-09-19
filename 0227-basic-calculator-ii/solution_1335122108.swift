class Solution {
    func calculate(_ s: String) -> Int {
        var num = 0
        let sArr = Array(s)
        var preSign: Character = "+"
        var stack = [Int]()
        let n = sArr.count
        for (i, ch) in sArr.enumerated() {
            if ch.isNumber {
                let x = Int(String(ch)) ?? 0
                num = num * 10 + x
            }
            if (!ch.isNumber && ch != " ") || (i == n-1)  {
                switch preSign {
                case "+":
                    stack.append(num)
                case "-":
                    stack.append(-num)
                case "*":
                    let x = stack.removeLast()
                    stack.append(x*num)
                case "/":
                    let x = stack.removeLast()
                    stack.append(x/num)
                default:
                    break
                }
                preSign = ch
                num = 0
            }
        }
        return stack.reduce(0) { $0+$1 }
    }
}