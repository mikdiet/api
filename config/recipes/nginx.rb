namespace :nginx do
  def template(from, to)
    erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
    tmpl = ERB.new(erb).result(binding)
    upload! StringIO.new(tmpl), to
  end

  desc "Setup nginx configuration for this application"
  task :setup do
    on roles(:all) do
      template "nginx.erb", "/tmp/nginx_conf"
      sudo "mv /tmp/nginx_conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      invoke 'nginx:restart'
    end
  end

  %w[start stop restart].each do |command|
    desc "#{command} nginx"
    task command do
      on roles(:all) do
        sudo "service nginx #{command}"
      end
    end
  end
end
