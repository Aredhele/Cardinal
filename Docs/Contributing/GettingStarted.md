# ![Cardinal](https://raw.githubusercontent.com/Aredhele/Cardinal/master/Docs/Visual/Banner.png)

# Getting Started

<p align="justify">
To contribute to Cardinal, you need to setup the project on your computer. The goal of this document is to 
provide an easy step-by-step tutorial.
</p>

## Prerequisites
### Download

<p align="justify">
Before jumping straight into the setup, some third parties are required. Here's an exhaustive list of what you have to download
before setting up Cardinal :
</p>

* IDE &emsp;&emsp;&emsp;&emsp;&emsp; : [CLion](https://www.jetbrains.com/clion/download/#section=windows)
* Version control                    : [Git](https://git-scm.com/)
* Compiler 1 &emsp;&nbsp;&nbsp;      : [MinGW GCC Posix SEH 8.1 64 bits](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z/download)
* Compiler 2 &emsp;&nbsp;&nbsp;      : [MinGW GCC Posix SJLJ 8.1 32 bits](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/8.1.0/threads-posix/sjlj/i686-8.1.0-release-posix-sjlj-rt_v6-rev0.7z/download)

Once everything is downloaded, you can move to the next part.

### Installation

<p align="justify">
Now we can install all previously downloaded prerequisites. In the following order :
</p>

* Install Git
* In a folder called Libraries, extract the two compilers and rename the folders with explicit names like :
  * D:/Librabies/MinGW64_GCC_8.1.0_POSIX_SEH
  * D:/Libraries/MinGW32_GCC_8.1.0_POSIX_SJLJ
* Install CLion

## Cloning the project

<p align="justify">
In order to have a local copy of the project, you have to clone the github project. Two options : 
</p>

* Go to https://github.com/Aredhele/Cardinal and click on the download button.
* Open your Git command prompt and clone the project using :
```
git clone https://github.com/Aredhele/Cardinal.git
```

<p align="justify">
In both case ensure that your project files are located on your disk at valid path like D:/Project/Cardinal
</p>

### Pro tips 

<p align="justify">
Because we're gonna make an heavy use of the project folder, don't hesitate to create shortcuts on the project folder like :
</p>
<p align="center">
 <img src="https://user-images.githubusercontent.com/14150442/61574507-1d63ca80-aac1-11e9-9b4f-8cb3751dd337.gif" width="373" height="188" />
</p>

## Setting up CLion with the project

Coming soon.
