# Random
A random command line tool to do random stuff

![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSttlmqumySvHGWVY7vOz3Axx3FBYyNDqDIkLpRmNJJx20ZpZuF)

## Usage

### Pick Command
Pick one from multiple options passed in as parameters or via standard input (`stdin`).

From parameters:
```
$ random pick 🍊 🍎 🍍 🍇
🍍
```

From `stdin`:
```
$ echo 🍊 🍎 🍍 🍇 | random pick
🍎
```

Combined parameters and `stdin`:
```
$ echo 🍊 🍎 | random pick 🍍 🍇
🍇
```

When `stdin` contains multiple lines, a random line is selected:
```
$ ls | random pick
Package.swift
$ ls -la | random pick
-rw-r--r--   1 enekoalonso  staff  1069 Sep 14 22:27 LICENSE
```

If a single word is passed in, a random character is selected:
```
$ random pick eneko
e
```

### Dice Command
Throw one or multiple dice.

```
$ random dice
2
```

Multiple throws:
```
$ random dice -n 6
1
6
6
1
6
3
```

## Installation
Note: Requires Swift 4.2, works on Mac and Linux

### With Homebrew
```
$ brew install eneko/tap/random
```

### From Source
```
$ git clone https://github.com/eneko/Random.git
$ cd Random
$ make
```

