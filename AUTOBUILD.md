# Personal notes on automatic builds

## Docker Hub

## Docker Cloud

| Source Type | Source        | Docker Tag          |
|-------------|---------------|---------------------|
| ~Branch~    | master        | latest              |
| Tag         | see below     | see below           |

<!-- See https://www.tablesgenerator.com/markdown_tables -->

```
Source:
/^((?:[0-9]+)(?:\.[0-9]+)?)((?:\.[0-9]+)*)-(\S+)-((?:[0-9]+)(?:\.[0-9]+)?)((?:\.[0-9]+)*)$/
Tag:
latest,{\1}{\2}-{\3}-{\4}{\5},{\1}-{\3}-{\4},{\1}
```

This [matches](https://regex101.com/r/7lEc16/2) anything in the form `[x.y][.z...]-test-[a.b][.c.d...]` and will **sensibly** triple label the image as `x.y.z-test-a.b.c.d`, `x.y-test-a.b` and `x.y`

```
Source:
/^((?:[0-9]+)(?:\.[0-9]+)?)((?:\.[0-9]+)*)-(\S+)-((?:[0-9]+)(?:\.[0-9]+)?)((?:\.[0-9]+)*)-tex$/
Tag:
{\1}{\2}-{\3}-{\4}{\5}-tex,{\1}-{\3}-{\4}-tex,{\1}-tex
```