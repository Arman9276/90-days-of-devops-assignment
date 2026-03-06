Flag |	Name |	Function
set -e  |	Exit Immediately |	Tells the script to exit instantly if any command exits with a non-zero status (i.e., fails). It prevents "cascading failures."
set -u  |	Nounset |	Treats unset variables and parameters as an error. If you try to use a variable you haven't defined, the script exits immediately.
set -o pipefail  |	Pipe Fail	Ensures that a pipeline returns a failure status if any command in the pipeline fails, not just the last one.
