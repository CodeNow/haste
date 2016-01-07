#!/bin/bash

# Request options for various tests (you may need to reset cookie here)
host="https://api.runnable-gamma.com"
route="/instances/5637da400eaf1b0c000992d8/dependencies"
num_tests=4
test_delay=1

# Times a request to the given route
# @param $1 url URL to time.
# @param $2 cookie Cookie to use for the request
time_request() {
	local url="$1"
	local cookie="$2"
	(
		time -p curl -s -X GET --header "Cookie: $cookie" "$url" > /dev/null
	) 2>&1 | grep real | awk '{print $2}' &
}

# Performs a multi-iteration test of a the route and echos the results
main() {
	local url="${host}${route}"
	local cookie=$(cat ./auth.cookie)
	echo "     Route: $url"
	echo "Iterations: $num_tests"
	echo "Test Delay: $test_delay"
	for ((i=0; i<num_tests; i++)); do
		time_request "$url" "$cookie"
		sleep "$test_delay"
	done
	sleep 1
}

# Execute the test
main