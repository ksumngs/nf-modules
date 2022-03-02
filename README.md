# ksumngs/nf-modules

[nf-core]-compatible [Nextflow modules] with a Wildcat flavor.

## Usage

You'll need [nf-core tools]. Using our modules is basically the same as using
vanilla [`nf-core modules`], but just add
`-g ksumngs/nf-modules` to each command.

```shellsession
$ nf-core modules -g ksumngs/nf-modules list remote

                                          ,--./,-.
          ___     __   __   __   ___     /,-._.--~\
    |\ | |__  __ /  ` /  \ |__) |__         }  {
    | \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                          `._,._,'

    nf-core/tools version 2.3.dev0



INFO     Modules available from ksumngs/nf-modules (master):    list.py:123

┏━━━━━━━━━━━━━━━━━━━━━━┓
┃ Module Name          ┃
┡━━━━━━━━━━━━━━━━━━━━━━┩
│ cat/fastq            │
│ cliquesnv/illumina   │
│ cliquesnv/illuminavc │
│ edirect/efetch       │
...
```

[nf-core]: https://nf-co.re
[Nextflow modules]: https://nextflow.io/docs/latest/dsl2.html#modules
[nf-core tools]: https://nf-co.re/tools
[`nf-core modules`]: https://nf-co.re/tools/#modules
