dep('workspace setup') {
  requires 'root bashrc.config_rendered', 'test_environment.config_rendered', 'bashrc.config_rendered', 'germrc.config_rendered', 'known hosts.config_rendered'
}

dep('root bashrc.config_rendered') {
  source 'workspace/root_dot_bashrc.erb'
  to '/root/.bashrc'
  render_args :sudo => true
}

dep('bashrc.config_rendered') {
  source 'workspace/dot_bashrc.erb'
  to '/home/ubuntu/.bashrc'
}

dep('test_environment.config_rendered') {
  source 'workspace/test_environment.sh.erb'
  to '/etc/profile.d/test_environment.sh'
  render_args :sudo => true

  after {
    shell "chown ubuntu:ubuntu /etc/profile.d/test_environment.sh", :sudo => true
    shell "chmod 0755 /etc/profile.d/test_environment.sh", :sudo => true
  }
}

dep('germrc.config_rendered') {
  source 'workspace/gemrc.erb'
  to '/home/ubuntu/.gemrc'
}

dep('known hosts.config_rendered') {
  before {
    shell "mkdir -p /home/ubuntu/.ssh"
    shell "chmod 0755 /home/ubuntu/.ssh"
  }

  source 'workspace/known_hosts.erb'
  to '/home/ubuntu/.ssh/known_hosts'

  after {
    shell "chmod 0600 /home/ubuntu/.ssh/known_hosts"
  }
}


meta :config_rendered do
  accepts_value_for :source
  accepts_value_for :to
  render_args :render_args, :default_render_args

  def default_render_args
    {:to => to}
  end

  template {
    met? { babushka_config? to }
    meet { render_erb source, render_args }
  }
end
