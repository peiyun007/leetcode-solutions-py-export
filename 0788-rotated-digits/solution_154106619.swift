// private extension String {
//     func isX() -> Bool {
//         let chars = Array(self)
//         var hasOne = false
//         for char in chars {
//             if char == "0" || char == "1" || char == "8" || char == "2" || char == "5" || char == "6" || char == "9" {
//                 if char == "2" || char == "5" || char == "6" || char == "9" {
//                     hasOne = true
//                 }
//             } else {
//                 return false
//             }
//         }
//         return hasOne
//     }
// }

class Solution {
    // func rotatedDigits(_ N: Int) -> Int {
    //     var res = 0
    //     for i in 1...N {
    //         if String(i).isX() {
    //             res += 1
    //         }
    //     }
    //     return res
    // }
    func rotatedDigits(_ N: Int) -> Int {
        let map = [0: 0, 1: 1, 8: 8, 2: 5, 5: 2, 6: 9, 9: 6]
        var count = 0
        
        for i in 1...N {
            var num = i
            var mapNum = 0
            var isValid = true
            var degree = 0
            while num > 0 {
                if let x = map[num % 10] {
                    mapNum += x * Int(pow(10.0, Double(degree)))
                    num = num / 10
                } else {
                    isValid = false
                    break
                }
                degree += 1
            }
            if isValid && mapNum != i {
                count += 1
            }
        }
        return count
    }
}