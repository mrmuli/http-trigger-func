### A sample http-trigger-func demo


#### Requirements:
1. An Azure account and authenticated cli
2. A resource group with enough credentials to create Azure Container instances
3. Docker up and running.


#### How to use: (Azure Function demo)

1. Make sure the port used below is free on your computer. You are free to use different ones. I.e `8080:80`

2. Run the image (automatic pull and run) `docker run -p 80:80 josephmuli/http-trigger-func:1.0`

2. Open `localhost:80` on your preferred browser



### Running a benchmark

1. Clone the repository at `github.com:mrmuli/http-trigger-func.git`

2. Change dir into `scripts/`

3. Update variables
   - resource_group : Your Azure resource group name in `aci.sh` and `delete.sh`

3. Running `./bench.sh` will print results after setting up and running a function locally and on Azure container instances.



### Note  
- When running the benchmark, you'll have to drop the image and containers after each run, to encourage accurate results. You can make use of the `delete.sh` to drop your resources after use.
- The `--no-wait` flag has been added to all `az create` commands and has an impact on the results. The flag prevents wait for the long-running operation to finish. This however, doesn't have the container start faster. There's still an overhead of 10-20+ seconds. 

- Under the scripts path, there is an ARM template which can be used to customize your container but achieve the same goals. I.e. set a dns name or define volumes. Comment out the appropriate command in aci.sh to make use of it.


Sample results after running `./bench`

`With --no-wait`
```
$ ./bench.sh
Launching Docker Container...
Launching ACI Instance...
done
---------------------------------
results:
Local Docker Environment - 5 seconds
ACI Environment - 2 seconds

```

`Without --no-wait`
```
Launching Docker Container...
done local
Launching ACI Instance...
done
---------------------------------
results:
Local Docker Environment - 6 seconds
ACI Environment -  128 seconds
```
