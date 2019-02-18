# docker-deeptools

deepTools v3.1.3 (Python v3.6.5 from Miniconda v4.5.1)

https://deeptools.readthedocs.io/en/develop/index.html

## How to Build

```bash
$ docker build -t deeptools .
```

## How to Use

```bash
$ docker run -it --rm deeptools
```

Running `bamCoverage`:

```bash
$ docker run -it --rm deeptools bamCoverage
```
