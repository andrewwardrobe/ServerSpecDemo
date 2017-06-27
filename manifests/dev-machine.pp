

$media_packages = ['vlc']
$util_packages = ['vim','curl','wget']
$dev_packages = ['openjdk-8-jdk','ruby','rubygems','ruby-dev','ruby-bundler','nodejs','npm']
$iac_packages = ['puppet','ansible','docker.io','docker-compose', 'puppet-lint']
$build_deps = ['linux-headers-generic']

$gems = ['bundle','serverspec','rails']

package{$media_packages:}
package{$util_packages:}
package{$dev_packages:}
package{$iac_packages:}
package{$build_deps:}

package{$gems:
  require  => Package[$dev_packages],
  provider => 'gem'
}


user {'andrew':
  gid     => 'andrew',
  groups  => ['adm', 'cdrom', 'sudo', 'dip', 'plugdev', 'lpadmin', 'sambashare', 'docker'],
  require => Package[$iac_packages],
}

