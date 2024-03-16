class FibonacciConverter {
  int calculateFibonacci(int n) {
    Map<int, int> memo = {};
    return _fibonacci(n, memo);
  }

  int _fibonacci(int n, Map<int, int> memo) {
    if (n <= 1) {
      return n;
    }
    if (memo.containsKey(n)) {
      return memo[n]!;
    }
    memo[n] = _fibonacci(n - 1, memo) + _fibonacci(n - 2, memo);
    return memo[n]!;
  }
}
