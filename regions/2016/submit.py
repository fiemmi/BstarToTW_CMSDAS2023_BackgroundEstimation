# This is a Condor submit description file
# for submitting a job to LXPLUS cluster

# Executable to run
executable = run.sh

# Output log file
output = my_job.log

# Error log file
error = my_job.err

# Request resources (modify as needed)
request_cpus = 1
request_memory = 2GB
request_disk = 1GB

# Specify the queue
queue
