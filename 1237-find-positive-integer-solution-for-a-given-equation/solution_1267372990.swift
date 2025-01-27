/*
 * // This is the custom function interface.
 * // You should not implement it, or speculate about its implementation
 * class CustomFunction {
 *     // Returns f(x, y) for any given positive integers x and y.
 *     // Note that f(x, y) is increasing with respect to both x and y.
 *     // i.e. f(x, y) < f(x + 1, y), f(x, y) < f(x, y + 1)
 *     func f(_ x: Int, _ y: Int) -> Int {}
 * }
 */

class Solution {
    func findSolution(_ customfunction: CustomFunction, _ z: Int) -> [[Int]] {
        var ans = [[Int]]()
        var y = 1000
        for x in 1...1000 {
            while y >= 0 && customfunction.f(x, y) > z {
                y -= 1
            }
            if y == 0 {
                break
            }
            if customfunction.f(x, y) == z {
                ans.append([x, y])
            }
        }
        return ans

    }
}