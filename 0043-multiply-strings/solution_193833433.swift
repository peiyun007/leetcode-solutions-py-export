class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else {
            return "0"
        }
        var result = Array(repeating: 0, count: num1.count + num2.count)
        for i in (0..<num1.count).reversed() {
            for j in (0..<num2.count).reversed() {
                let multiply = Int(String(num1[num1.index(num1.startIndex, offsetBy: i)]))! * Int(String(num2[num2.index(num2.startIndex, offsetBy: j)]))!
                let sum = multiply + result[i+j+1]
                result[i+j] += sum / 10
                result[i+j+1] = sum % 10
            }
        }
        var startIndex = 0
        for (i, num) in result.enumerated() {
            if num != 0 {
                break
            } else {
                startIndex = i + 1
            }
        }
        return result[startIndex...].reduce("") {$0 + String($1)}
    }
}