# Personal notes on automatic builds

## Docker Hub

## Docker Cloud

| Source Type | Source                                                                   | Docker Tag                                                            |
|-------------|--------------------------------------------------------------------------|-----------------------------------------------------------------------|
| Branch      | master                                                                   | latest                                                                |
| Tag         | /^([0-9.]+)-test-([0-9.]+)$/                                             | {\1}-test-{\2}                                                        |
| Tag         | /^([0-9]).([0-9]).([0-9]).([0-9])-test-([0-9]).([0-9]).([0-9]).([0-9])$/ | {\1}.{\2}.{\3}.{\4}-test-{\5}.{\6}.{\7}.{\8},{\1}.{\2}-test-{\5}.{\6} |

<!-- See https://www.tablesgenerator.com/markdown_tables -->