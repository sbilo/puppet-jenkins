# This resource installs a jenkins instance.
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# Sander Bilo <sander.bilo@gmail.com>
#
# === Copyright
#
define jenkins::instance (
    $instance = $name,
    $version  = 'RELEASE') {
    if (!defined(Tomcat::Instance[$instance])) {
        tomcat::instance { $instance: }
    }

    if ($version == 'RELEASE') {
        warning('Using \'RELEASE\' as version for Jenkins may have unwanted consequences, please specify a version number')
    }

    tomcat::webapp::maven { "${instance}:ROOT":
        webapp     => 'ROOT',
        instance   => $instance,
        groupid    => 'org.jenkins-ci.main',
        artifactid => 'jenkins-war',
        version    => $version,
        repos      => ['http://repo.jenkins-ci.org/releases'],
    }
}
