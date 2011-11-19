dep('build essential installed') {
  requires [
    'build-essential.managed',
    'binutils-doc.managed',
    'autoconf.managed',
    'flex.managed',
    'bison.managed'
  ]
}

dep('build-essential.managed') {
  installs { via :apt, 'build-essential' }
  provides ['make', 'gcc']
}

