# NCCLOverlap

## Compile

```bash
export LIBRARY_PATH=/path/to/nccl:$LIBRARY_PATH
export PATH=/path/to/cuda/nvvm/bin:$PATH
make
```

## End-to-end Workflow

```bash
export LD_LIBRARY_PATH=/path/to/libnccl.so.2:$LD_LIBRARY_PATH
```

Then, Run the following two commands on the same server with at least 2 GPUs at the same time:

```bash
./cudnn_conv 0 127.0.0.1 <port>
./cudnn_conv 1 127.0.0.1 <port>
```