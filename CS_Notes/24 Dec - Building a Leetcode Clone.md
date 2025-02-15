# 24 Dec 2024 - Building a LeetCode Clone

## Implementing Backend k8 Cluster


- This has been one of my pet projects for a long time. Finally decided to finish it.
- I tried implementing them from scratch, but they had a lot of vulnerabilities. So I decided to rewrite the whole thing in Rust.


>[!NOTE] Display the mermaid diagram in it.


- Firstly, we implement the execution for `C++` as it is the most commonly used language for practicing DSA questions.(apologies Java and C ppl!)

## C++ Compilation Flags

- Yes, we need to understand what flags to pass and the tradeoffs for the same.


1. `-O0`(No optimization) -> Fastest compile time, but poor runtime performance.
2. `-O1`(Some optimization) -> Does some optimization like removes unused code and simplifies flow.
	- It improves the runtime performance with the tradeoff of harder debugging because of obfuscation of code due to optimizations.
3. `-O2`(Agressive Optimization) -> 




# Helper Functions


- I had written some helper functions which converted some datatypes to a different type to check 

## Basic Requirements

1. We need something which stops execution of the program when something is not correct but does not restart the docker container.  
2. A universal error type which we can return to the user which tells the error and if encountered, stop the execution, return output to user, clear the resources and get ready for next execution request. 


# Building a Docker Image.

- Building the smallest image is important for efficiency and optimization. But its important for it to be compatible with tools we are using on our machine at the same time.
- We will build different images for running different languages, starting with the C++ image.



## C++ Execution Environment

- We have 2 options, one using the `rust:alpine` image and one using the `rust:slim` image. 
- End idea is to add the built binary itself and not run the build command. This optimizes stuff and makes the code very hard to modify.
- The `rust:alpine` image uses something called `musl libc` instead of `glibc` which is the standard `C` library used in Linux which provides a set of functions to . `musl libc` is very lightweight and is used in embedded systems and in `Alpine`. These two aren't compatible so using `Alpine` is out of the question as most Rust libraries rely on the `glibc` library .




- I initially built a `Dockerfile` which was something like this
```
# setup rust image.
FROM rust:latest as rust-build
WORKDIR /usr/src/app

#copying data. 
COPY . .
RUN cargo build --release 
#Stage 2:Final Image FROM alpine:latest 


#Adding C++ dependencies. RUN apk add --no-cache libstdc++ 
#multistage build removing all rust dependencies which isnt needed after code is built.
#only built binary is copied.
COPY --from=rust-build /usr/src/app/target/release/codematrix-exec-service /usr/local/bin


#Setup application directory to copy rust binary. 
WORKDIR /usr/local/bin 
CMD [ "./codematrix-exec-service" ] 
```


- It looks absolutely fine, builds successfully but does not work; moreover throws this weird error
  `exec ./codematrix-exec-service: no such file or directory`.
- Why? Well, by default Rust binaries  

### Multi-Stage Builds

- We can use multiple `FROM` statements to 



## Understanding `Cgroups`

- They form the core of our system, allowing us to control the resources provided to a process and all its child processes. Why do so?
	- Efficient ie. allows more tasks to be executed in same time if resources are allocated according to only what is needed to each task.
	- More importantly, what's to stop someone from running say, an infinite loop and crashing our system itself? As we are allowing arbitrary code to be run on our system, it becomes very important to limit the resources which can be used by a single task to prevent it from crashing the system.

- Lets start with some technical intro to understand how these work.
- 


## Obvious but Dumb Things learnt

- If something has a type of `Result<T,E>` it basically means that either it will be of type `T` if no error and will be of type `E` if an error. 
- `docker start <containerid>` used to start an existing, stopped container.
- `docker exec` used to run commands in existing container and `docker run` used to start a **new container** 
	- `docker exec -it <containerid> sh` used to ssh into running container.
	- `docker run -it --entrypoint sh` starts new container and ssh's into it.


## To be Done

- Implement `new()` method constructing `ResourceLimits` struct.

## Saved Code

```
use std::{path::{Path, PathBuf}, process::Command, time::Duration};

use tempfile::TempDir;

use tokio::fs::File;

  
  

#[derive(Debug)]

struct NonNegativeU64{

    value:u64

} //is this private?

  

impl NonNegativeU64{

    pub fn new(value:u64)->Result<NonNegativeU64,String>{

        if value >= 0{

            Ok(NonNegativeU64{value:value})

        }

        else{

            Err("Size is negative.".to_string())

        }

    }

}

  
  

#[derive(Debug)]

struct ResourceLimits{ //specifies resource limits.

    cpu_time:Duration,

    memory_mb:Result<NonNegativeU64,String>,

    stack_size_mb:Result<NonNegativeU64,String>

}

  

struct CppExecutor{

    compiler_paths:PathBuf, //mutable file path

    resource_limits:ResourceLimits

}

  

impl CppExecutor{

    pub fn new()->Self{ //ensure access to struct by only this method.

         CppExecutor{

            compiler_paths:PathBuf::from("/usr/bin/g++"),

            resource_limits:ResourceLimits{

                cpu_time:Duration::from_secs(1),

                memory_mb:NonNegativeU64::new(256),//change these later

                stack_size_mb:NonNegativeU64::new(64)//change these later

         }

    }

}

  

   async fn compile(&self,source_file_path:&Path,output_path:&Path){

    const COMPILERFLAGS:[&str;4]=["O2","-Wall","-fstack-protector","-static-libstdc++"];

    let status = Command::new(&self.compiler_paths)

        .args(&[

        source_file_path.to_str().unwrap(),//behavior here ie does it panic or what?

        "-o",

        output_path.to_str().unwrap(),

        &COMPILERFLAGS[0],

        &COMPILERFLAGS[1],

        &COMPILERFLAGS[2],

        &COMPILERFLAGS[3], //dirty way to do it.

    ])

    .status();

  
  

        //create a tempfile

        //spawn a new process

        //compile cpp code using flags.

    }

  
  
  

    // async fn execute(&self,binary_file_path:&Path){

    //     let output = Command::new(binary_file_path)

    //     .current_dir(binary_file_path.parent().unwrap())

    //     .output();

  

    // }

  
  

    // pub async fn run_code(&self,code:&str){

    //     let temp_dir = TempDir::new();

    //     // let source_file_path = temp_dir

  
  

    // }

  
  

    pub async fn run_code(code:String){

        let temp_dir = TempDir::new_in("/usr/src"); //creates temp directory inside /usr/src

        let file_creation = match temp_dir{

            Ok(tempdir)=>{File::create_new(Path::new(tempdir.path()));},

            Err(err)=>println!("Error in temp dir creation with error"),

        };

  
  
  

        // File::create_new(Path::new(temp_dir));

  

    }

}

  
  

#[tokio::main] //meaning of this?

async fn main(){

    println!("hefsllo!")

}

  
  
  
  
  
  

// use cgroups_rs::{

//     Cgroup, CgroupBuilder, hierarchies::V2,

//     cpu::{CpuController, CpuMax},

//     memory::{MemController, MemoryMax},

// };

// use std::error::Error;

// use std::sync::atomic::{AtomicBool, Ordering};

// use std::sync::Arc;

// use std::thread;

// use std::time::Duration;

  

// /// Represents our resource limits configuration

// struct ResourceLimits {

//     memory_bytes: i64,

//     cpu_max_percentage: u64,

// }

  

// /// Manages cgroup resources for a process

// struct CgroupManager {

//     cgroup: Cgroup,

// }

  

// impl CgroupManager {

//     /// Creates a new cgroup manager with specified limits

//     pub fn new(name: &str, limits: ResourceLimits) -> Result<Self, Box<dyn Error>> {

//         // Ensure cgroups v2 hierarchy is available

//         let hierarchy = V2::new();

  

//         // Build the cgroup with specified controllers

//         let cgroup = CgroupBuilder::new(name)

//             // Configure memory limits

//             .memory()

//             .memory_max(MemoryMax::from(limits.memory_bytes))

//             .done()

//             // Configure CPU limits

//             .cpu()

//             .cpu_max(CpuMax::from((limits.cpu_max_percentage, 100_000))) // percentage and period

//             .done()

//             // Build the cgroup

//             .build(hierarchy)?;

  

//         Ok(Self { cgroup })

//     }

  

//     /// Add a process to this cgroup

//     pub fn add_process(&self, pid: u64) -> Result<(), Box<dyn Error>> {

//         self.cgroup.add_task_by_tgid(pid)?;

//         Ok(())

//     }

  

//     /// Get current memory usage

//     pub fn get_memory_usage(&self) -> Result<i64, Box<dyn Error>> {

//         let controller = self

//             .cgroup

//             .controller_of::<MemController>()

//             .ok_or("Memory controller is unavailable")?;

  

//         Ok(controller.memory_current()?)

//     }

  

//     /// Get current CPU usage

//     pub fn get_cpu_usage(&self) -> Result<f64, Box<dyn Error>> {

//         let controller = self

//             .cgroup

//             .controller_of::<CpuController>()

//             .ok_or("CPU controller is unavailable")?;

  

//         Ok(controller.cpu_stat()?.usage_nanos as f64 / 1_000_000_000.0)

//     }

// }

  

// fn main() -> Result<(), Box<dyn Error>> {

//     // Define our resource limits

//     let limits = ResourceLimits {

//         memory_bytes: 100 * 1024 * 1024, // 100MB

//         cpu_max_percentage: 50,          // 50% CPU

//     };

  

//     // Create a new cgroup manager

//     let cgroup_manager = CgroupManager::new("my_cgroup", limits)?;

  

//     // Add current process to the cgroup

//     let current_pid = std::process::id() as u64;

//     cgroup_manager.add_process(current_pid)?;

  

//     // Run some computation to test limits

//     println!("Starting resource-limited computation...");

  

//     // Setup atomic flag for graceful shutdown

//     let running = Arc::new(AtomicBool::new(true));

//     let running_clone = running.clone();

  

//     // Catch Ctrl+C to allow graceful shutdown

//     ctrlc::set_handler(move || {

//         println!("Shutting down...");

//         running_clone.store(false, Ordering::SeqCst);

//     })?;

  

//     // Monitor resource usage

//     while running.load(Ordering::SeqCst) {

//         let memory_usage = cgroup_manager.get_memory_usage().unwrap_or(-1);

//         let cpu_usage = cgroup_manager.get_cpu_usage().unwrap_or(-1.0);

  

//         println!("Memory usage: {} MB", memory_usage / (1024 * 1024));

//         println!("CPU usage: {:.2}%", cpu_usage * 100.0);

  

//         thread::sleep(Duration::from_secs(1));

//     }

  

//     Ok(())

// }
```




[[Resources for Indepth Reading]]