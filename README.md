# NYU_ADB_Homewrok_2022fall

Homework of course Advanced Database Systems.


| Course Code | CSCI-GA.2434-001|
| :---------: | :--------------: |
| Course name | Advanced Database Systems  | 
| Professor   | Dennis Shasha    |
| Author      | Xiao Ma, Junru He |
| Term        | NYU 2022 fall    |

## [Aquery Installation Steps](https://cs.nyu.edu/courses/fall22/CSCI-GA.2434-001/AqueryInstallation_2022.pdf)

[AQuery github](https://github.com/sunyinqi0508/AQuery2)  
https://github.com/sunyinqi0508/AQuery2.git

用了别人的镜像文件，自己的报错

```bash

docker pull wxharry/aquery
docker run -it --rm wxharry/aquery

```



## Install AQuery in local

According to the file [AqueryInstallation_2022](https://cs.nyu.edu/courses/fall22/CSCI-GA.2434-001/AqueryInstallation_2022.pdf).

```bash
1. git clone https://github.com/sunyinqi0508/AQuery2

2. cd /../AQuery2

3. 
Intel chips: make docker
Silicon chips: docker buildx build --platform=linux/amd64 --no-cache -t aquery 

4. run the image in interactive mode: docker run --name aquery -it aquery
5. python3 prompt.py .
6. input some commands -> execute: exec
like 
> select 1
> exec
===
1


```


## Install AQuery in cims

```bash
1. git clone https://github.com/sunyinqi0508/AQuery2
2. Download the [patch](https://drive.google.com/file/d/1uovL_pE3zVoRM37ne7aGmZygEqq0AsjF/view) and upload it to the CIMS server at any location.
3. Unzip the patch to any directory (preferably at the same level as AQuery2) and execute
the cims.sh script inside. 
每次启动都要从这步从新执行一遍
 source ./cims.sh or ../cims.sh 

4. python3 -m pip install -r requirements.txt 
inside AQuery2 folder
5. python3 ./prompt.py

6. input some commands -> execute: exec
like 
> select 1
> exec
===
1

```

## Use Instructions in local 

copy file (ticks1.csv and stock.a) to the docker: 
```bash
docker ps -> get container id
docker cp path_to_file containerid:/AQuery2/data
```
stock.a文件要传入docker下AQuery文件下，f stock.a 命令才会执行它，否则执行test/stock.a


check the file in the docker
```bash
docker ps -> get container id
docker exec -it containerid /bin/bash 进入docker
ls /AQuery2/data 查看docker的data文件夹中有没有copy过来的文件
```

run and test

```bash
python3 prompt.py -> run in interactive mode
f stock.a  -> Make sure the path to the input file ticks1.csv is correct inside
stocks.a file.
exec


```

## Use Instructions in cims 
If installing on CIMS Copy files to AQuery2 folder

```bash

- login cims server:
  - ssh xm2074@access.cims.nyu.edu (V7?HF@My)
  - upload file: 
    scp -r /Users/xiao/Desktop/A_ADB/hw/hw2/ xm2074@access.cims.nyu.edu:~/AQuery2/
  - download file:
    scp -r xm2074@access.cims.nyu.edu:~/AQuery2/ /Users/xiao/Desktop/A_ADB/hw/hw2/ 

```

To look at the statistics of query execution like execution times, you can enter ```stats
on``` command. This will automatically show the execution times of all commands in the
future. Refer to GitHub repository for more information.
Note : To load data from a file to a table, you can use the following command inside
Aquery ```LOAD DATA INFILE "path_to_file" INTO TABLE tablename FIELDS
TERMINATED BY ","```