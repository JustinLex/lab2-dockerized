## Compile code in build container
FROM gcc AS build

COPY sieves-heap.c /usr/src/sieves-heap/sieves-heap.c
WORKDIR /usr/src/sieves-heap
RUN gcc -o sieves-heap sieves-heap.c

## Create container to run program
FROM alpine

COPY --from=build /usr/src/sieves-heap/sieves-heap /bin/sieves-heap

ENTRYPOINT /bin/sieves-heap
