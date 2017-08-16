service 'httpd' do
    action [:enable, :start]
end

# Regla por defecto para el Firewall
service 'firewalld' do
        action [:enable, :start]
end

# Habilita el puerto 80 en el Firewall
execute 'allow_port_80' do
        command 'firewall-cmd --zone=public --add-port=80/tcp --permanent'
        action :run
end

# Reinicia el firewall
execute 'reload' do
        command 'firewall-cmd --reload'
        action :run
end

# Página de prueba del servicio
file '/var/www/html/index.html' do
        content '<html>
        <body>
                <h1>Página de prueba</h1>
                <h3>Taller 1 Vagrant Chef Cookboks</h3>
                <h3>Realizado por Mr. Nick</h3>
        </body>
        </html>'
end
