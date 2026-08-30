# Bounded reconnect backoff

- Added `:backoff` to the nominal browser connection phase.
- Reused Cumulo Util `RetryBackoff` through its `.next` and `.reset` methods;
  callers may configure base delay, maximum delay, and jitter ratio in client
  options.
- Unexpected close schedules one timer. Open resets retry state; manual and
  lifecycle recovery cancel a pending timer before connecting; explicit close
  cancels both reconnect and browser lifecycle resources.
- Expanded the generated-JavaScript fake-clock smoke to prove 500/1000 ms
  exponential progression, reset after open, online acceleration, and timer
  cleanup.
