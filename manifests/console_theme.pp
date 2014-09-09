class openshift_origin::console_theme {

  exec { 'update openshift console production.rb':
    command   => 'sed -i "s/config.assets.precompile += %w(common.css origin.css members_form.css console.js modernizr.min.js)/config.assets.precompile += %w(common.css origin.css members_form.css console.js modernizr.min.js style.css script.js)/g" /var/www/openshift/console/config/environments/production.rb',
    unless    => 'grep -Fxq "config.assets.precompile += %w(common.css origin.css members_form.css console.js modernizr.min.js style.css script.js)" /var/www/openshift/console/config/environments/production.rb',
    notify  => Exec["Console gem dependencies"],
  }

  file { '/var/www/openshift/console/app/views/layouts/_head.html.haml':
    content => template('openshift_origin/console/theme/_head.html.haml.erb'),
    require     => Package['rubygem-openshift-origin-console'],
    notify      => Service['openshift-console'],
  }

  file { '/var/www/openshift/console/app/views/layouts/_footer.html.haml':
    content => template('openshift_origin/console/theme/_footer.html.haml.erb'),
    require     => Package['rubygem-openshift-origin-console'],
    notify      => Service['openshift-console'],
  }

  file { '/var/www/openshift/console/app/views/layouts/_console.html.haml':
    content => template('openshift_origin/console/theme/_console.html.haml.erb'),
    require     => Package['rubygem-openshift-origin-console'],
    notify      => Service['openshift-console'],
  }

  file { '/var/www/openshift/console/app/views/layouts/console/':
    ensure  => directory,
  }

  file { '/var/www/openshift/console/app/views/layouts/console/_header.html.haml':
    content => template('openshift_origin/console/theme/console/_header.html.haml.erb'),
    require     => Package['rubygem-openshift-origin-console'],
    notify      => Service['openshift-console'],
  }

  file { '/var/www/openshift/console/app/views/layouts/console/_identity.html.haml':
    content => template('openshift_origin/console/theme/console/_identity.html.haml.erb'),
    require     => Package['rubygem-openshift-origin-console'],
    notify      => Service['openshift-console'],
  }

  file { '/var/www/openshift/console/app/views/layouts/console/_javascripts.html.haml':
    content => template('openshift_origin/console/theme/console/_javascripts.html.haml.erb'),
    require     => Package['rubygem-openshift-origin-console'],
    notify      => Service['openshift-console'],
  }

  file { '/var/www/openshift/console/app/views/layouts/console/_stylesheets.html.haml':
    content => template('openshift_origin/console/theme/console/_stylesheets.html.haml.erb'),
    require     => Package['rubygem-openshift-origin-console'],
    notify      => Service['openshift-console'],
  }

  file { '/var/www/openshift/console/app/assets/stylesheets/style.css':
    content => template('openshift_origin/console/theme/style.css.erb'),
    notify  => Exec["Console gem dependencies"],
  }

  file { '/var/www/openshift/console/app/assets/javascripts/script.js':
    content => template('openshift_origin/console/theme/script.js.erb'),
    notify  => Exec["Console gem dependencies"],
  }

}
