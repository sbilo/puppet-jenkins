puppet-jenkins
=============

Puppet code for deploying and configuring Jenkins in tomcat on Debian-like servers. It uses the proteon/tomcat module to do the heavy lifting (pulling the jenkins war from maven and installing/configuring tomcat)

Dependencies:

    'proteon/tomcat', '>=0.1.15'

Configure an instance
-------------------------
To create an instance of a jenkins installation, keep in mind that if you specify RELEASE / LATEST as version for the instance it will break your upgrade process.

    jenkins::instance { 'jenkins_1': 
        version => '1.540',
    }
    
Customize the tomcat installation
---------------------------------
To customize the settings of the tomcat installation create your own instance of tomcat and use that for the jenkins instance

    tomcat::instance { 'jenkins_2': 
        java_version => 'oracle_1_7_0',
        max_heap     => '4096m',
    }
    
    jenkins::instance { 'jenkins_2': 
        version => '1.540',
    }
    
For more advanced configuration see the proteon/tomcat module

Upgrading the jenkins installation
----------------------------------
Upgrading and downgrading should be as easy as changing the version number, the proteon/tomcat module will clean up your old ROOT and clear out the temp/work directories for you.