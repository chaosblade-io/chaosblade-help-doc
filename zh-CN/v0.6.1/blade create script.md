# blade create script

# **Introduction**
Script chaos experiment
* [blade create script delay](blade create script delay.md)	Script executed delay
* [blade create script exit](blade create script exit.md)	Exit script


# **Example**
````
  # Add commands to the script `start0() { sleep 10.000000 ...}`
  blade create script delay --time 10000 --file test.sh --function-name start0

  # Add commands to the script `start0() { echo this-is-error-message; exit 1; ... }`
  blade create script exit --exit-code 1 --exit-message this-is-error-message --file test.sh --function-name start0

````

