### A sample http-trigger-func demo


#### Requirements:
1. An Azure account and authenticated cli
2. A resource group with enough credentials to create Azure Container instances
3. Docker up and running.


#### How to use: (Azure Function demo)

1. Run the image (automatic pull and run) `docker run -p 8080:80 josephmuli/http-trigger-func:1.0`

2. Open `localhost:8080` on your preferred browser



### Running a benchmark

1. Clone the repository at `github.com:mrmuli/http-trigger-func.git`

2. Change dir into `scripts/`

3. Running `./bench.sh` will print results after setting up and running a function locally and on Azure container instances.



### Note  
When running the benchmark, you'll have to drop the image and containers after each run, to encourage accurate results.