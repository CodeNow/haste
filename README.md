# haste
Internal performance testing framework / tooling

## Introduction
Periodically we will run into performance issues in our various micro-services. Root-cause analysis can be very difficult to perform due to the highly distributed nature of our system. This is where `haste` comes in; it provides a common set of tools for formulating and executing performance tests on our system.

Currently `haste` only has support for easily testing API requests, but is expected to grow in scope as we run into performance problems in the future.

## Test Design
Every good test has the following characteristics:

- **Hypothesis:** theory as to what is causing the performance issue
- **Test:** A procedure by which one tests the given hypothesis
- **Metric:** The metric one is testing (e.g. a slow route)
- **Condition:** A set of conditions under which to test the system

Using this as a basis you can quickly identify and isolate the scope of the problem when attempting to address the issue.
