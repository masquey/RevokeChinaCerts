RevokeChinaCerts on Windows
==============
Revoke Chinese certificates.

## Introduction
This document explains how to use SoftCertPolicyAppender tool, the tool can add certificates to system force policy.
* [简体中文介绍](README.zh-Hans.md)
* [繁體中文介紹](README.zh-Hant.md)

## Usage
* `SoftCertPolicyAppender.exe <Parameter> <Certificate path>`
* `SoftCertPolicyAppender.exe <Parameter 1> <Parameter 2> ... <Certificate path 1> <Certificate path 2> ...`

## Parameter
* `--help`: Print help message.
* `--set-force`: Set force certificate policy.
* `--unset-force`: Unset force certificate policy.
* `--remove`: Remove certificate rule by CERTFILEs not add.
* `--interval Time`: Interval time if get exception. Time is in milliseconds.
* `--quiet`: Quiet mode, no any asking.

## Notice
* Need administrative privileges.
* Need [Microsoft .NET Framework 4.x](https://www.microsoft.com/en-us/download/details.aspx?id=17718) or later version.
* Depend on [Local-Policy](https://bitbucket.org/MartinEden/local-policy/overview).
