

- DynamoDB's goal is to provide consistent performance at any scale
- it's aim is to provide sub 10 millisecond latency for queries.


### workload pattern 
- multi tenant architecture - 
- high resource utilisation- To ensure infrastructure is used efficiently. 
- unlimited scale on tables- A table can have millions, billions or trillions of rows. 
- highly available- To provide fast recovery and replication.


### basics of DynamoDB

- It is a collection of items. 
- every item passed needs to have a primary key. 
	- Two keys can be passed- partition and sort keys. 
	- Partition key identifies which partition or shard is the data stored in.
	- sort key is used to sort according to some column given in table. 
	- sorry key is optional
- either partition key only acts as primary key or partition and sort key together act as primary key.

#### Secondary Indexes
- Indexes are basically data structures created which precompute and store data sorted according to some criterion of the table.
	- say you have 4 columns, `userid`,`purchase`,`item` and `name`.
	- We basically sort all entries alphabetically based on `name ` if its the primary key. 
- DynamoDB supports secondary Indexes on its columns.


### Multi Paxos and Replication 

- Partitions are disjoint, subset and contiguous parts of tables. 
- suppose with a certain replication factor, Partitions are created in different availability zones.
- **Paxos** is run on all partitions having same data at the partition level.
- they elect a leader and all other partitions are followers/slaves of it. 
	- by that, it means that all data is only written to leader and wishes copy from it. 
- Any partition can call an election to elect leader of present leader fails. 

#### Functions of Partitions

- Writes can be pushed to any partition. 
- Consistency guarantees can be selected for reads.
	- for Strong consistency reads, they are done from the leader 
	- For eventual Consistency, data is read from any of the replicas.


#### How is data synced if write comes to leader

- If write comes to leader, it makes changes to it's data and also writes to it's Write Ahead Log(WAL).
- Then, a request is sent to all nodes telling them to make changes to their WAL. 
- All this is done synchronously and when majority of nodes acknowledge, the write is completed successfully. 

>[NOTE] All data for the replicas is written to only their WAL's. Once majority of replicas acknowledge, then asynchronously, the replicas write data to their tables using the WAL.

#### Write Ahead Log
- 


### Pros of Sharding, Replicas

- Sharding or partitioning is very advantageous.
- Suppose a particular partition becomes hot ie. high number of reads and/or writes, then we can split it into smaller partitions, thus handling load effectively.



### Terminologies 
- workload pattern - Predictable usage patterns of a system. 
- multi tenant architecture - single instance serves multiple customers. They can share physical or virtual hardware.
	- Data is isolated from other customers on same network to provide security.



## Questions
- [ ] why is over indexing bad?
- [ ] how does syncing of data happen between different replicas if writes come to replicas? Or do writes not come to the replica?