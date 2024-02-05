# Systemd simple counter service project

In this project, you'll need to make a system daemon that does some really simple things, but has all the aspects of a basic daemon.

### Part 1 - write your service core behaviors

Use any language you like to write a program that can build and run on a Linux system. This service has one core job: to count seconds and write them to a file.

The file: /tmp/currentCount.out

The count: every second, it should write the current count out to the file.

The basic structure is:  
```
  program starts  
  open file for writing: /tmp/currentCount.out  
  make a counter variable = 0  
  while not stopped:  
    print out your name with a colon
    print out the current date & time  
    print counter variable to STDOUT  
    write current date & time to the currentCount.out file
    write counter variable to file  
    counter variable ++  
    sleep 1 second  
```

The output for each second should look roughly like this:  
Crandall: 2023-02-09 20:03:08 #3  
Crandall: 2023-02-09 20:03:09 #4  
Crandall: 2023-02-09 20:03:10 #5  

If you use a language like C++ or Java, then include a script to build your program. This can be a Makefile or Java build tool like Ant/Maven/Gradle, but have a way to build your tool using an automatic process.

### Part 2 - Add signal handling to your program

To be a polite service, your program must handle SIGTERM properly. This means that when it receives SIGTERM, a signal handler runs and tells the process to close the file and stop running.

Python3 signals:  
  https://docs.python.org/3/library/signal.html  
  https://www.askpython.com/python-modules/python-signal

Other languages have similar guides.

Hint: it really helps to run and test your program by hand and test it out by sending it kill -TERM \<pid>. You can then have the signal handler print out a message when it gets the signal. 

When your program receives the SIGTERM signal, it needs to write out that it received the signal to the /tmp/currentCount.out file, *then* die using an OS exit (see: sys.exit() in Python).

Crandall: 2023-02-09 20:04:15 Recieved SIGTERM, exiting

Note: you should force a STDOUT flush after this write to the file to make sure it's written before your program exits. It *shouldn't* be a problem, but depending upon the language and timing it might be.
(see:  print("", flush=true) in python)
Every language has a way to force flush the buffers.


## Part 3 - systemd file & configuration

Once you have a program that does the counting and shuts down cleanly on a SIGTERM signal, then it's time to start making a systemd service file. This file is stubbed in as counter.service in this repository.

The systemd service needs to start up on boot. That means when your computer is restarted, and it reaches multi-user.target it will launch your counter service.

Your service file will need to have the [unit], [service], and [install] sections.

Here's a couple of example tutorials on how to get this setup.

https://www.shubhamdipt.com/blog/how-to-create-a-systemd-service-in-linux/

https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6

Feel free to search for other guides as required.

Once your counter.service file is installed in /lib/systemd/system/, you will be able to start & stop the service with system:  

```
sudo service counter start  
sudo service counter stop  
sudo service counter status  
```

To enable the service on boot, you'll need to use the systemctl enable command:  
https://documentation.suse.com/smart/linux/html/reference-systemctl-enable-disable-services/index.html


## Part 4 - Running your service as a 'counter' user

To make your service a real system service, it needs to run as a user account who is only for this service and has no other permissions on the system.

Creating this user is done with adduser, but with the --system option. That way the user won't have a home directory or the ability to login (shell is /usr/sbin/nologin):

https://unix.stackexchange.com/questions/233064/how-to-add-system-local-user-like-mysql-or-tomcat

Then, once you have your user account, you'll need to tell systemd to run your counter service as that user. There's lots of guides for this, but once you've got the account, it's pretty simple:

https://unix.stackexchange.com/questions/363098/running-a-systemd-service-as-a-user-other-than-root


## Part 5 - Showing the counter output via service and/or journalctl

Now that your service is up and running, look at the output and start taking screenshots.

Screenshots to take and include in your repository in the screenshots/ directory:

* Output of "sudo service counter status" showing your service is enabled and running
* Output of "tail -f /tmp/currentCount.out" showing the service working
* Output of running "sudo service counter stop" followed by "sudo service counter start"
* After stopping the service, show a screenshot of the /tmp/currentCount.out file with your signal handler note that you're shutting down the service

Snag those screenshots and put them in the screenshots/ directory of your repo and check them in.

Congratulations - you've got a working service!
