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

### Toolchain configuration

Launch CLion, a popup will then ask you to open or create a project :

<p align="center">
 <img src="https://user-images.githubusercontent.com/14150442/61575243-a979f000-aac9-11e9-9438-2d541ba420b8.PNG" width="50%" height="50%" />
</p>

Choose "Open" and locate your project folder :

<p align="center">
 <img src="https://user-images.githubusercontent.com/14150442/61575244-a979f000-aac9-11e9-83ce-80167f6b0164.PNG" width="30%" height="30%" />
</p>

<p align="justify">
Click "Ok", the editor will show up. Now we have to configure our compilers. Press CTRL+ALT+S or go to File > Settings. Then go to <b>Build Execution, Deployement > Toolchains</b> :
</p>

<p align="center">
 <img src="https://user-images.githubusercontent.com/14150442/61575333-a8958e00-aaca-11e9-8c79-5af424afe18b.PNG" width="90%" height="90%" />
</p>

<p align="justify">
Press "+" to add a new target compiler. We are going to add two different one (32 & 64 bits). Once you have clicked on "+" rename it into <i>GCC 8.1 POSIX SEH 64 bits</i>. Under the <i>Environment</i> tab, locate your compiler (should be something as D:/Librabies/MinGW64_GCC_8.1.0_POSIX_SEH if you have followed the tutorial). CLion will now detect this compiler. Do the same thing for the 32 bits compiler. You'll ended up with such result : 
</p>

<p align="center">
 <img src="https://user-images.githubusercontent.com/14150442/61575422-d8916100-aacb-11e9-94ad-27099b0de594.PNG" width="90%" height="90%" />
</p>

### CMake configuration

<p align="justify">
Our compilers are good but CMake is still unconfigured. Go into <b>Settings > Build Execution, Deployement > CMake</b>. We will create 4 different CMake configuration (Be careful, choose the right compiler at each time) :
</p>

* Debug 32 bits&nbsp;, Name : x86_d
* Release 32 bits,     Name : x86_r
* Debug 64 bits,&nbsp; Name : x64_d
* Release 64 bits,     Name : x64_r

<p align="center">
 <img src="https://user-images.githubusercontent.com/14150442/61575673-d1b81d80-aace-11e9-8610-c0fdf6799569.PNG" width="90%" height="90%" />
</p>

Well done, CLion is almost ready. CMake will now load the project.

### Other usefull settings

#### Hide CMake folders in the project hierarchy

Unfortunately, CMake will generate a folder for each CMake configuration but we won't see them

<p align="center">
 <img src="https://user-images.githubusercontent.com/14150442/61575801-ab937d00-aad0-11e9-83dd-67c0213ba611.PNG" width="40%" height="40%" />
</p>

To hide them in the hierarchy : Coming Soon

#### CLion Live templates

Coming Soon.

#### Usefull plugins

Coming Soon.
