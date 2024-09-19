class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n < 0 {
            return 1 / quickMul(x, -n)
        }
        return quickMul(x, n)
    }

    func quickMul(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1.0 }
        let y = quickMul(x, n / 2)
        return n % 2 == 0 ? y * y : y * y * x
    }
}